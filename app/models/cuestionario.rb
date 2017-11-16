class Cuestionario < ActiveRecord::Base
  has_many :resultados
  validates_presence_of :titulo, :descripcion, :creador, :npreguntas, :notaaprobar, :notamaxima
end