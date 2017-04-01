require 'rails_helper'

RSpec.describe "sources/show", type: :view do
  before(:each) do
    @source = assign(:source, Source.create!(
      :url => "Url",
      :script => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/MyText/)
  end
end
