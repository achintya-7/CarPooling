import pymongo
import os
from dotenv import load_dotenv
import time

load_dotenv("app.env")

mongo_uri = os.environ.get("MONGO_URI")
db_name = os.environ.get("DB_NAME")

client = pymongo.MongoClient(mongo_uri)
db = client[db_name]

driversCollection = db["drivers"]
try:
    driversCollection.create_index("email", unique=True, name="email_index")
except:
    print("Driver Index already exists")


passengersCollection = db["passengers"]
try:
    passengersCollection.create_index("email", unique=True, name="email_index")
    passengersCollection.create_index("phone", unique=True, name="phone_index")
except:
    print("Passengers Index already exists")


requestsCollection = db["requests"]
try:
    requestsCollection.create_index([("email"), ("ride_id")], unique=True, name="driver_passenger_index")
except:
    print("Requests Index already exists")


ridesCollection = db["rides"]
try:
    ridesCollection.create_index("geojson", "2dsphere", name="geojson_index")
except:
    print("GeoJSON Index already exists")


notificationsCollection = db["notifications"]
try:
    notificationsCollection.create_index("timestamp", name="timestamp_index", expireAfterSeconds=172800)
except:
    print("Notifications Index already exists")

print("Migrations complete")