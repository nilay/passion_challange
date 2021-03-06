class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :author
      t.references :category, foreign_key: true
      t.string :state
      t.timestamps
    end
  end
end
