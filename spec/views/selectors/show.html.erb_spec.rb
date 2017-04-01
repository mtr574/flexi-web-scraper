require 'rails_helper'

RSpec.describe "selectors/show", type: :view do
  before(:each) do
    @selector = assign(:selector, Selector.create!(
      :source_id => 2,
      :host => "Host",
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Host/)
    expect(rendered).to match(/Value/)
  end
end
