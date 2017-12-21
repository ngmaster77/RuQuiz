# RuQL

## ¿Qué es?
RuQL es un DSL (Domain Specific Language) para hacer cuestionarios. La gema permite generar diferentes formatos de archivos como salida, entre ellos, HTML5.

## Creando preguntas con RUQL
RuQL soporta diferentes tipos de preguntas:

**Pregunta de rellenar**
```ruby
fill_in do
  text 'The capital of California is ---.'
  answer 'sacramento'
end
```
También permite detectar la respuesta correcta mediante una espresión regular:
```ruby
fill_in do
  text 'The visionary founder of Apple is ---'
  answer /^ste(ve|phen)\s+jobs$/
end
```

**Preguntas de múltiple elección con una sola respuesta correcta**
```ruby
choice_answer :randomize => true do
  text  "What is the largest US state?"
  explanation "Not big enough." # for distractors without their own explanation
  answer 'Alaska'
  distractor 'Hawaii'
  distractor 'Texas', :explanation => "That's pretty big, but think colder."
end
```

**Preguntas de múltiple elección y varias respuestas correctas**
```ruby
select_multiple do
  text "Which are American political parties?"
  answer "Democrats"
  answer "Republicans"
  answer "Greens", :explanation => "Yes, they're a party!"
  distractor "Tories", :explanation => "They're British"
  distractor "Social Democrats"
end
```

**Preguntas de verdadero/falso**
```ruby
truefalse 'The week has 7 days.', true
truefalse 'The earth is flat.', false, :explanation => 'No, just looks that way'
```

**Preguntas "Drag-and-Drop"**
```ruby
rag_drop_fill_in do
  text 'The ---- brown fox jumped over the lazy ----'
  answer ['fox', 'dog'], :explanation => 'This sentence contains all of the letters of the English Alphabet'
end
```

## ¿Cómo crear un cuestionario?
 ```ruby
 quiz 'Example quiz' do   
  # (questions here)
end
 ```
 
 ## Generar un cuestionario en formato HTML
 El cuestionario se renderiza en una plantilla especificada en el comando.
 ```
 $ ruql questionfile.rb Html5 --template=template.html.erb
 ```
