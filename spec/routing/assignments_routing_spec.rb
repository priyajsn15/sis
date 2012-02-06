require "spec_helper"

 describe AssignmentsController do
 
 describe "routing" do
  it "routes to #index" do
  get("/assignments").should route_to("assignments#index")
  end
 end

 describe "routing" do
  it "routes to #edit" do
  get('/assignments/:id/edit').should route_to("assignments#edit")
  end
 end

 describe "routing" do
  it "routes to #show" do
  get("/assignments/:id/show").should route_to("assignments#show")
 end
end

 end
