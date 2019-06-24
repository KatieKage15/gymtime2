class ChangeDayTimeToBeStringInTrainings < ActiveRecord::Migration[5.2]
  def change
    change_column :trainings, :day_time, :string
  end
end
