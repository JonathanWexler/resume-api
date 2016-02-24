class CreateExperiencesTable < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :position
      t.string :start_date
      t.string :end_date
      t.string :description
  end
end
end
