class Application
  @@items =[]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path(/items/)

    else
      resp.write 
    end
  end
end
