FactoryBot.define do
  factory :purchase_buyer do
    token         {"tok_abcdefghijk00000000000000000"}
    post_code     { "111-1111" }
    place_id      { 2 }
    city          {"丸丸市"}
    house_number  {"丸丸町"}
    building_name {"建物"}
    phone_number  {"1234567890"}

  end
end