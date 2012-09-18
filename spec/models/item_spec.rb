require 'spec_helper'

describe Item do
  it { should have_db_column(:name) }
  it { should have_db_column(:cost) }
  it { should have_db_column(:description) }
  it { should have_db_column(:popular) }
  it { should have_many(:order) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:cost) }
  

  it "should accommodate 2 decimals not valid" do 
   Item.create(:name=>"Nokia",:description=>'description',:cost=>7878.7878)
   item = Item.all
   item.count.should_not == 0
  end
  
  it "should accommodate 2 decimals valid" do 
   Item.create(:name=>"Nokia",:description=>'description',:cost=>78.98)
   item = Item.all
   item.count.should == 1
  end

 
  it "should return top_item" do
    Item.create(:name=>"Nokia",:description=>'description',:cost=>9.00)
    Item.create(:name=>"Samsung",:description=>'description',:cost=>10.00)  
    costomer = Costomer.create(:name=>"Dima",:age=>22)
   
    item = Item.find_by_id(1)
     
    7.times do
     costomer.order.create(:item_id=>item.id)   
    end
   
   item = Item.find_by_id(2)
     
    3.times do
     costomer.order.create(:item_id=>item.id)   
    end
   
   item = Item.top_item(3)
   item.count.should == 2  
   
  end

end
