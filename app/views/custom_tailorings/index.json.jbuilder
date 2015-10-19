json.array!(@custom_tailorings) do |custom_tailoring|
  json.extract! custom_tailoring, :id, :preset_name, :front_neck_style, :back_neck_style, :sleeve_style, :fitting, :blouse_opening, :fall_and_edging, :lining, :petticoat_inskirt, :around_bust, :shoulder, :natural_waist, :around_arm_hole, :around_arm, :your_height, :front_neck_depth, :back_neck_depth, :sleeve_length, :blouse_length, :product_id, :product_name, :customer_id
  json.url custom_tailoring_url(custom_tailoring, format: :json)
end
