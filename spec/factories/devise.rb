FactoryBot.define do
  factory :user do
    id {1}
    display_name {"User Login Test"}
    email {"login_test@user.com"}
    password {"somethingaboutpassword"}
  end
end