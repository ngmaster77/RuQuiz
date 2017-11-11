class Cuestionario < ActiveRecord::Base
  has_many :resultados
  validates_presence_of :titulo, :idcuestionario, :npreguntas, :notaaprobar, :notamaxima
end