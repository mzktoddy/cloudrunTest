FROM node:20-alpine AS base

FROM base AS builder
RUN apk add --no-cache libc6-compat
RUN apk add sqlite-dev
ADD https://github.com/benbjohnson/litestream/releases/download/v0.3.8/litestream-v0.3.8-linux-amd64-static.tar.gz /tmp/litestream.tar.gz
RUN tar -C /usr/local/bin -xzf /tmp/litestream.tar.gz
WORKDIR /app
COPY . .
RUN npm ci && \
    npm run build && \
    npm prune --production

FROM node:20-alpine as runner

ENV NODE_ENV production
COPY --from=builder /next.config.mjs /next.config.js
COPY --from=builder /.next /.next
COPY --from=builder /node_modules /node_modules
COPY --from=builder /package.json /package.json
COPY --from=builder /database.db /database.db
COPY --from=builder /litestream.yml /etc/litestream.yml
COPY --from=builder /usr/local/bin/litestream /usr/local/bin/litestream
COPY --from=builder /run.sh /run.sh
CMD ["sh", "run.sh"]