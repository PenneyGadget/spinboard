FactoryGirl.define do
  factory :link do
    url "https://www.facebook.com/"
    title "Favorite cat videos"
    read_status false
  end

  factory :user do
    name "Penney"
    email "penney@email.com"
    password "password"
  end
end
