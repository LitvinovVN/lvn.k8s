## Traefik Metrics
1. Before we begin, lets cleanup the HTTP stack  `docker stack rm traefik` If you named you stack something else use your specified name. If you don't remember run `docker stack ls`
2. Open the `traefik.metrics.yml` file in your favorite editor and review the `Prometheus Metrics` section. The buckets Prometheus metrics buckets have been enabled for the different time series in seconds.

```yml
metrics:
  prometheus:
    buckets:
      - 0.1
      - 0.3
      - 1.2
      - 5.0
```
3. Start Traefik with `Metrics` enabled `docker stack deploy -c docker-compose.metrics.yml traefik`

**NOTE: This will take a couple minutes as Prometheus and Grafana need to download and start** 

4. Login to Promethes [prometheus.storage.achii.fvds.ru](http://prometheus.storage.achii.fvds.ru)
5. Review the available metrics imported into Prometheus by opening Graph and then click the dropdown and scroll to the bottom to find Traefik metrics
6. Login to Grafana [grafana.storage.achii.fvds.ru](http://grafana.storage.achii.fvds.ru)
7. Grafana user is `admin` and password is `foobar`