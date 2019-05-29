class CreatePersonalInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_infos do |t|
      t.string :encrypted_first_name
      t.string :encrypted_first_name_iv
      t.string :encrypted_last_name
      t.string :encrypted_last_name_iv
      t.string :encrypted_first_name_read
      t.string :encrypted_first_name_read_iv
      t.string :encrypted_last_name_read
      t.string :encrypted_last_name_read_iv
      t.string :encrypted_date_of_birth
      t.string :encrypted_date_of_birth_iv
      t.string :encrypted_sex
      t.string :encrypted_sex_iv
      t.string :encrypted_postal_code
      t.string :encrypted_postal_code_iv
      t.string :encrypted_address
      t.string :encrypted_address_iv
      t.string :encrypted_tel
      t.string :encrypted_tel_iv
      t.binary :encrypted_data_key

      t.timestamps
    end
  end
end
