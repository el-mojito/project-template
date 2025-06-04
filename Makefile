.PHONY: help
.PHONY: all 
.PHONY: build test
.PHONY: clean clean_cache
.PHONY: project_setup install_hook

# Default target
.DEFAULT_GOAL := all

# Help target
help:
	@echo "Usage: make <regular_target>"
	@echo ""
	@echo "ADD USAGE DESCRIPTION"
	@echo ""
	@echo "Setup Targets:"
	@echo "  project_setup    : Run all following setup targets"
	@echo "  install_hook     : Install the pre-commit format hook"

all: build test

build:
	bazel build --verbose_failures //... --build_tag_filters=-quality

test:
	bazel test --test_output=errors --test_summary=terse //...

clean:
	bazel clean

clean_cache:
	bazel clean --expunge --async

# Target to set up the project workflow:
# --------------------------------------
project_setup: install_hook
install_hook:
	ln -sf ../../tools/pre-commit.hook .git/hooks/pre-commit
