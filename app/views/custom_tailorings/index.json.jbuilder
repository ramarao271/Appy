json.array!(@custom_tailorings) do |custom_tailoring|
  json.extract! custom_tailoring, :id, :regular_fit, :comfort_fit, :around_bust, :around_above_waist, :shoulder, :around_arm_hole, :around_arm, :your_height, :measurement_unit, :front_neck_style, :front_neck_depth, :back_neck_style, :back_neck_depth, :sleeve_style, :sleeve_length, :blouse_length, :closing_side, :closing_with, :lining, :adornment_placement, :adornment_type
  json.url custom_tailoring_url(custom_tailoring, format: :json)
end
