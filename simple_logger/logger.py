from loguru import logger
import sys
from pathlib import Path

LOG_DIR = Path("logs")
LOG_DIR.mkdir(exist_ok=True)
LOG_FILE = LOG_DIR / "app.log"

def setup_logger(debug: bool = False):
    logger.remove()
    logger.add(
        LOG_FILE,
        level="DEBUG",
        rotation="10 MB",
        retention="7 days",
        compression="zip",
        enqueue=True,
        backtrace=True,
        diagnose=True,
        format="{time:YYYY-MM-DD HH:mm:ss} | {level} | {name} | {message}"
    )
    console_level = "DEBUG" if debug else "INFO"
    logger.add(
        sys.stderr,
        level=console_level,
        colorize=True,
        format="<green>{time:HH:mm:ss}</green> | <level>{level}</level> | {message}"
    )
    return logger
