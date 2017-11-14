class Cuestionario < ActiveRecord::Base
  has_many :resultados
  validates_presence_of :titulo, :creador, :npreguntas, :notaaprobar, :notamaxima
end