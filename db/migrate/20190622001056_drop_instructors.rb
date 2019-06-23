class DropInstructors < ActiveRecord::Migration[5.2]
  def change
    drop_table :instructors
  end
end
