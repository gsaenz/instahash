class CreateFbs < ActiveRecord::Migration
  def change
    create_table :fbs do |t|

      t.timestamps null: false
    end
  end
end
