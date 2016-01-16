require 'rails_helper'

RSpec.describe "line_items/new", type: :view do
  before(:each) do
    assign(:line_item, LineItem.new(
      :id => "MyString",
      :variant_id => 1,
      :variant_title => "MyString",
      :product_id => 1,
      :title => "MyString",
      :quantity => 1,
      :price => "",
      :order_id => 1
    ))
  end

  it "renders new line_item form" do
    render

    assert_select "form[action=?][method=?]", line_items_path, "post" do

      assert_select "input#line_item_id[name=?]", "line_item[id]"

      assert_select "input#line_item_variant_id[name=?]", "line_item[variant_id]"

      assert_select "input#line_item_variant_title[name=?]", "line_item[variant_title]"

      assert_select "input#line_item_product_id[name=?]", "line_item[product_id]"

      assert_select "input#line_item_title[name=?]", "line_item[title]"

      assert_select "input#line_item_quantity[name=?]", "line_item[quantity]"

      assert_select "input#line_item_price[name=?]", "line_item[price]"

      assert_select "input#line_item_order_id[name=?]", "line_item[order_id]"
    end
  end
end
