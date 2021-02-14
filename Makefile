all: build up

build:
	@docker build --tag=mh4nx7net/wowza-perpetual:4.8.0 .
up:
	@docker-compose up --detach
