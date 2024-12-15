import os
from dotenv import load_dotenv

# Load environment variables from the .env file
load_dotenv()

class Settings:
    def __init__(self):
        # Load and validate environment variables
        self.DATABASE_URL = os.getenv("DATABASE_URL")
        self.LLM_API_KEY = os.getenv("LLM_API_KEY")
        self.REDIS_URL = os.getenv("REDIS_URL")
        self.SECRET_KEY = os.getenv("SECRET_KEY")
        self.ALGORITHM = os.getenv("ALGORITHM")
        self.ACCESS_TOKEN_EXPIRE_MINUTES = self._convert_to_int("ACCESS_TOKEN_EXPIRE_MINUTES")

        self._validate_settings()

    def _convert_to_int(self, key: str):
        """Convert environment variable to an integer or raise an error if missing/invalid."""
        value = os.getenv(key)
        if value is None:
            raise ValueError(f"Environment variable '{key}' is not set in .env")
        try:
            return int(value)
        except ValueError:
            raise ValueError(f"Environment variable '{key}' must be an integer")

    def _validate_settings(self):
        """Ensure critical settings are properly loaded."""
        if not self.DATABASE_URL:
            raise ValueError("Environment variable 'DATABASE_URL' is not set in .env")
        if not self.SECRET_KEY:
            raise ValueError("Environment variable 'SECRET_KEY' is not set in .env")
        if not self.ALGORITHM:
            raise ValueError("Environment variable 'ALGORITHM' is not set in .env")

# Instantiate settings for global access
settings = Settings()
