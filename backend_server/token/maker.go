package token

import "time"

type Maker interface {
	CreateToken(email string, phone string, name string, duration time.Duration) (string, error)
	VerifyToken(token string) (*Payload, error)
}
