class ServersController < ApplicationController

  before_filter :paranoid_authentication
  before_filter :authenticate_user!
  # GET /servers
  # GET /servers.json
  def index
    @servers = Server.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @servers }
    end
  end

  # GET /servers/1
  # GET /servers/1.json
  def show
    @server = Server.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @server }
    end
  end

  # GET /servers/new
  # GET /servers/new.json
  def new
    @server = Server.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @server }
    end
  end

  # GET /servers/1/edit
  def edit
    @server = Server.find(params[:id])
  end

  # POST /servers
  # POST /servers.json
  def create
    if params[:server].present? and process_server_info(params[:server])
      render :text => 'OK'
    else
      render :text => 'FAIL'
    end
  end

  # PUT /servers/1
  # PUT /servers/1.json
  def update
    @server = Server.find(params[:id])

    respond_to do |format|
      if @server.update_attributes(params[:server])
        format.html { redirect_to @server, notice: 'Server was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.json
  def destroy
    @server = Server.find(params[:id])
    @server.destroy

    respond_to do |format|
      format.html { redirect_to servers_url }
      format.json { head :ok }
    end
  end

  private
  def process_server_info(info)
    server = {}
    @notes = []
    if info[:id].present?
      key = info[:id].first(40)
      @license = License.where(:key => key).first
      if @license
        server[:license_id] = @license.try(:id)
      else
        @notes << "License Key : #{key}"
      end
    end

    if info[:email].present?
      server[:email] = info[:email].downcase
      # Sisland prefix
      email = 'sisland_' + info[:email] if SISLAND_EMAILS.member?(info[:email])
      email ||= info[:email]
      email.downcase!
    end

    server[:client_id] = Client.find_or_create(email, key).try(:id)
    server[:trial] = @license.try(:trial) == true or info[:trial] == '1' or email == 'sisland_demo@sislandsoft.com'
    server[:version] = info[:version] || ''
    server[:revision] = info[:revision] || ''
    server[:os_name] = info[:os_name] || ''
    server[:os_version] = info[:os_version] || ''
    server[:os_id] = info[:os_id] || ''
    server[:python] = info[:python_version] || info[:python] || ''
    server[:system] = info[:system] || ''
    server[:arch] = info[:architecture] || info[:arch] || ''
    server[:ips] = (info[:ip_addresses] || info[:ips] || '').split(', ').map{ |i| i.strip }.select{ |i| i =~ IP_REGEX }.uniq.sort.join(', ')
    server[:macs] = (info[:mac_addresses] || info[:macs] || '').split(', ').map{ |i| i.strip.downcase }.select{ |i| i =~ MAC_REGEX }.uniq.sort.join(', ')
    server[:notes] = (@notes << info).to_yaml

    @server = Server.where(:email => server[:email], :license_id => server[:license_id], :client_id => server[:client_id], :version => server[:version], :revision => server[:revision], :trial => server[:trial], :python => server[:python], :squid => server[:squid], :os_name => server[:os_name], :os_id => server[:os_id], :os_version => server[:os_version], :system => server[:system], :arch => server[:arch], :macs => server[:macs], :ips => server[:ips]).first
    if @server
      @server.touch
    else
      @server = Server.create(server)
    end
    return @server
  end
end
