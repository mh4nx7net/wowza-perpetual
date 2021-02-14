all: build

build:
	@docker build --tag=mh4nx7net/wowza-perpetual:4.8.0 .
