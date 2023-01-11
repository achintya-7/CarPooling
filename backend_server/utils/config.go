package utils

import (
	"time"

	"github.com/spf13/viper"
)

type Config struct {
	MongoUri            string        `mapstructure:"MONGO_URI"`
	DBName              string        `mapstructure:"DB_NAME"`
	ServerAddress       string        `mapstructure:"SERVER_ADDRESS"`
	TokenSecret         string        `mapstructure:"TOKEN_SECRET"`
	AccessTokenDuration time.Duration `mapstructure:"ACCESS_TOKEN_DURATION"`
	MapsKey             string        `mapstructure:"MAPS_KEY"`
}

func LoadConfig(path string) (config Config, err error) {
	viper.AddConfigPath(path)
	viper.SetConfigName("app")

	viper.AutomaticEnv()

	err = viper.ReadInConfig()
	if err != nil {
		return
	}

	err = viper.Unmarshal(&config)
	return config, err
}
