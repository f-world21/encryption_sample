class PersonalInfo < ApplicationRecord
  include KmsKey

  enum gender: { male: 'M', female: 'F' }

  attr_encrypted :first_name,       key: :data_key, algorithm: 'aes-256-gcm'
  attr_encrypted :last_name,        key: :data_key, algorithm: 'aes-256-gcm'
  attr_encrypted :first_name_read,  key: :data_key, algorithm: 'aes-256-gcm'
  attr_encrypted :last_name_read,   key: :data_key, algorithm: 'aes-256-gcm'
  attr_encrypted :date_of_birth,    key: :data_key, algorithm: 'aes-256-gcm', marshal: true
  attr_encrypted :gender,           key: :data_key, algorithm: 'aes-256-gcm'
  attr_encrypted :postal_code,      key: :data_key, algorithm: 'aes-256-gcm'
  attr_encrypted :address,          key: :data_key, algorithm: 'aes-256-gcm'
  attr_encrypted :tel,              key: :data_key, algorithm: 'aes-256-gcm'

  has_many :personal_info_hashes

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :tel, presence: true

  after_create :save_hashes

  private
  def save_hashes
    raw_value = last_name + first_name
    personal_info_hashes.create!(
      field_name: 'last_name_and_first_name',
      hash_value: BCrypt::Engine.hash_secret(raw_value, ENV['HASH_SALT'])
    )
  end
end
