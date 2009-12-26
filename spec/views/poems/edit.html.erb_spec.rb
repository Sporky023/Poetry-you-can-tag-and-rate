require 'spec_helper'

describe "/poems/edit.html.erb" do
  include PoemsHelper

  before(:each) do
    assigns[:poem] = @poem = stub_model(Poem,
      :new_record? => false,
      :title => "value for title",
      :body => "value for body"
    )
  end

  it "renders the edit poem form" do
    render

    response.should have_tag("form[action=#{poem_path(@poem)}][method=post]") do
      with_tag('input#poem_title[name=?]', "poem[title]")
      with_tag('textarea#poem_body[name=?]', "poem[body]")
    end
  end
end
