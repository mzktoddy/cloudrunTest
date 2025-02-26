FROM node:20-alpine AS builder

RUN apk add --no-cache libc6-compat
RUN apk add sqlite-dev
ADD https://github.com/benbjohnson/litestream/releases/download/v0.3.8/litestream-v0.3.8-linux-amd64-static.tar.gz /tmp/litestream.tar.gz
RUN tar -C /usr/local/bin -xzf /tmp/litestream.tar.gz
WORKDIR /app
ENV NEXT_TELEMETRY_DISABLED 1
COPY . .
RUN npm ci && \
    npm run build && \
    npm prune --production

FROM node:20-alpine as runner

ENV NODE_ENV production
ENV NEXT_TELEMETRY_DISABLED 1
COPY --from=builder /next.config.js next.config.js
COPY --from=builder /.next .next
COPY --from=builder /public public
COPY --from=builder /node_modules node_modules
COPY --from=builder /package.json package.json
COPY --from=builder /data.db data.db
COPY --from=builder /litestream.yml /etc/litestream.yml
COPY --from=builder /usr/local/bin/litestream /usr/local/bin/litestream
COPY --from=builder /run.sh /run.sh
CMD ["sh", "run.sh"]
