FactoryBot.define do
    factory :user do
        nickname {Faker::Name}
        email {Faker::Internet.free_email}
        password { '1a'+Faker::Internet.password(min_length: 6)}
        password_confirmation {password}
        surname {"山田"}
        name {"隆太郎"}
        furigana_surname {"ヤマダ"}
        furigana_name {"リクタロウ"}
        date_of_birth {"1990/01/06"}
    end
end   