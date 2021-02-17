package custom

import (
	// custom Caddy modules
	_ "github.com/caddy-dns/alidns"
	_ "github.com/caddy-dns/azure"
	_ "github.com/caddy-dns/cloudflare"
	_ "github.com/caddy-dns/digitalocean"
	_ "github.com/caddy-dns/dnspod"
	_ "github.com/caddy-dns/duckdns"
	_ "github.com/caddy-dns/route53"
	_ "github.com/caddy-dns/vultr"
	_ "github.com/shynome/caddy2-tmpdocker"
)
