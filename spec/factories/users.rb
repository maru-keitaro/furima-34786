FactoryBot.define do
  factory :user do
    nickname             {"furima太朗"}
    email                {"sample@gmail.com"}
    password             {"123456"}
    encrypted_password   {"123456"}
    family_name          {"ぜんかく"}
    first_name           {"ぜんかく"}
    family_name_kana     {"ゼンカクカナ"}
    first_name_kana      {"ゼンカクカナ"}
    birthday             {"1930-01-01"}
  end
end