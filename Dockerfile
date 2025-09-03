# Build
FROM node:17.8.0-alpine AS builder

WORKDIR /usr/share/nginx/html

RUN npm install -g sass

COPY . ./

RUN sass --style=compressed scss/styles.scss css/styles.css

# Release
FROM nginxinc/nginx-unprivileged:1.24

LABEL maintainer courseproduction@bcit.ca

WORKDIR /usr/share/nginx/html

# ./assets copied via init container
#
COPY --from=builder /usr/share/nginx/html/css ./css
COPY --from=builder /usr/share/nginx/html/js ./js
COPY --from=builder /usr/share/nginx/html/pages ./pages
COPY --from=builder /usr/share/nginx/html/favicon.ico ./
COPY --from=builder /usr/share/nginx/html/index.html ./
COPY --from=builder /usr/share/nginx/html/LICENSE ./
COPY --from=builder /usr/share/nginx/html/qa-checklist.md ./
