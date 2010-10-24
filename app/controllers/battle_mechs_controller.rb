class BattleMechsController < ApplicationController
  # GET /battle_mechs
  # GET /battle_mechs.xml
  def index
    @battle_mechs = BattleMech.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @battle_mechs }
    end
  end

  # GET /battle_mechs/1
  # GET /battle_mechs/1.xml
  def show
    @battle_mech = BattleMech.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @battle_mech }
    end
  end

  # GET /battle_mechs/new
  # GET /battle_mechs/new.xml
  def new
    @battle_mech = BattleMech.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @battle_mech }
    end
  end

  # GET /battle_mechs/1/edit
  def edit
    @battle_mech = BattleMech.find(params[:id])
  end

  # POST /battle_mechs
  # POST /battle_mechs.xml
  def create
    @battle_mech = BattleMech.new(params[:battle_mech])

    respond_to do |format|
      if @battle_mech.save
        format.html { redirect_to(@battle_mech, :notice => 'BattleMech was successfully created.') }
        format.xml  { render :xml => @battle_mech, :status => :created, :location => @battle_mech }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @battle_mech.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /battle_mechs/1
  # PUT /battle_mechs/1.xml
  def update
    @battle_mech = BattleMech.find(params[:id])

    respond_to do |format|
      if @battle_mech.update_attributes(params[:battle_mech])
        format.html { redirect_to(@battle_mech, :notice => 'Battle mech was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @battle_mech.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /battle_mechs/1
  # DELETE /battle_mechs/1.xml
  def destroy
    @battle_mech = BattleMech.find(params[:id])
    @battle_mech.destroy

    respond_to do |format|
      format.html { redirect_to(battle_mechs_url) }
      format.xml  { head :ok }
    end
  end
end
