FactoryBot.define do
  factory :order do
    token          {'tok_abcdefghijk00000000000000000'}
    post_code    {'123-4567'}
    prefecture_id  {2}
    city    {'大阪市'}
    house_number     {'1-1'}
    building_name  {'建物'}
    phone_number   {'09012345678'}

    association :user        
    association :item
  end
end
