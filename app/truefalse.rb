class TrueFalse < Pregunta
  attr_accessor :text, :answer, :puntuation
  def initialize(enunciado, respuesta, puntuacion)
    @text = enunciado
    @answer = respuesta
    @puntuation = puntuacion
  end

  def toRUQL
    str = 'truefalse '
    str << "'#{@text}', #{@answer}"
    str
  end
end
