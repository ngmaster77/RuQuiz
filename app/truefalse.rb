class PreguntaVerdadero  < Pregunta
  
  attr_accessor :text, :answer
  
  def initialize(enunciado, respuesta)
    @text = enunciado
    @answer = respuesta
  end

  def toRUQL
    r = "truefalse "
    r << "'#{@text}', #{@answer}"
    r
  end
end
