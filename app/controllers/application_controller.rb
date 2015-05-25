class ApplicationController < ActionController::Base
  protect_from_forgery

  def paranoid_authentication
    return
    #FIXME set username and password if you want basic HTTP auth
    authenticate_or_request_with_http_basic do |username,password|
      username == 'username' and password == 'password'
    end
    warden.custom_failure! if performed?
  end

  def remote_ips
    [request.remote_ip, request.env['HTTP_X_REAL_IP'], request.env["HTTP_X_FORWARDED_FOR"], request.env['REMOTE_ADDR'], request.remote_addr].select(&:present?).map(&:strip).uniq
  end
  helper_method :remote_ips
end
