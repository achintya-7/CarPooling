package models

type NotificationModel struct {
	Email       string `json:"email" bson:"email"`
	SenderPhone string `json:"sender_phone" bson:"sender_phone"`
	SenderName  string `json:"sender_name" bson:"sender_name"`
	Type        int    `json:"type" bson:"type"`
	Content     string `json:"content" bson:"content"`
	Timestamp   int64  `json:"timestamp" bson:"timestamp"`
}
