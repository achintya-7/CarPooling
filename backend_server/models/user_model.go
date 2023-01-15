package models

type CreatePassengerRequest struct {
	Email      string `bson:"email,unique" json:"email" binding:"required"`
	Phone      string `bson:"phone,unique" json:"phone" binding:"required,max=10,min=10"`
	Name       string `bson:"name" json:"name" binding:"required"`
	Address    string `bson:"address" json:"address" binding:"required"`
	City       string `bson:"city" json:"city" binding:"required"`
	State      string `bson:"state" json:"state" binding:"required"`
	Pincode    string `bson:"pincode" json:"pincode" binding:"required,max=6,min=6"`
	FirebaseID string `bson:"firebase_id,unique" json:"firebase_id" binding:"required"`
	Gender     string `bson:"gender" json:"gender" binding:"required"`
}

type CreatePassengerResponse struct {
	Email      string `bson:"email,unique" json:"email" binding:"required"`
	Phone      string `bson:"phone,unique" json:"phone" binding:"required,max=10,min=10"`
	Name       string `bson:"name" json:"name" binding:"required"`
	Address    string `bson:"address" json:"address" binding:"required"`
	City       string `bson:"city" json:"city" binding:"required"`
	State      string `bson:"state" json:"state" binding:"required"`
	Pincode    string `bson:"pincode" json:"pincode" binding:"required,max=6,min=6"`
	FirebaseID string `bson:"firebase_id,unique" json:"firebase_id" binding:"required"`
	Token      string `bson:"token,unique" json:"token"`
	Gender     string `bson:"gender" json:"gender" binding:"required"`
}

type CreatePassengerResponse2 struct {
	Email      string `bson:"email,unique" json:"email" binding:"required"`
	Phone      string `bson:"phone,unique" json:"phone" binding:"required,max=10,min=10"`
	Name       string `bson:"name" json:"name" binding:"required"`
	Address    string `bson:"address" json:"address" binding:"required"`
	City       string `bson:"city" json:"city" binding:"required"`
	State      string `bson:"state" json:"state" binding:"required"`
	Pincode    string `bson:"pincode" json:"pincode" binding:"required,max=6,min=6"`
	FirebaseID string `bson:"firebase_id,unique" json:"firebase_id" binding:"required"`
	Token      string `bson:"token,unique" json:"token"`
}

type UpdatePassengerRequest struct {
	Name    string `bson:"name" json:"name" binding:"required"`
	Phone   string `bson:"phone" json:"phone" binding:"required,max=10,min=10"`
	Address string `bson:"address" json:"address" binding:"required"`
	City    string `bson:"city" json:"city" binding:"required"`
	State   string `bson:"state" json:"state" binding:"required"`
	Pincode string `bson:"pincode" json:"pincode" binding:"required,max=6,min=6"`
}

type LostTokenRequest struct {
	Email      string `bson:"email" json:"email" binding:"required"`
	FirebaseID string `bson:"firebase_id" json:"firebase_id" binding:"required"`
}
