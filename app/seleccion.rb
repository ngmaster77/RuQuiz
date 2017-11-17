class PreguntaSeleccion < Pregunta
  attr_accessor :text, :answer
  @distractors = []
  
   def initialize(texto,correcta,respuestas)
     @text = texto
     @answer = correcta
     @distractors = respuestas.split(",")
   end
   
   
   def toRUQL
     r = "choice_answer do "
     r << "text " + "'#{@text}'" + "\n"
     r << "answer " + "'#{@answer}'" + "\n"
     @distractors.each {|dis| r << "distractor '#{dis}'\n" }
     r << "end"
     r
   end
end
