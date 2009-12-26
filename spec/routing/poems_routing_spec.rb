require 'spec_helper'

describe PoemsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/poems" }.should route_to(:controller => "poems", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/poems/new" }.should route_to(:controller => "poems", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/poems/1" }.should route_to(:controller => "poems", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/poems/1/edit" }.should route_to(:controller => "poems", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/poems" }.should route_to(:controller => "poems", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/poems/1" }.should route_to(:controller => "poems", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/poems/1" }.should route_to(:controller => "poems", :action => "destroy", :id => "1") 
    end
  end
end
