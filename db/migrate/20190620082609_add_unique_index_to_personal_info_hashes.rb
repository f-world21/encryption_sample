class AddUniqueIndexToPersonalInfoHashes < ActiveRecord::Migration[5.2]
  def change
    add_index :personal_info_hashes, [:personal_info_id, :field_name], unique: true
  end
end
