.DEFAULT_GOAL := help

.PHONY: help
help: ## Show this help
	@echo ""
	@echo "Specify a command. The choices are:"
	@echo ""
	@grep -hE '^[0-9a-zA-Z_-]+:.*?## .*$$' ${MAKEFILE_LIST} | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[0;36m%-20s\033[m %s\n", $$1, $$2}'
	@echo ""

.PHONY: dev
dev: ## Start the Hugo development server
	hugo server

.PHONY: build
build: ## Build the site for production
	hugo build --gc --minify
