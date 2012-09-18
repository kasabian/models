require 'spec_helper'

describe Costomer do
      it { should have_db_column(:name) }
      it { should have_db_column(:age) }
      it { should have_db_column(:loyalty) }
      it { should have_many(:order) }
      it { should have_many(:item).through(:order) }
      it { should validate_presence_of(:age) }
      it { should validate_presence_of(:name) }


  before(:each) do
    @costomer = Costomer.new
  end


 it "should require name" do
  @costomer.name = nil
  @costomer.should_not be_valid
 end

 it "should valid data" do
   @costomer.name = "Vasiliy"
   @costomer.age = 23  
   @costomer.should be_valid
 end

 it "should return items" do
   @costomer = Costomer.create(:name=>"Vasiliy",:age=>23)
    
    7.times do |n|
      Item.create(:name=>"Nokia#{n}",:description=>'description#{n}',:cost=>9+n)
    end  
     items = Item.all
    
   items.each do |i|
     @order = @costomer.order.create(:item_id=>i.id)
   end 
    
   @costomer.return_items.count.should == 7

 end

 it "should return costomer with loyalty" do
   @costomer = Costomer.create(:name=>"Vasiliy",:age=>23)
   @costomer = Costomer.create(:name=>"Sergey",:age=>20) 
    
    7.times do |n|
      Item.create(:name=>"Nokia#{n}",:description=>'description#{n}',:cost=>9+n)
    end  
     
    items = Item.all
   items.each do |i|
     @order = @costomer.order.create(:item_id=>i.id)
   end 
    
   Costomer.loyalty.count.should == 1

 end

 


end
