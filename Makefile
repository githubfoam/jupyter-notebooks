
deploy-conda:
	bash scripts/deploy-conda.sh

push-image:
	docker push $(IMAGE)

.PHONY: deploy-vagrant deploy-libvirt 