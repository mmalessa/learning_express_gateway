# Learning Express Gateway
https://www.express-gateway.io/

## Kickstart
```shell
make build
make init
make up
```
### Express gateway
- http://localhost:8080/web0 -> to webserver1/2 (round-robin)
- http://localhost:8080/web1 -> to webserver1
- http://localhost:8080/web2 -> to webserver2

### Exposed webservers
- http://localhost:8081
- http://localhost:8082