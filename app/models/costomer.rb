class Costomer < ActiveRecord::Base
  validates :age, :presence => true
  validates :name, :presence => true
 
  attr_accessible :age, :name

  has_many :order
  has_many :item, :through => :order
  # программа лояльности
  def  self.loyalty  
    arr=[]
    order= Order.where('created_at > ?', 90.days.ago)
    
    order.each do |i| 
        costomer = Costomer.find_by_id(i.costomer_id)
       arr << costomer if  costomer.loyalty >= 2
    end   
 
    arr.uniq    
       
  end

 #вернуть все итемсы которые купил данный покупатель
  def return_items
     order_item = self.item.all
  end

end
