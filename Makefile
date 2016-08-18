# make configs taken from kubernetes
DBG_MAKEFILE ?=
ifeq ($(DBG_MAKEFILE),1)
    $(warning ***** starting Makefile for goal(s) "$(MAKECMDGOALS)")
    $(warning ***** $(shell date))
else
    # If we're not debugging the Makefile, don't echo recipes.
    MAKEFLAGS += -s
endif
# It's necessary to set this because some environments don't link sh -> bash.
SHELL := /bin/bash
# We don't need make's built-in rules.
MAKEFLAGS += --no-builtin-rules

# constants
IMAGENAME='stefancocora/archlinux-nginx-mainline'
VERSION := 'v1.11.3-1'
CONTAINERNAME := 'nginx'

# Metadata for driving the build lives here.
META_DIR := .make

.PHONY: help build interactive curl removec removei tag

# define a catchall target
# default: build
default: help

help:
	@echo "---> Help menu:"
	@echo "supported make targets:"
	@echo ""
	@echo "---"
	@echo ""
	@echo "Help output:"
	@echo "  make help"
	@echo ""
	@echo "Build the container fs:"
	@echo "  make build"
	@echo ""
	@echo "Testing the image interactively:"
	@echo "  make interactive"
	@echo ""
	@echo "Testing webserver:"
	@echo "  make curl"
	@echo ""
	@echo "Stopping the container:"
	@echo "  make removec"
	@echo ""
	@echo "Removing the image:"
	@echo "  make removei"
	@echo ""


build:
	@echo "--> Building ..."
	util/build.sh $(VERSION)

interactive:
	@echo "---> Running interactively ..."
	docker run --rm --name $(CONTAINERNAME) -v ${PWD}/test/nginx.conf:/etc/nginx/conf/simplenginx.conf -e NGINX_CONFIG_FILE=/etc/nginx/conf/simplenginx.conf --rm $(IMAGENAME):$(VERSION)

curl:
	@echo "---> Testing the webserver ..."
	util/curl.sh

removec:
	@echo "---> Stopping and removing the container ..."
	docker kill $(CONTAINERNAME)

removei:
	@echo "---> Removing the image ..."
	docker rmi $(IMAGENAME):$(VERSION)

tag:
	@echo "---> tagging the git repo"
	@echo "not implemented yet"
