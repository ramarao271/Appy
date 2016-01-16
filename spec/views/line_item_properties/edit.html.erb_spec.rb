require 'rails_helper'

RSpec.describe "line_item_properties/edit", type: :view do
  before(:each) do
    @line_item_property = assign(:line_item_property, LineItemProperty.create!(
      :name => "MyString",
      :value => "MyString",
      :line_item_id => 1
    ))
  end

  it "renders the edit line_item_property form" do
    render

    assert_select "form[action=?][method=?]", line_item_property_path(@line_item_property), "post" do

      assert_select "input#line_item_property_name[name=?]", "line_item_property[name]"

      assert_select "input#line_item_property_value[name=?]", "line_item_property[value]"

      assert_select "input#line_item_property_line_item_id[name=?]", "line_item_property[line_item_id]"
    end
  end
end
