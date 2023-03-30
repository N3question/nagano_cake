class OrderDetail < ApplicationRecord
  
  belongs_to :order # アソシエーション
  belongs_to :item # アソシエーション
  
enum making_status: { 
  production_not_possible: 0,
  production_pending: 1,
  in_production: 2,
  production_complete: 3
}  

# add_tax_priceはpublic/orders_controller.rbの
# 54行目でつけているのでいらない。
def price_total
   price * amount
end

end
