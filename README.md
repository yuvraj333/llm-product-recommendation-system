# LLM Product Recommendation System

A FastAPI-based product recommendation system powered by OpenAI's GPT-3.5 engine. The project uses PostgreSQL for data storage, integrates caching mechanisms, and supports user authentication and feedback handling. The structure of the project is modular, making it scalable and easy to maintain.

## Project Structure

```plaintext
llm-product-recommendation/
├── app/
│   ├── __init__.py
│   ├── main.py
│   ├── models/
│   │   ├── __init__.py
│   │   ├── user.py
│   │   ├── product.py
│   │   ├── feedback.py
│   ├── schemas/
│   │   ├── __init__.py
│   │   ├── user.py
│   │   ├── product.py
│   │   ├── feedback.py
│   ├── routers/
│   │   ├── __init__.py
│   │   ├── product_routes.py
│   │   ├── user_routes.py
│   │   ├── feedback_routes.py
│   ├── database.py
│   ├── llm_engine.py
│   ├── cache.py
│   ├── auth.py
│   ├── config.py
├── tests/
│   ├── __init__.py
│   ├── test_main.py
│   ├── test_product.py
│   ├── test_user.py
│   ├── test_feedback.py
├── migrations/
│   └── README.md
├── .env
├── .gitignore
├── requirements.txt
├── README.md
```

## Features

- **FastAPI Framework**: A modern, fast (high-performance) web framework for building APIs.
- **OpenAI GPT-3.5 Integration**: Provides intelligent product recommendations.
- **PostgreSQL Database**: A robust and scalable relational database.
- **Authentication**: Secure user authentication and authorization.
- **Feedback System**: Collect and store user feedback for recommendations.
- **Caching**: Integrated caching for faster responses.
- **Modular Design**: Organized codebase with separate layers for models, schemas, routers, and utilities.

## Installation

### Prerequisites

- Python 3.9+
- PostgreSQL
- Git
- An OpenAI API key

### Steps

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/llm-product-recommendation-system.git
   cd llm-product-recommendation-system
   ```

2. Create a virtual environment and activate it:

   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```

3. Install dependencies:

   ```bash
   pip install -r requirements.txt
   ```

4. Set up the environment variables:

   Create a `.env` file in the root directory with the following contents:

   ```env
   DATABASE_URL=postgresql://username:password@localhost:5432/your_database
   OPENAI_API_KEY=your_openai_api_key
   SECRET_KEY=your_secret_key
   ```

5. Apply database migrations:

   ```bash
   alembic upgrade head
   ```

6. Run the FastAPI application:

   ```bash
   uvicorn app.main:app --reload
   ```

7. Access the API documentation at:

   - Swagger: `http://127.0.0.1:8000/docs`
   - Redoc: `http://127.0.0.1:8000/redoc`

## Usage

- **User Registration**: Users can sign up and log in to the system.
- **Product Recommendations**: Retrieve personalized product recommendations using GPT-3.5.
- **Feedback Submission**: Users can provide feedback, which improves recommendation quality.

## Running Tests

Ensure that all test dependencies are installed and the database is configured for testing.

```bash
pytest tests/
```

## Tech Stack

- **Backend**: FastAPI
- **Database**: PostgreSQL
- **AI Engine**: OpenAI GPT-3.5
- **Testing**: Pytest
- **Caching**: Redis (optional, based on `cache.py` integration)

## Contributing

1. Fork the repository.
2. Create a new branch for your feature:

   ```bash
   git checkout -b feature-name
   ```

3. Commit your changes and push to your branch:

   ```bash
   git commit -m "Description of your feature"
   git push origin feature-name
   ```

4. Create a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [FastAPI](https://fastapi.tiangolo.com/)
- [PostgreSQL](https://www.postgresql.org/)
- [OpenAI API](https://openai.com/api/)
