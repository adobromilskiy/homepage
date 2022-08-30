.PHONY: help
## help: prints this help message
help:
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

.PHONY: srv
## srv: runs docker nginx container with mounted html on port 80
srv:
	@docker build -t homepage . && docker run --rm -p 80:80 -v `pwd`/html:/usr/share/nginx/html homepage
