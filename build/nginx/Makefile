TIMESTAMP=`date +%s`
SERVICE_HOSTNAME=oliver.dev
IMAGE=bba593552505

build:
	@cp assets/default_original assets/default
	@sed -i.bak s/SERVICE_HOSTNAME/"$(SERVICE_HOSTNAME)"/g assets/default
	@docker build --force-rm=true --rm=true --no-cache --tag=nginx:$(TIMESTAMP) .
	@rm assets/default assets/default.bak

run:
	@docker run -d -p 80:80 -p 443:443 "$(IMAGE)"

deploy:
	@docker push oliverlundquist/nginx:"$(IMAGE)"

add_cert:
	@sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ./assets/oliver.dev.pem
