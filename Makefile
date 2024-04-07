##@ Help
help:                ## Shows this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: help

##@ Development
install:		## Installs the dependencies
	npm install

api:		## Runs the database
	nodemon server/index.js

clean: 		## Cleans the build folder
	rm -rf .parcel-cache dist

front:		## Runs the frontend
	npx parcel client/index.html --port 3000