class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.string :name
      t.string :day_time
      t.timestamps
    end
  end
end
