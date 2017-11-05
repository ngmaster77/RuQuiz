class Createestadisticas < ActiveRecord::Migration
  def change
    create_table :estadisticas do |t|
      t.string :name
      t.integer :aprobados
      t.integer :realizados
      t.integer :suspensos
      t.float :media
      t.float :porcentajeaprobados
      t.float :porcentajeasuspensos
    end
  end
end
