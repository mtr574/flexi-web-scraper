require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        :product_id => "",
        :title => "",
        :author => "",
        :stars => "",
        :body => "Body"
      ),
      Review.create!(
        :product_id => "",
        :title => "",
        :author => "",
        :stars => "",
        :body => "Body"
      )
    ])
  end

  it "renders a list of reviews" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
  end
end
