require 'spec_helper'

describe BattleMechsController do
  render_views
  
  describe "GET 'index'" do
    before(:each) do
      @bm1 = Factory(:battle_mech)
      bm2 = Factory(:battle_mech, :code => "LCT-1S")
      bm3 = Factory(:battle_mech, :code => "LCT-1M")
      
      @bms = [@bm1, bm2, bm3]
      
      30.times do
        @bms << Factory(:battle_mech, :code => Factory.next(:code))
      end
    end
    
    it "should be successful" do
      get :index
      response.should be_success
    end
    
    it "should have the right title" do
      get :index
      response.should have_selector("title", :content => "BattleMech list")
    end
    
    it "should have an element for each BattleMech" do
      get :index
      @bms[0..2].each do |bm|
        response.should have_selector("td", :content => bm.code + " " + bm.name)
      end
    end
    
    it "should paginate BattleMechs" do
      get :index
      response.should have_selector("div.pagination")
      response.should have_selector("span.disabled", :content => "Previous")
      response.should have_selector("a", :href => "/battle_mechs?page=2", :content => "2")
      response.should have_selector("a", :href => "/battle_mechs?page=2", :content => "Next")
    end
  end
  
  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
    
    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => "New BattleMech")
    end
    
    it "should have a code field" do
      get :new
      response.should have_selector("input[name='battle_mech[code]'][type='text']")
    end
    
    it "should have a name field" do
      get :new
      response.should have_selector("input[name='battle_mech[name]'][type='text']")
    end

    it "should have a mass field" do
      get :new
      response.should have_selector("input[name='battle_mech[mass]'][type='text']")
    end

    it "should have a power_plant field" do
      get :new
      response.should have_selector("input[name='battle_mech[power_plant]'][type='text']")
    end

  end
  
  describe "POST 'create'" do
    describe "failure" do
      before(:each) do
        @attr = { :code => "",
          :name => "",
          :mass => nil,
          :power_plant => ""
        }
      end
      
      it "should not create a battle_mech" do
        lambda do
          post :create, :battle_mech => @attr
        end.should_not change(BattleMech, :count)
      end
      
      it "should have the right title" do
        post :create, :battle_mech => @attr
        response.should have_selector("title", :content => "New BattleMech")
      end
      
      it "should render the 'new' page" do
        post :create, :battle_mech => @attr
        response.should render_template('new')
      end
    end
    
    describe "success" do
      before(:each) do
        @attr = { :code => "PXH-1",
          :name => "Phoenix Hawk",
          :mass => 45,
          :power_plant => "GM 270"
        }
      end
      
      it "should create a battle_mech" do
        lambda do
          post :create, :battle_mech => @attr
        end.should change(BattleMech, :count).by(1)
      end
      
      it "should redirect to the battle_mech show page" do
        post :create, :battle_mech => @attr
        response.should redirect_to(battle_mech_path(assigns(:battle_mech)))
      end
      
      it "should have a success message" do
        post :create, :battle_mech => @attr
        flash[:success].should =~ /new battlemech created/i
      end
    end
  end
  
  describe "GET 'edit'" do
    before(:each) do
      @battle_mech = Factory(:battle_mech)
    end
    
    it "should be successful" do
      get :edit, :id => @battle_mech
      response.should be_success
    end
    
    it "should have the right title" do
      get :edit, :id => @battle_mech
      response.should have_selector("title", :content => "Edit BattleMech")
    end
  end
  
  describe "PUT 'update'" do
    before(:each) do
      @battle_mech = Factory(:battle_mech)
    end
    
    describe "failure" do
      before(:each) do
        @attr = { :code => "",
          :name => "",
          :mass => nil,
          :power_plant => ""
        }
      end
      
      it "should render the 'edit' page" do
        put :update, :id => @battle_mech, :battle_mech => @attr
        response.should render_template('edit')
      end
      
      it "should have the right title" do
        put :update, :id => @battle_mech, :battle_mech => @attr
        response.should have_selector("title", :content => "Edit BattleMech")
      end
    end
    
    describe "success" do
      before(:each) do
        @attr = { :code => "TDR-5S",
          :name => "Thunderbolt",
          :mass => 65,
          :power_plant => "Magna 260"
        }
      end
      
      it "should change the BattleMech attributes" do
        put :update, :id => @battle_mech, :battle_mech => @attr
        @battle_mech.reload
        @battle_mech.code.should == @attr[:code]
        @battle_mech.name.should == @attr[:name]
        @battle_mech.mass.should == @attr[:mass]
        @battle_mech.power_plant.should == @attr[:power_plant]
      end
      
      it "should redirect to the BattleMech show page" do
        put :update, :id => @battle_mech, :battle_mech => @attr
        response.should redirect_to(battle_mech_path(@battle_mech))
      end
      
      it "should have a flash message" do
        put :update, :id => @battle_mech, :battle_mech => @attr
        flash[:success].should =~ /updated/i
      end
    end
  end
  
  describe "DELETE 'destroy'" do
    before(:each) do
      @bm = Factory(:battle_mech)
    end
    
    it "should destroy the BattleMech" do
      lambda do
        delete :destroy, :id => @bm
      end.should change(BattleMech, :count).by(-1)
    end
    
    it "should redirect to the BattleMechs page" do
      delete :destroy, :id => @bm
      response.should redirect_to(battle_mechs_path)
    end
  end
end
