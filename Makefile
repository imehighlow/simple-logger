.PHONY: help install install-dev test build clean publish

help:  ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install:  ## Install the package
	pip install .

install-dev:  ## Install the package in development mode
	pip install -e .

test:  ## Run tests
	python -c "from simple_logger import setup_logger; print('Package imported successfully!')"

build:  ## Build the package
	python -m build

clean:  ## Clean build artifacts
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info/
	rm -rf logs/
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete

publish-test:  ## Publish to Test PyPI
	twine upload --repository testpypi dist/*

publish:  ## Publish to PyPI
	twine upload dist/*

venv:  ## Create virtual environment
	python3 -m venv .venv
	@echo "Virtual environment created. Activate it with: source .venv/bin/activate"

setup: venv  ## Setup development environment
	@echo "Setting up development environment..."
	.venv/bin/pip install --upgrade pip
	.venv/bin/pip install -e .
	.venv/bin/pip install build twine
	@echo "Setup complete! Activate with: source .venv/bin/activate"
