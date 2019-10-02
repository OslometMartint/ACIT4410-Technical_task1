NAME   := "technical_project1/s331044"
TAG    := $(shell git log -1 --pretty=%H)
IMG    := ${NAME}:${TAG}
LATEST := ${NAME}:latest

build:
	@echo "tag: ${TAG}"
	@cd .. && docker build -t ${IMG} .
	@docker tag ${IMG} ${LATEST}
