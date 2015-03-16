class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.column :name, :string

      t.timestamps
    end

    create_table :companies do |t|
      t.column :name, :string
      t.column :address, :string
      t.column :website, :string
      t.column :phone, :string
      t.column :hours, :string
      t.column :category_id, :integer

      t.timestamps
    end
  end
end
