json.extract! personal_info, :id, :first_name, :last_name, :first_name_read, :last_name_read, :date_of_birth, :sex, :postal_code, :address, :tel, :created_at, :updated_at
json.url personal_info_url(personal_info, format: :json)
