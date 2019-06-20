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

  after_save :save_hashes

  private
  def save_hashes
    save_name_hash
    save_tel_hash
    save_address_hash
  end

  def save_name_hash
    raw_value = last_name + first_name
    pi_hash = personal_info_hashes.find_or_initialize_by(field_name: 'last_name_and_first_name')
    pi_hash.hash_value = BCrypt::Engine.hash_secret(raw_value, ENV['HASH_SALT'])
    pi_hash.save!
  end

  def save_tel_hash
    raw_value = tel
    pi_hash = personal_info_hashes.find_or_initialize_by(field_name: 'tel')
    pi_hash.hash_value = BCrypt::Engine.hash_secret(raw_value, ENV['HASH_SALT'])
    pi_hash.save!
  end

  def save_address_hash
    raw_value = address
    pi_hash = personal_info_hashes.find_or_initialize_by(field_name: 'address')
    pi_hash.hash_value = BCrypt::Engine.hash_secret(raw_value, ENV['HASH_SALT'])
    pi_hash.save!
  end
end
