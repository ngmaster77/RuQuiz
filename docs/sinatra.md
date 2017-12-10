# Sinatra
Sinatra es un [DSL](https://es.wikipedia.org/wiki/Lenguaje_de_dominio_espec%C3%ADfico) (Domain Specific Language) que permite crear aplicaciones web en Ruby con una sintaxis sencilla y fácilmente legible.

Para instalar la gema y usarla en nuestro proyecto escribimos en la consola 
```$ gem install sinatra```

En caso de tener un Gemfile, basta con añadir la siguiente línea a este fichero 
```ruby 
gem 'sinatra'
```
Una vez hecho esto, escribimos en la consola ```$ bundle install```.

### Rutas
En Sinatra, una ruta es un método HTTP junto a un patrón de un URL. Cada ruta está asociada a un bloque, peor ejemplo:

```ruby 
get '/' do
  .. mostrar algo ..
end

post '/' do
  .. crear algo ..
end

delete '/' do
  .. eliminar algo ..
end
```
Las rutas son comparadas en el orden en el que son definidas. La primera ruta que coincide con la petición es escogida.

También es posible definir rutas que reciben parámetros. Éstos son accesibles a través del hash **_params_**:
```ruby
get '/hola/:nombre' do
  # coincide con "GET /hola/foo" y "GET /hola/bar"
  # params['nombre'] es 'foo' o 'bar'
  "Hola #{params['nombre']}!"
end
```

También es posible realizar lo mismo usando parámetros de bloque:
```ruby
get '/hola/:nombre' do |n|
  # coincide con "GET /hola/foo" y "GET /hola/bar"
  # params['nombre'] es 'foo' o 'bar'
  # n almacena params['nombre']
  "Hola #{n}!"
end
```

### Archivos estáticos
Los archivos estáticos son servidos desde el directorio público ./public, como es el caso de nuestro proyecto. Sin embargo, se puede especificar una ubicación diferente ajustando la opción :public_folder:

```ruby
set :public_folder, File.dirname(__FILE__) + '/estaticos'
```

### Sesiones
Una sesión es usada para mantener el estado a través de distintas peticiones. Cuando están activadas, proporciona un hash de sesión para cada sesión de usuario.

```ruby
enable :sessions

get '/' do
  "valor = " << session[:valor].inspect
end
```

Para incrementar la seguridad, los datos de la sesión almacenados en la cookie son firmados con un secreto de sesión. Este secreto, es generado aleatoriamente por Sinatra. De cualquier manera, hay que tener en cuenta que cada vez que inicies la aplicación se va a generar uno nuevo.
En nuestro caso, hemos decidido que todas las instancias de nuestra aplicación compartan un único secreto, el cual se define así:
```ruby
set :session_secret, 'super secreto'
```

### Redirección del navegador
Sinatra incluye el método *redirect* para redireccionar a una ruta:
```ruby
get '/foo' do
  redirect to '/bar'
end
```
Para redireccionar a la ruta desde donde vino el usuario:
```ruby
get '/bar' do
  .... hacer algo ....
  redirect back
end
```
Para pasar argumentos con una redirección:
```ruby 
redirect to '/bar?suma=42'
```