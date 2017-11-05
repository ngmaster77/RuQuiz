class Createcuestionarios < ActiveRecord::Migration
  def change
    drop_table :cuestionarios
    create_table :cuestionarios do |t|
      t.integer :idcuestionario
      t.integer :npreguntas
      t.float :notaaprobar
      t.float :notamaxima
    end
  end
end