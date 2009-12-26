require 'spec_helper'

describe "/poems/new.html.erb" do
  include PoemsHelper

  before(:each) do
    assigns[:poem] = stub_model(Poem,
      :new_record? => true,
      :title => "value for title",
      :body => "value for body"
    )
  end

  it "renders new poem form" do
    render

    response.should have_tag("form[action=?][method=post]", poems_path) do
      with_tag("input#poem_title[name=?]", "poem[title]")
      with_tag("textarea#poem_body[name=?]", "poem[body]")
    end
  end
end
