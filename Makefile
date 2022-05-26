
build:	
	DATE_INFO=$(date '+%Y%m%d')
	REPO_NAME="threathunt"
    IMAGE_NAME="jpnb"
	docker build  -t $(REPO)/$(IMAGE_NAME:latest

deploy-conda-latest:
	bash scripts/deploy-conda-latest.sh

deploy-conda:
	bash scripts/deploy-conda.sh

push-image:
	docker push $(IMAGE)

.PHONY: deploy-vagrant deploy-libvirt 