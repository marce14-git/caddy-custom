FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/WeidiDeng/caddy-cloudflare-ip \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/hslatman/caddy-crowdsec-bouncer \
    --with github.com/greenpau/caddy-security \
    --with github.com/jdxgfty/caddy-bandwidth

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
