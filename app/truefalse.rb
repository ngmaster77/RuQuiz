class PreguntaVerdadero  < Pregunta
  
  attr_accessor :text, :answer, :puntuation
  
  def initialize(enunciado, respuesta, puntuacion)
    @text = enunciado
    @answer = respuesta
    @puntuation = puntuacion
  end

  def toRUQL
    r = "truefalse "
    r << "'#{@text}', #{@answer}"
    r
  end
end
