package token

import (
	"testing"
	"time"

	"github.com/achintya-7/car_pooling_backend/utils"
	"github.com/stretchr/testify/require"
)

func TestPasetoMaker(t *testing.T) {
	maker, err := NewPasetoMaker(utils.RandomString(32))
	require.NoError(t, err)

	email := utils.RandomEmail()
	phone := utils.RandomString(10)
	name := utils.RandomString(10)
	duration := time.Hour

	issuedAt := time.Now()

	token, err := maker.CreateToken(email, phone, name, duration)
	require.NoError(t, err)
	require.NotEmpty(t, token)

	payload, err := maker.VerifyToken(token)
	require.NoError(t, err)
	require.NotEmpty(t, payload)

	require.NotZero(t, payload.ID)
	require.WithinDuration(t, issuedAt, payload.IssuedAt, time.Second*2)
}
