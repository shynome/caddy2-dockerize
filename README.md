```sh
cd example
docker stack deploy -c docker-compose.yml main
cd caddy/tmpdocker
docker stack deploy $(ls *.yml |xargs -I {} echo -c {}) func
```
### Test
```sh
curl -H 'Host: test.local' http://127.0.0.1
curl -H 'Host: test2.local' http://127.0.0.1
curl -H 'Host: test3.local' http://127.0.0.1
```
```txt
# caddy 配置文件目录
# caddy 申请证书用到的目录
```