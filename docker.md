# docker common cmds

`systemctl start docker`

`docker container ls -a`

`docker start <NAME>`

`docker stop <NAME>`

`docker rm <NAME>`

`docker logs <NAME>`

---

## common errors

exit(255) -> disable SElinux -> worked!

---

## dbms on docker is very slow

turning off internet connection! why? who knonws! but it works

---

## example start

container with mssql as localhost

`docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=root" -p 1433:1433 -d containermssql`
