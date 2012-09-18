class HomeController < ApplicationController
  

  def index
 
  Costomer.create('name'=>params[:name],
  'age'=>params[:age])                    if params[:commit] != nil 
  
  Item.create('name'=>params[:name_item],
   'description'=>params[:description],
   'cost'=>params[:cost]  
        )                                 if params[:commit_item] != nil 

  

  #@order = Order.new
  #@order.costomer_id=1
  #@order.save
  #@order.order_item.create(:item_id=>4)
  #@item=Item.top_item(2)   
  
  #@costomer= Costomer.find_by_id(7)
  #@costomer = Costomer.find_by_id(5)

  @costomer = Costomer.create(:name=>"Nindja5",:age=>23)
  @order = @costomer.order.create
  @item = @costomer.item.create(:name=>"name",:description=>"description",:cost=>10.10) 
  @costomer.save
  #@items = Item.top_item(3) 
  #@costomer.order.create(:item_id=>'4')
 
  #@items = Costomer.loyalty 
   
   
  #@order.save
  #@order.order_item.create(:item_id=>3)
 

 end
end
