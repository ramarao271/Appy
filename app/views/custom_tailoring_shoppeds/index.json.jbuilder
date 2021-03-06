json.array!(@custom_tailoring_shoppeds) do |custom_tailoring_shopped|
  json.extract! custom_tailoring_shopped, :id, :preset_name, :front_neck_style_value, :back_neck_style_value, :sleeve_style_value, :front_neck_style_name, :back_neck_style_name, :sleeve_style_name, :fitting, :blouse_opening, :fall_and_edging, :lining, :petticoat_inskirt, :around_bust, :shoulder, :natural_waist, :around_arm_hole, :around_arm, :your_height, :front_neck_depth, :back_neck_depth, :sleeve_length, :blouse_length, :product_id, :product_name, :customer_id
  json.url custom_tailoring_shopped_url(custom_tailoring_shopped, format: :json)
end
