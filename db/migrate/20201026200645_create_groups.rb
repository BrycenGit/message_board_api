class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name 
    end
 
    add_column :messages, :group_id, :integer

    add_foreign_key :messages, :groups
  end
end
