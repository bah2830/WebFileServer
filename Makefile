APP_NAME := web-file-server
RUN_FLAG = -d --restart=always

build:
	docker build -t $(APP_NAME) .

debug: build remove_container
	$(eval RUN_FLAG = --rm)
	$(call run)

deploy: build remove_container
	$(call run)

remove_container:
	-docker rm -f $(APP_NAME)

define run
	docker run $(RUN_FLAG) --name $(APP_NAME) \
		-p 80:80 \
		-p 443:443 \
		-v $(pwd)/www:/www \
		$(APP_NAME)
endef