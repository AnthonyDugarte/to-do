class AddLineIdToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference(:tasks, :line, null: false, foreign_key: true)
  end
end
