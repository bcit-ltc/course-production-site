# Dart stage
FROM bufbuild/buf AS buf
FROM dart:stable AS builder

# Add your scss files
COPY . /app

# Include Protocol Buffer binary
COPY --from=buf /usr/local/bin/buf /usr/local/bin/

WORKDIR /dart-sass
RUN git clone https://github.com/sass/dart-sass.git . && \
  dart pub get && \
  dart run grinder protobuf
# This is where you run sass.dart on your scss file(s)
RUN dart ./bin/sass.dart /app/scss/styles.scss /app/css/styles.css

## Clean
FROM nginx:alpine AS cleaner

WORKDIR /app

RUN rm -rf ./*

COPY --from=builder /app/css ./css/
COPY --from=builder /app/js ./js/
COPY --from=builder /app/assets ./assets/
COPY --from=builder /app/pages ./pages/
COPY --from=builder /app/favicon.ico ./
COPY --from=builder /app/index.html ./
COPY --from=builder /app/qa-checklist.md ./

# Dev
FROM ustwo/browser-sync AS dev

COPY --from=cleaner /app /source

## Release/production
FROM nginxinc/nginx-unprivileged:alpine3.22-perl

LABEL maintainer=courseproduction@bcit.ca
LABEL org.opencontainers.image.source="https://github.com/bcit-ltc/course-production-site"
LABEL org.opencontainers.image.description="course-production-site is the public landing page to course production services and resources."

WORKDIR /usr/share/nginx/html

COPY --from=cleaner /app ./
