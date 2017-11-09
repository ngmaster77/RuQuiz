class PreguntaRelleno < Pregunta
  
  attr_accessor :text, :answer
  
   def initialize(texto,respuesta)
     @text = texto
     @answer = respuesta
   end
   
   
   def toRUQL
     r = "fill_in do "
     r << "text " + "'#{@text}' " + "\n"
     r << "answer " + "'#{@answer}'" + " "
     r << "end"
     r 
   end
   
   
end


