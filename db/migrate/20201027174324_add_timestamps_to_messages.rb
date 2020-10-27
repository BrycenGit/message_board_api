class AddTimestampsToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :created_at, :string
    add_column :messages, :updated_at, :string
  end
end
