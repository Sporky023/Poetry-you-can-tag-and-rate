require 'spec_helper'

describe "/poems/show.html.erb" do
  include PoemsHelper
  before(:each) do
    assigns[:poem] = @poem = stub_model(Poem,
      :title => "value for title",
      :body => "value for body"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ body/)
  end
end
