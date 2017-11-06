class PreguntaRelleno < Pregunta
  
  attr_accessor :text, :answer, :puntuation
  
   def initialize(texto,respuesta,puntuacion)
     @text = texto
     @answer = respuesta
     @puntuation = puntuacion
   end
   
   
   def toRUQL
     r = "fill_in :points => " + @puntuation.to_s + " do "
     r += "text " + @text.to_s + " "
     r += "answer " + @answer.to_s + " "
     r += "end"
     puts r 
   end
   
   
end

A = PreguntaRelleno.new("capital de california", "sacramento", "2")
A.toRUQL()

