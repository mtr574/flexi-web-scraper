require 'rails_helper'

RSpec.describe "selectors/new", type: :view do
  before(:each) do
    assign(:selector, Selector.new(
      :source_id => 1,
      :host => "MyString",
      :value => "MyString"
    ))
  end

  it "renders new selector form" do
    render

    assert_select "form[action=?][method=?]", selectors_path, "post" do

      assert_select "input#selector_source_id[name=?]", "selector[source_id]"

      assert_select "input#selector_host[name=?]", "selector[host]"

      assert_select "input#selector_value[name=?]", "selector[value]"
    end
  end
end
