class RemoveTimestampsFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :created_at, :string
    remove_column :messages, :updated_at, :string
  end
end
