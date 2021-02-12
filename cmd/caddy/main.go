package main

import (
	caddycmd "github.com/caddyserver/caddy/v2/cmd"

	// plug in Caddy modules here
	_ "github.com/caddyserver/caddy/v2/modules/standard"
	// custom Caddy modules here
	_ "shynome/caddy2/custom-modules"
)

func main() {
	caddycmd.Main()
}
