require 'rails_helper'

RSpec.describe "selectors/index", type: :view do
  before(:each) do
    assign(:selectors, [
      Selector.create!(
        :source_id => 2,
        :host => "Host",
        :value => "Value"
      ),
      Selector.create!(
        :source_id => 2,
        :host => "Host",
        :value => "Value"
      )
    ])
  end

  it "renders a list of selectors" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Host".to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
