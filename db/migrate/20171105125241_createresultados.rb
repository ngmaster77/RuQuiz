class Createresultados < ActiveRecord::Migration
  def change
    create_table :resultados do |t|
      t.integer :idcuestionario
      t.integer :npreguntas
      t.float :notaaprobar
      t.float :notamaxima
    end
  end
end
