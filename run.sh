#!/bin/sh
set -e

# コンテナ起動時に持っているSQLiteのデータベースファイルは、
# 後続処理でリストアに成功したら削除したいので、リネームしておく
if [ -f ./database.db ]; then
  mv ./database.db ./database.db.bk
fi

# Cloud Storage からリストア
litestream restore -if-replica-exists -config /etc/litestream.yml ./database.db

if [ -f ./database.db ]; then
  # リストアに成功したら、リネームしていたファイルを削除
  echo "---- Restored from Cloud Storage ----"
  rm ./database.db.bk
else
  # 初回起動時にはレプリカが未作成であり、リストアに失敗するので、
  # その場合には、冒頭でリネームしたdbファイルを元の名前に戻す
  echo "---- Failed to restore from Cloud Storage ----"
  mv ./database.db.bk ./database.db
fi

# メインプロセスに、litestreamによるレプリケーション、
# サブプロセスに Next.js アプリケーションを走らせる
exec litestream replicate -exec "npm start" -config /etc/litestream.yml
