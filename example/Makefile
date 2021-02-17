proxy-reload:
	docker exec $$(docker ps --latest --filter label=com.docker.swarm.service.name=main_proxy --format='{{.ID}}') caddy reload -config /etc/caddy/Caddyfile
func-docker-deploy:
	cd caddy/tmpdocker && docker stack deploy $$(ls *.yml |xargs -I {} echo -c {}) func
