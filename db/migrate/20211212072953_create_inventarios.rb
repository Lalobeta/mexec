class CreateInventarios < ActiveRecord::Migration[6.1]
  def change
    create_table :inventarios do |t|
      #Campos 
      t.string :placas
      t.string :marca
      t.string :modelo
      t.string :cliente
      t.string :id_cliente
      t.string :img
      t.string :url
      t.timestamps
      t.column :deleted_at, :datetime, :limit => 6

    end
  end
end
