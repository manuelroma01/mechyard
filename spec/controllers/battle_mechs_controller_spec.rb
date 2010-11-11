require 'spec_helper'

describe BattleMechsController do
  render_views
  
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'new'
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
        post :create, :user => @attr
        response.should have_selector("title", :content => "New BattleMech")
      end
      
      it "should render the 'new' page" do
        post :create, :user => @attr
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
end
