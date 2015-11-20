require 'rails_helper'

RSpec.describe "tags/edit", type: :view do
  before(:each) do
    @tag = assign(:tag, Tag.create!(
      :tag => "MyString",
      :percentile => 1.5
    ))
  end

  it "renders the edit tag form" do
    render

    assert_select "form[action=?][method=?]", tag_path(@tag), "post" do

      assert_select "input#tag_tag[name=?]", "tag[tag]"

      assert_select "input#tag_percentile[name=?]", "tag[percentile]"
    end
  end
end
