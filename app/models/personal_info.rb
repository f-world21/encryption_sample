class PersonalInfo < ApplicationRecord
  include KmsKey

  enum sex: { male: 'M', female: 'F' }

  attr_encrypted :first_name,       key: :data_key, algorithm: 'aes-256-gcm'
  attr_encrypted :last_name,        key: :data_key, algorithm: 'aes-256-gcm'
  attr_encrypted :first_name_read,  key: :data_key, algorithm: 'aes-256-gcm'
  attr_encrypted :last_name_read,   key: :data_key, algorithm: 'aes-256-gcm'
  attr_encrypted :date_of_birth,    key: :data_key, algorithm: 'aes-256-gcm', marshal: true
  attr_encrypted :sex,              key: :data_key, algorithm: 'aes-256-gcm'
  attr_encrypted :postal_code,      key: :data_key, algorithm: 'aes-256-gcm'
  attr_encrypted :address,          key: :data_key, algorithm: 'aes-256-gcm'
  attr_encrypted :tel,              key: :data_key, algorithm: 'aes-256-gcm'

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :sex, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :tel, presence: true
end
