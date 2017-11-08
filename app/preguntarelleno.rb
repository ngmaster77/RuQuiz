class PreguntaRelleno < Pregunta
  
  attr_accessor :text, :answer, :puntuation
  
   def initialize(texto,respuesta,puntuacion)
     @text = texto
     @answer = respuesta
     @puntuation = puntuacion
   end
   
   
   def toRUQL
     r = "fill_in do "
     r << "text " + "'#{@text}'" + "\n"
     r << "answer " + "'#{@answer}'" + " "
     r << "end"
     r 
   end
   
   
end


