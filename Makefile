# EOL has comment to prevent erroneous whitespace in variables
IMAGE = deploy-ssh#
VERSION = 1.3#
DOCKER_HUB_USERNAME = joshkeegan#

IMAGE_URL = $(DOCKER_HUB_USERNAME)/$(IMAGE)#

build:
	docker build --no-cache --pull -t $(IMAGE_URL):dev .
	
publish: build
	docker tag $(IMAGE_URL):dev $(IMAGE_URL):$(VERSION)
	docker tag $(IMAGE_URL):dev $(IMAGE_URL):latest
	
	docker push $(IMAGE_URL):$(VERSION)
	docker push $(IMAGE_URL):latest