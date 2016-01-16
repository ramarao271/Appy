require 'rails_helper'

RSpec.describe "line_items/show", type: :view do
  before(:each) do
    @line_item = assign(:line_item, LineItem.create!(
      :id => "Id",
      :variant_id => 1,
      :variant_title => "Variant Title",
      :product_id => 2,
      :title => "Title",
      :quantity => 3,
      :price => "",
      :order_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Id/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Variant Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
    expect(rendered).to match(/4/)
  end
end
