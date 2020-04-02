# CICD for BW6/BWCE


## Portainer
``
docker run -d -v "/var/run/docker.sock:/var/run/docker.sock" -p 9000:9000 --name portainer --restart always portainer/portainer:latest
``
## Gitlab
``
docker run -d --hostname macbook-pro-de-hicham.home -p 1443:443 -p 1080:80 -p 1022:22 --name gitlab --restart=on-failure:3 -v /opt/gitlab/config:/etc/gitlab -v /opt/gitlab/logs:/var/log/gitlab -v /opt/gitlab/data:/var/opt/gitlab gitlab/gitlab-ce:latest
``

Default user = root

## Prometheus
``
wget -o /opt/prometheus/prometheus.yml https://raw.githubusercontent.com/prometheus/prometheus/master/documentation/examples/prometheus.yml
``

``
docker run -d -p 9090:9090 -v /opt/prometheus:/etc/prometheus --name prometheus prom/prometheus:latest
``
## Graphana
``
docker run --user root -d -p 3000:3000 -e "GF_SECURITY_ADMIN_PASSWORD=admin" -v opt/graphana/grafana_db:/var/lib/grafana --name graphana grafana/grafana
``
## BWCE Docker

mvn clean package initialize docker:build

mvn clean package initialize docker:start



## Links
http://digitalsolutionsblog.com/how-to-install-gitlab-on-mac/
