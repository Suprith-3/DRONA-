import os
from supabase import create_client
from dotenv import load_dotenv

load_dotenv()
url = os.getenv('SUPABASE_URL')
key = os.getenv('SUPABASE_KEY')

if not url or not key:
    print("Missing Supabase credentials.")
    exit(1)

supabase = create_client(url, key)

print("Listing buckets...")
try:
    buckets = supabase.storage.list_buckets()
    for b in buckets:
        print(f"Bucket Name: {b.id}, Public: {b.public}")
except Exception as e:
    print(f"Error listing buckets: {e}")
