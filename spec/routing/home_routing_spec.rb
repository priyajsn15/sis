require "spec_helper"

 describe HomeController do
 
 describe "routing" do
  it "routes to #index" do
  get("/home").should route_to("home#index")
  end
 end

 describe "routing" do
  it "routes to #create_user" do
  get("/home/create_user").should route_to("home#create_user")
  end
 end

 describe "routing" do
  it "routes to #task" do
  get("/home/task").should route_to("home#task")
 end
end

 end
