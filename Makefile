.PHONY: test lint

.DEFAULT_GOAL := help

help: ## show options
	@grep -E '^[a-zA-Z_-{\.}]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

pre-lint: ## run prepare for lint
	@yarn global add markdownlint-cli

pre-pdf: ## run markdown to pdf
	@yarn global add markdown-pdf

lint: ## run static linter
	@markdownlint README.md

pdf: ## update pdf
	@markdown-pdf README.md
