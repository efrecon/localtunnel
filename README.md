# localtunnel

This is a minimal docker image for the [localtunnel](https://localtunnel.me/)
client based on Alpine linux. `localtunnel` exposes your localhost to the world
for easy testing and sharing. More information can be found
[here](https://github.com/localtunnel/localtunnel). All options passed to the
container are passed further to the client. The list of options is as follows
(taken directly from the client
[code](https://github.com/localtunnel/localtunnel/blob/master/bin/client)):

* `--host`: Upstream server providing forwarding
* `--subdomain`: Request this subdomain
* `--local-host`: Tunnel traffic to this host instead of localhost, override Host header to this host
* `--open`: opens url in your browser
* `--port`: Internal http server port

To use this from docker, create a web server container, link to that container
from the localtunnel container and specify the port and host of the web
container using the `--local-host` and `--port` options. So, in other words,
write according to the following skeleton if you were using
[compose](https://docs.docker.com/compose/). Note that you should use the
internal port (not the mapped port) when referring to the web container.

````
webserver:
  [your web config]
localtunnel:
  image: efrecon/localtunnel
  links:
    - webserver
  command:
    --local-host webserver --port 80
````
