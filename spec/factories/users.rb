FactoryBot.define do
    factory :user do
        nickname {Faker::Nickname}
        email {Faker::Internet.free_email}
        password = Faker::Internet.password(min_length: 6)
        password {password}
        password_confimation {password}
        surname {surname}
        name {name}
        furigana_surname {furigana_surname}
        furigana_name {furigana_name}
        date_of_birth {date_of_birth}
    end
end   