FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2022-09-17 14:34:06" }
  end
end
