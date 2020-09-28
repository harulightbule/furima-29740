FactoryBot.define do
  factory :item_user_address do
    postal_code { '123-0052' }
    prefecture { 2 }
    city       { '名古屋市' }
    house_number {'1-1'}
    building_name {'朝日マンション'}
    phone_number { '09012345678' }
    token        { '00000000000' }
  end
end
