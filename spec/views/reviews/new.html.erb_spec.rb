require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
      :product_id => "",
      :title => "",
      :author => "",
      :stars => "",
      :body => "MyString"
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "input#review_product_id[name=?]", "review[product_id]"

      assert_select "input#review_title[name=?]", "review[title]"

      assert_select "input#review_author[name=?]", "review[author]"

      assert_select "input#review_stars[name=?]", "review[stars]"

      assert_select "input#review_body[name=?]", "review[body]"
    end
  end
end
