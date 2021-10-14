FactoryBot.define do
  factory :recipe do
    user { association(:user) }
    name { "Adowbow" }
    slug { "Adowbow-1232-sans"}
    img_url { "https://www.google.comd" }
    instructions { "One, he says one two three" }
    video_url { "https://www.google.comd" }
  end
end
