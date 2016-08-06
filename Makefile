#https://stackoverflow.com/questions/23620827/envsubst-command-not-found-on-mac-os-x-10-8
#Location is directory where your server.pem is located
export LOCATION = /home/bmzhao/HAProxy

build:
	envsubst < haproxy_template.cfg > haproxy.cfg
	docker build -t='elastic_haproxy' .

run:
	docker run -d -p 5602:5602 -p 9400:9400 --name elastic_haproxy_container -v $(LOCATION):$(LOCATION):ro elastic_haproxy haproxy -f /usr/local/etc/haproxy/haproxy.cfg

remove:
	docker rm -f elastic_haproxy_container