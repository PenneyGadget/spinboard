FactoryGirl.define do
  factory :link do
    url "MyString"
    title "MyString"
    read_status false
    references ""
  end
  factory :user do
    email "penney@email.com"
    password "password"
  end
end
