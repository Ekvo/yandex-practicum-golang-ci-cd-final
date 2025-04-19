package services

import (
	"github.com/Ekvo/yandex-practicum-golang-ci-cd-final/internal/source"
)

type ParcelService struct {
	store source.ParcelStore
}

func NewParcelService(store source.ParcelStore) ParcelService {
	return ParcelService{store: store}
}
