class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.column :content, :string
      t.column :author, :string
      t.timestamps
    end
  end
end
