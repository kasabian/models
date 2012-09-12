class Order < ActiveRecord::Base
  attr_accessible :cost_date, :costomer_id, :item_id
  
  belongs_to :costomer 
  belongs_to :item 
 
  validates :costomer_id, :presence => true
  validates :item_id, :presence => true
  

  after_create :add_items # после сохранения проверяю купленые итемс и ++ популярные товары


  private
#**************************************************************
 def add_items # колбек для установки популярности товара

  # забираю итемсы по последнему id order
   order = Order.order('id desc').first
   
   
   
   # по item_id выбираю items и приплюсовываю loyalty
       m=Costomer.find_by_id(order.costomer_id)
       m.loyalty=0 if m.loyalty == nil
       m.loyalty+=1 if m.loyalty != nil
       m.save


    # по item_id выбираю items и приплюсовываю popular 
       m=Item.find_by_id(order.item_id)
       m.popular=1 if m.popular == nil
       m.popular+=1 if m.popular != nil
       m.save

 end

#**************************************************************

  


end
