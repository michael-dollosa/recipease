FactoryBot.define do
  factory :recipe do
    user { association(:user) }
    name { 'Adowbow' }
    slug { 'Adowbow-1232-sans' }
    img_url { 'https://www.alltimelow.com/sites/g/files/g2000006681/f/Sample-image10-highres.jpg' }
    instructions { 'One, he says one two three' }
    video_url { 'https://www.youtube.com/watch?v=h5TvuBzMrlA' }
  end
end
