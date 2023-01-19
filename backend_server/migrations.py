import pymongo
import os
from dotenv import load_dotenv

load_dotenv("app.env")

mongo_uri = os.environ.get("MONGO_URI")
db_name = os.environ.get("DB_NAME")

client = pymongo.MongoClient(mongo_uri)
db = client[db_name]

driversCollection = db["drivers"]
try:
    driversCollection.create_index("email", unique=True, name="email_index")
    print("Driver Index created")
except:
    print("Driver Index already exists")


passengersCollection = db["passengers"]
try:
    passengersCollection.create_index("email", unique=True, name="email_index")
    passengersCollection.create_index("phone", unique=True, name="phone_index")
    print("Passenger Index created")
except:
    print("Passengers Index already exists")


requestsCollection = db["requests"]
try:
    requestsCollection.create_index(
    [("email", pymongo.DESCENDING), ("ride_id", pymongo.ASCENDING)],
    unique=True
)
    print("Requests Index created")
except Exception as e:
    print(e)


ridesCollection = db["rides"]
try:
    ridesCollection.create_index([("geojson", pymongo.GEOSPHERE)])
    print("GeoJSON Index created")
except Exception as e:
    print(e)



notificationsCollection = db["notifications"]
try:
    notificationsCollection.create_index("timestamp", name="timestamp_index", expireAfterSeconds=172800)
    print("Notifications Index created")
except:
    print("Notifications Index already exists")

print("Migrations complete")