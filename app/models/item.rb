class Item < ActiveRecord::Base
  attr_accessible :cost, :description, :name

  validates :cost, :presence => true, 
                    :format => { :with => /(^[0-9]{1,8}|(^[0-9]{1,8}\.{0,1}[0-9]{1,2}))$/}


  validates :name, :presence => true,
                    :length => { :minimum => 5 }
  validates :description, :presence => true,
                    :length => { :minimum => 5 }
 
  has_many :order

  # топовые елементы
  scope :top_item, lambda {|arg| where("popular >= ?",arg)} 
  
end
