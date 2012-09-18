require 'spec_helper'

describe Order do
   it { should have_db_column(:costomer_id) }
   it { should have_db_column(:item_id) }
   it { should belong_to(:costomer) }
   it { should belong_to(:item) }

end
