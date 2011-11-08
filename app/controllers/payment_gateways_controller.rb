class PaymentGatewaysController < ApplicationController

  before_filter :paranoid_authentication
  before_filter :authenticate_user!
  # GET /payment_gateways
  # GET /payment_gateways.json
  def index
    @payment_gateways = PaymentGateway.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payment_gateways }
    end
  end

  # GET /payment_gateways/1
  # GET /payment_gateways/1.json
  def show
    @payment_gateway = PaymentGateway.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment_gateway }
    end
  end

  # GET /payment_gateways/new
  # GET /payment_gateways/new.json
  def new
    @payment_gateway = PaymentGateway.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment_gateway }
    end
  end

  # GET /payment_gateways/1/edit
  def edit
    @payment_gateway = PaymentGateway.find(params[:id])
  end

  # POST /payment_gateways
  # POST /payment_gateways.json
  def create
    @payment_gateway = PaymentGateway.new(params[:payment_gateway])

    respond_to do |format|
      if @payment_gateway.save
        format.html { redirect_to @payment_gateway, notice: 'Payment gateway was successfully created.' }
        format.json { render json: @payment_gateway, status: :created, location: @payment_gateway }
      else
        format.html { render action: "new" }
        format.json { render json: @payment_gateway.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payment_gateways/1
  # PUT /payment_gateways/1.json
  def update
    @payment_gateway = PaymentGateway.find(params[:id])

    respond_to do |format|
      if @payment_gateway.update_attributes(params[:payment_gateway])
        format.html { redirect_to @payment_gateway, notice: 'Payment gateway was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment_gateway.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_gateways/1
  # DELETE /payment_gateways/1.json
  def destroy
    @payment_gateway = PaymentGateway.find(params[:id])
    @payment_gateway.destroy

    respond_to do |format|
      format.html { redirect_to payment_gateways_url }
      format.json { head :ok }
    end
  end
end
