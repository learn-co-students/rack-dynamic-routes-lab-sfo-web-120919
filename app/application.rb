class Application

    @@items = []

    def call(env)
      request = Rack::Request.new(env)
      response = Rack::Response.new
      if request.path.match(/items/) 
        item_name = request.path.split("/").last
        found_item = @@items.find {|i| i.name == item_name}
        if found_item 
          response.status = 200
          response.write "#{found_item.price}"    
        else  # set response to 400
            response.status = 400
            response.write "Item not found"
        end 
     
      else # not items path
        response.status = 404
        response.write "Route not found"  
      end   
      response.finish
    end 

end 