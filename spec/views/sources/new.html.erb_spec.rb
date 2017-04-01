require 'rails_helper'

RSpec.describe "sources/new", type: :view do
  before(:each) do
    assign(:source, Source.new(
      :url => "MyString",
      :script => "MyText"
    ))
  end

  it "renders new source form" do
    render

    assert_select "form[action=?][method=?]", sources_path, "post" do

      assert_select "input#source_url[name=?]", "source[url]"

      assert_select "textarea#source_script[name=?]", "source[script]"
    end
  end
end
