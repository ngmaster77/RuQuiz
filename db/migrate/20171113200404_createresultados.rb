class Createresultados < ActiveRecord::Migration[5.1]
  def change
    drop_table :resultados
    create_table :resultados do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :cuestionario, index: true, foreign_key: true
      t.integer :idcuestionario, :limit => 8
      t.string :name
      t.float :nota
    end
  end
end