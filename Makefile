
build:	
	DATE_INFO=$(date '+%Y%m%d')
	REPO_NAME="threathunt"
    IMAGE_NAME="jpnb
	docker build --build-arg JUPYTER_NB_PASS=$$JUPYTER_NB_PASS -t $(REPO)/$(IMAGE_NAME):dev .

deploy-conda-latest:
	bash scripts/deploy-conda-latest.sh

deploy-conda:
	bash scripts/deploy-conda.sh

push-image:
	docker push $(IMAGE)

.PHONY: deploy-vagrant deploy-libvirt 