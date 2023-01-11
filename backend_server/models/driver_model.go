package models

type CreateDriverRequest struct {
	Car        string `bson:"car" json:"car" binding:"required"`
	Seats      int    `bson:"seats" json:"seats" binding:"required"`
	Experience int    `bson:"experience" json:"experience" binding:"required"`
}

type CreateDriverResponse struct {
	Car        string `bson:"car" json:"car" binding:"required"`
	Seats      int    `bson:"seats" json:"seats" binding:"required"`
	Experience int    `bson:"experience" json:"experience" binding:"required"`
	Email      string `bson:"email" json:"email" binding:"required"`
	Phone      string `bson:"phone" json:"phone" binding:"required"`
	Name       string `bson:"name" json:"name" binding:"required"`
}

type UpdateDriverRequest struct {
	Car        string `bson:"car" json:"car" binding:"required"`
	Seats      int    `bson:"seats" json:"seats" binding:"required"`
	Experience int    `bson:"experience" json:"experience" binding:"required"`
}

