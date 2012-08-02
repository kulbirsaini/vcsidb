class LicensesController < ApplicationController

  before_filter :paranoid_authentication, :except => [:expired]
  before_filter :authenticate_user!, :except => [:expired]

  # Render expired licenses as well
  def all
    @licenses = License.includes(:client).all
    render :index
  end

  def premium
    @licenses = License.active.includes(:client).where(:trial => false).all
    render :index
  end

  def trial
    @licenses = License.active.includes(:client).where(:trial => true).all
    render :index
  end

  # GET /licenses
  # GET /licenses.json
  def index
    @licenses = License.active.includes(:client).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @licenses }
    end
  end

  def expired
    if License.check_expiry(params[:id], params[:e])
      render :text => 'YES'
    else
      render :text => ''
    end
  end

  # GET /licenses/1
  # GET /licenses/1.json
  def show
    @license = License.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @license }
    end
  end

  # GET /licenses/new
  # GET /licenses/new.json
  def new
    @license = License.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @license }
    end
  end

  # GET /licenses/1/edit
  def edit
    @license = License.find(params[:id])
  end

  # POST /licenses
  # POST /licenses.json
  def create
    @license = License.new(params[:license])

    respond_to do |format|
      if @license.save
        format.html { redirect_to @license, notice: 'License was successfully created.' }
        format.json { render json: @license, status: :created, location: @license }
      else
        format.html { render action: "new" }
        format.json { render json: @license.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /licenses/1
  # PUT /licenses/1.json
  def update
    @license = License.find(params[:id])

    respond_to do |format|
      if @license.update_attributes(params[:license])
        format.html { redirect_to @license, notice: 'License was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @license.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /licenses/1
  # DELETE /licenses/1.json
  def destroy
    @license = License.find(params[:id])
    @license.destroy

    respond_to do |format|
      format.html { redirect_to licenses_url }
      format.json { head :ok }
    end
  end
end
