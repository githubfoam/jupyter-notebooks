
deploy-conda-latest:
	bash scripts/deploy-conda-latest.sh

deploy-conda:
	bash scripts/deploy-conda.sh

push-image:
	docker push $(IMAGE)

.PHONY: deploy-vagrant deploy-libvirt 