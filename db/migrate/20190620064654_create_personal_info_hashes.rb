class CreatePersonalInfoHashes < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_info_hashes do |t|
      t.references :personal_info, foreign_key: true, index: true
      t.string :field_name
      t.string :hash_value, index: true

      t.timestamps
    end
  end
end
