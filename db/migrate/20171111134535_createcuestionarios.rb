class Createcuestionarios < ActiveRecord::Migration[5.1]
  def change
    drop_table :cuestionarios
    create_table :cuestionarios do |t|
      t.string :titulo 
      t.integer :idcuestionario, :limit => 8
      t.integer :npreguntas
      t.float :notaaprobar
      t.float :notamaxima
    end
  end
end