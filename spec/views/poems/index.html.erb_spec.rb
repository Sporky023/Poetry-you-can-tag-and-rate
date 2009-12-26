require 'spec_helper'

describe "/poems/index.html.erb" do
  include PoemsHelper

  before(:each) do
    assigns[:poems] = [
      stub_model(Poem,
        :title => "value for title",
        :body => "value for body"
      ),
      stub_model(Poem,
        :title => "value for title",
        :body => "value for body"
      )
    ]
  end

  it "renders a list of poems" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
  end
end
