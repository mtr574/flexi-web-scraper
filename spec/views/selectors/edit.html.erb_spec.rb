require 'rails_helper'

RSpec.describe "selectors/edit", type: :view do
  before(:each) do
    @selector = assign(:selector, Selector.create!(
      :source_id => 1,
      :host => "MyString",
      :value => "MyString"
    ))
  end

  it "renders the edit selector form" do
    render

    assert_select "form[action=?][method=?]", selector_path(@selector), "post" do

      assert_select "input#selector_source_id[name=?]", "selector[source_id]"

      assert_select "input#selector_host[name=?]", "selector[host]"

      assert_select "input#selector_value[name=?]", "selector[value]"
    end
  end
end
