VERSION=1.0.1
PROJECT_NAME=demroos/symfony-nginx

release: build push

build:
	@docker build -t $(PROJECT_NAME):latest --no-cache .
	@docker tag $(PROJECT_NAME):latest $(PROJECT_NAME):$(VERSION)

push: login
	@docker push $(PROJECT_NAME):latest
	@docker push $(PROJECT_NAME):$(VERSION)

login:
	docker login -u=demroos
