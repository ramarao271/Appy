require 'rails_helper'

RSpec.describe "line_item_properties/show", type: :view do
  before(:each) do
    @line_item_property = assign(:line_item_property, LineItemProperty.create!(
      :name => "Name",
      :value => "Value",
      :line_item_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Value/)
    expect(rendered).to match(/1/)
  end
end
