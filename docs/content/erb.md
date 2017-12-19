# Vistas (.erb)

Una vista es una página web o un fragmento que se guarda en un archivo aparte. En una vista podríamos guardar, por tanto, toda la estructura de una página, o si preferimos una organización más minuciosa y por módulos, podremos guardar simplemente una sección, como puede ser la cabecera, pie, barra de navegación, etc.

Nosotros hemos optado por ERB **(Embedded RuBy)**. Es una característica de Ruby que permite generar cualquier clase de texto, cualquier tamaño de fichero, desde plantillas. Éstas combinan texto sin formato con código Ruby para la sustitución de variables y control de flujo, lo que facilita su escritura y mantenimiento.

El framework Sinatra soporta varios tipos de plantillas: .haml, .erb, .rhtml, etc. En nuestro caso, hemos
optado por el formato .erb para renderizar las diferentes vistas que usa nuestra aplicación.

## Vistas en el controlador

Cada tipo de plantilla en Sinatra se renderiza con su propio método. En el caso de nuestra "Landing Page", en el controlador tendremos que especificar que una vez que se acceda a la página principal, la vista que se cargue sea `index.erb` (nuestra página principal):

```ruby
get '/' do
  erb :index
end
```

Esto especificará que esta vista se renderice en `views/index.erb`.

## Estilos en las vistas

Por defecto, una vez se añada en cada vista el fichero `.css` que vayamos a usar, en el controlador se le tendrá que especificar a Sinatra desde donde se cargan los ficheros:

```ruby
set :public_folder, 'public'
```
