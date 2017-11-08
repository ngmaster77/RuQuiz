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
     puts r 
   end
   
   
end

A = PreguntaRelleno.new("capital de california", "sacramento", "2")
A.toRUQL()

