require 'rails_helper'

RSpec.describe "line_item_properties/index", type: :view do
  before(:each) do
    assign(:line_item_properties, [
      LineItemProperty.create!(
        :name => "Name",
        :value => "Value",
        :line_item_id => 1
      ),
      LineItemProperty.create!(
        :name => "Name",
        :value => "Value",
        :line_item_id => 1
      )
    ])
  end

  it "renders a list of line_item_properties" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
