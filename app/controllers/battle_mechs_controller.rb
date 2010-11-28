class BattleMechsController < ApplicationController
  # GET /battle_mechs
  # GET /battle_mechs.xml
  def index
    @title = "BattleMech list"
    #@battle_mechs = BattleMech.all
    @battle_mechs = BattleMech.paginate(:page => params[:page])
  end

  # GET /battle_mechs/1
  # GET /battle_mechs/1.xml
  def show
    @battle_mech = BattleMech.find(params[:id])
    @title = @battle_mech.code
  end

  # GET /battle_mechs/new
  # GET /battle_mechs/new.xml
  def new
    @title = "New BattleMech"
    @battle_mech = BattleMech.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @battle_mech }
    end
  end

  # GET /battle_mechs/1/edit
  def edit
    @battle_mech = BattleMech.find(params[:id])
    @title = "Edit BattleMech"
  end

  # POST /battle_mechs
  # POST /battle_mechs.xml
  def create
    @battle_mech = BattleMech.new(params[:battle_mech])

    if @battle_mech.save
      flash[:success] = "New BattleMech created"
      redirect_to @battle_mech
    else
      @title = "New BattleMech"
      render "new"
    end
  end

  # PUT /battle_mechs/1
  # PUT /battle_mechs/1.xml
  def update
    @battle_mech = BattleMech.find(params[:id])

    if @battle_mech.update_attributes(params[:battle_mech])
      flash[:success] = "BattleMech updated."
      redirect_to @battle_mech
    else
      @title = "Edit BattleMech"
      render "edit"
    end
  end

  # DELETE /battle_mechs/1
  # DELETE /battle_mechs/1.xml
  def destroy
    BattleMech.find(params[:id]).destroy
    flash[:success] = "BattleMech destroyed."
    redirect_to(battle_mechs_path)
  end
end
