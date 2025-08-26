# Simple Logger

A simple logging utility with file and console output.

## Installation

```bash
# Install from PyPI (when published)
pip install simple-logger

# Install from GitHub
pip install git+https://github.com/imehighlow/simple-logger.git

# Install from local source
git clone https://github.com/imehighlow/simple-logger.git
cd simple-logger
pip install .
```

## Quick Start

```python
from simple_logger import setup_logger

logger = setup_logger()
logger.info("Starting process")
logger.debug("Debug information")
logger.warning("Warning message")
logger.error("Error occurred")
```

## Configuration

```python
# Default configuration (INFO level for console, DEBUG for file)
logger = setup_logger()

# Enable debug mode (DEBUG level for both console and file)
logger = setup_logger(debug=True)
```

## Features

- File logging with rotation, compression, and retention
- Console logging with colored output
- Simple one-line setup
- Configurable log levels

## Development

```bash
# Install in development mode
pip install -e .

# Build package
python -m build

# Clean build artifacts
make clean
```

