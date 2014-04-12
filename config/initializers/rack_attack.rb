limit = 5
period = 5.minutes

Rack::Attack.throttle("license_verification", limit: limit, period: period) do |req|
  req.post? && req.ip && req.path == '/videoid'
end

Rack::Attack.throttle("server_report", limit: limit, period: period) do |req|
  req.post? && req.ip && req.path == '/servers'
end

Rack::Attack.throttled_response = lambda do |env|
  retry_after = env['rack.attack.match_data'][:period] rescue nil
  [200, {}, [""]]
end
