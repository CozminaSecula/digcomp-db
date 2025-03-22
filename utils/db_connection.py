import psycopg2
from psycopg2.extras import DictCursor
from dotenv import load_dotenv
import os
import pandas as pd

load_dotenv()

def get_db_connection():
    """Create a database connection"""
    return psycopg2.connect(
        dbname=os.getenv('DB_NAME'),
        user=os.getenv('DB_USER'),
        password=os.getenv('DB_PASSWORD'),
        host=os.getenv('DB_HOST'),
        port=os.getenv('DB_PORT', '5432')
    )

def query_to_dataframe(query: str) -> pd.DataFrame:
    """Execute query and return results as pandas DataFrame"""
    with get_db_connection() as conn:
        return pd.read_sql(query, conn)
