import openai
from app.config import settings  # Corrected import to access LLM_API_KEY through settings

openai.api_key = settings.LLM_API_KEY  # Access the LLM_API_KEY through settings

def get_recommendations(user_input: str, products: list):
    # Using OpenAI GPT to generate recommendations
    prompt = f"Given these products: {products}, recommend a product based on the user's input: {user_input}"

    response = openai.Completion.create(
        engine="text-davinci-003",
        prompt=prompt,
        max_tokens=100
    )
    return response.choices[0].text.strip()
