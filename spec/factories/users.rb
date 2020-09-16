FactoryBot.define do
  factory :user do
    nickname {"susu"}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    birthday {Faker::Date.birthday(min_age: 5, max_age: 90)}
    last_name {Gimei.name.last.kanji}
    first_name {Gimei.name.first.kanji}
    reading_last {Gimei.name.last.katakana}
    reading_first {Gimei.name.first.katakana}

  end
end
