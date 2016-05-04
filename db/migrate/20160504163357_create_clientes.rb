class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :telefono
      t.string :celular
      t.string :barrio
      t.string :direccion
      t.text :ref_dir
      t.date :fecha
      t.string :hora
      t.string :ocacion
      t.decimal :valor

      t.timestamps null: false
    end
  end
end
