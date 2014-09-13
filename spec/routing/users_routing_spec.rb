require 'rails_helper'

RSpec.describe UsersController, :type => :routing do
  specify {
    expect(get: "/users/1").to route_to(controller: "users", action: "show", id: "1")
  }
  specify {
    expect(get: "/users/1/posts").to route_to(controller: "posts", action: "index", user_id: "1")
  }
end
