class CreateDescriptionTemplates < ActiveRecord::Migration
  def change
    create_table :description_templates do |t|
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
