class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :freelancer_id
      t.integer :category_id
      t.text :description
      t.string :client_name
      t.boolean :invoice_sent, default: false
      t.string :status, default: 'Received'
      t.integer :budget
      t.integer :time_log DEFAULT 0
      t.date :start_date
      t.date :deadline
      t.integer :ticket
      t.timestamps null: false
    end
  end
end
