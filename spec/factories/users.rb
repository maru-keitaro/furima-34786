FactoryBot.define do
  factory :user do
    nickname             {"furima太朗"}
    email {Faker::Internet.free_email}
    # email                {"sample@gmail.com"}
    password             {"a123456"}
    encrypted_password   {"a123456"}
    family_name          {"ぜんかく"}
    first_name           {"ぜんかく"}
    family_name_kana     {"ゼンカクカナ"}
    first_name_kana      {"ゼンカクカナ"}
    birthday             {"1930-01-01"}
  end
end