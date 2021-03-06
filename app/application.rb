class Application
  @@items =[]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item = req.path.split("/items/").last
      item_object = @@items.find{|i| i.name == item}
      unless item_object.nil?
        resp.write item_object.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
