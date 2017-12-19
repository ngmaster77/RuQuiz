# Introduction

Con esta plataforma se pretende que tanto alumnos como profesores que la usen aprendan a través de cuestionarios. De esta manera, en un entorno educativo un maestro podrá evaluar a sus alumnos sobre un tema que se aborde en ese momento.

Por ejemplo, si el temario dado en ese periodo es sobre Geografía, el tutor puede realizar un cuestionario sobre capitales, para comprobar que el alumno ha entendido todos los conceptos, así como obtener una retroalimentación de los cuestionarios realizados.

## Requisitos

Para el funcionamiento de la aplicación, será necesario disponer de **Ruby** instalado en el sistema.

Para comprobar que versión tenemos instalada, usar:

`$ ruby -v`

**NOTA: Tener una versión superior a 2.3 de Ruby**

## Uso

1. Clonar el repositorio
2. Ejecutar `$ bundle install`
3. Para poner en marcha el servidor, ejecutar en la terminal `$ rackup`
4. Acceder a la plataforma a través de `localhost:9292`


## Autores

* Nestor García Moreno
* Carlos de Armas Hernández
* Alejandro Arzola García
* Samuel Valcárcel Arce

## Estructura

```
.
├── Gemfile
├── Gemfile.lock
├── README.md
├── Rakefile
├── app
│   ├── controllers
│   │   ├── application_controller.rb
│   │   ├── auth_controller.rb
│   │   ├── cuestionariocontroller.rb
│   │   └── statscontroller.rb
│   ├── models
│   │   ├── cuestionario.rb
│   │   ├── resultado.rb
│   │   └── user.rb
│   ├── pregunta.rb
│   ├── preguntadrop.rb
│   ├── preguntarelleno.rb
│   ├── questionario.rb
│   ├── relation.rb
│   ├── seleccion.rb
│   ├── truefalse.rb
│   └── views
│       ├── cuestionarios
│       │   ├── 1.html
│       │   └── 2.html
│       ├── error.erb
│       ├── home.erb
│       ├── home_original.erb
│       ├── index.erb
│       ├── login.erb
│       ├── newcuestionario.erb
│       ├── registro.erb
│       ├── search.erb
│       ├── stats.erb
│       └── stats2.erb
├── config
│   └── environment.rb
├── config.ru
├── db
│   ├── migrate
│   │   └── 20171123144516_createall.rb
│   ├── schema.rb
│   ├── user_auth.sqlite
│   └── user_authdevelopment.sqlite
├── docs
│   ├── README.md
│   ├── SUMMARY.md
│   ├── bcrypt.md
│   ├── book.json
│   ├── images
│   │   ├── er.jpeg
│   │   ├── modelo.png
│   │   └── mvc.png
│   ├── mvc.md
│   ├── rack.md
│   └── sql.md
├── public
│   ├── css
│   │   ├── index.css
│   │   ├── newQuiz.css
│   │   ├── personal.css
│   │   └── search.css
│   ├── images
│   │   ├── Firewatch.jpg
│   │   └── ruby.png
│   ├── js
│   │   ├── addQuestion.js
│   │   ├── chartkick.js
│   │   └── stats.js
│   └── templates
│       └── htmlform.html.erb
├── test
│   ├── acceptance
│   │   └── app_test.rb
│   ├── models
│   │   └── user_test.rb
│   └── spec_helper.rb
└── var
    ├── 1.rb
    └── 2.rb
```


