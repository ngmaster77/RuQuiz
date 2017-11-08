class TrueFalse 
  def initialize(enunciado, respuesta, puntuacion)
    @text = enunciado
    @answer = respuesta
    @puntuation = puntuacion
  end
  
  def toRUQL
    str = "truefalse "
    str << "'#{@text}', #{@answer}"
    puts str
  end
end

A = TrueFalse.new('la tierra es plana', 'false', '1')
A.toRUQL