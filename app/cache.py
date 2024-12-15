import aioredis
from app.config import settings

# Function to create a Redis connection asynchronously
async def get_redis_connection():
    return await aioredis.create_redis(
        settings.REDIS_URL, 
        encoding="utf-8"
    )

# Get the Redis connection inside your functions
async def get_cached_recommendations(user_id: str):
    redis = await get_redis_connection()
    try:
        return await redis.get(user_id)
    finally:
        redis.close()
        await redis.wait_closed()

async def set_cached_recommendations(user_id: str, recommendations: str):
    redis = await get_redis_connection()
    try:
        await redis.set(user_id, recommendations, expire=3600)  # Cache for 1 hour
    finally:
        redis.close()
        await redis.wait_closed()
