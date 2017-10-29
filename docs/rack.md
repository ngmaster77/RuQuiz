# Rack : una interfaz Ruby Webserver

Rack proporciona una interfaz mínima, modular y adaptable para desarrollar aplicaciones web en Ruby. Al unificar las solicitudes y respuestas HTTP de la manera más simple posible, unifica y sintetiza la API para servidores web, frameworks y  middlewares en una única llamada a método.

## Introducción

Para usar rack en nuestra aplicación ruby necesitamos llamar al método que la instancia ``require 'rack'`` o también podemos especificar un fichero de configuración ``config.ru``
y por línea de comandos ejecutarlo en tiempo real usando ``rackup``

```Ruby
# config.ru
 
run Proc.new { |env| ['200', {'Content-Type' => 'text/html'}, ['get rack\'d']] }

```
Rackup es una herramienta útil para ejecutar aplicaciones Rack, que utiliza el DSL de Rack :: Builder para configurar middleware y crear aplicaciones fácilmente.

## Frameworks que soportan Rack

* Sinatra
* Ruby on Rails
* Padrino
* ...

## Instalación

```Ruby
gem install rack
```