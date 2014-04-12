limit = 1
period = 60.seconds

Rack::Attack.throttle("license_verification", limit: limit, period: period) do |req|
  "#{req.ip}#{req.params['id']}#{req.params['e']}" if req.post? && req.path == '/videoid'
end

Rack::Attack.throttle("server_report", limit: limit, period: period) do |req|
  "#{req.ip}#{req.params['server'].values.join()}" if req.post? && req.path == '/servers' && req.params['server'].present?
end

Rack::Attack.throttled_response = lambda do |env|
  retry_after = env['rack.attack.match_data'][:period] rescue nil
  [200, {}, [""]]
end
