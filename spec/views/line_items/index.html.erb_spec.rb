require 'rails_helper'

RSpec.describe "line_items/index", type: :view do
  before(:each) do
    assign(:line_items, [
      LineItem.create!(
        :id => "Id",
        :variant_id => 1,
        :variant_title => "Variant Title",
        :product_id => 2,
        :title => "Title",
        :quantity => 3,
        :price => "",
        :order_id => 4
      ),
      LineItem.create!(
        :id => "Id",
        :variant_id => 1,
        :variant_title => "Variant Title",
        :product_id => 2,
        :title => "Title",
        :quantity => 3,
        :price => "",
        :order_id => 4
      )
    ])
  end

  it "renders a list of line_items" do
    render
    assert_select "tr>td", :text => "Id".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Variant Title".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
