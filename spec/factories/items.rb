FactoryBot.define do
  factory :item do
      name              {"テスト"}
      introduction      {"テスト"}
      price             {500}
      
      postage_payer_id  {2}
      prefecture_id     {2}
      preparation_day_id{2}
      category_id       {2}
      condition_id      {2}
      
      association :user 
  
      after(:build) do |message|
        message.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
      end
  
  end
  
  end
  