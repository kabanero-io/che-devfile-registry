# The Docker image in format repository:tag. Repository may contain a remote reference.
# Override in order to customize.  Override to build (my fork and branch) and push to my private docker hub account
IMAGE ?= kabanero/che-devfile-registry:nightly

# Computed repository name (no tag) including repository host/path reference
REPOSITORY=$(firstword $(subst :, ,${IMAGE}))

.PHONY: build build-image push-image

build:
	./build/scripts/pull_devfile.sh $(TRAVIS_TAG)

build-image:
	./build.sh

push-image:
ifneq "$(IMAGE)" "che-devfile-registry:nightly"
	# Default push
	docker push $(IMAGE)
endif

# tag and push if tagged for release in git
ifdef TRAVIS_TAG
	# This is a Travis tag build. Pushing using Docker tag TRAVIS_TAG
	docker tag $(IMAGE) $(REPOSITORY):$(TRAVIS_TAG)
	docker push $(REPOSITORY):$(TRAVIS_TAG)
	docker push $(REPOSITORY):latest
endif
