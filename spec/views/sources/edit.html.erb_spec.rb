require 'rails_helper'

RSpec.describe "sources/edit", type: :view do
  before(:each) do
    @source = assign(:source, Source.create!(
      :url => "MyString",
      :script => "MyText"
    ))
  end

  it "renders the edit source form" do
    render

    assert_select "form[action=?][method=?]", source_path(@source), "post" do

      assert_select "input#source_url[name=?]", "source[url]"

      assert_select "textarea#source_script[name=?]", "source[script]"
    end
  end
end
