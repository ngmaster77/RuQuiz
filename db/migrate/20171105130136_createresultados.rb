class Createresultados < ActiveRecord::Migration
  def change
    drop_table :resultados
    create_table :resultados do |t|
      t.integer :idcuestionario
      t.string :name
      t.float :nota
    end
  end
end