# Integración continua
La integración continua consiste en ejecutar automáticamente las pruebas del proyecto al agregar una nueva funcionalidad en la rama master. El objetivo de la integración continua es detectar errores cuanto antes.

En este proyecto se ha empleado [travis-ci](https://travis-ci.org "Travis Homepage"). La ejecución de las pruebas se hace en cada commit en la rama master, de esta manera nos aseguramos que al añadir una nueva funcionalidad, las pruebas se ejecutan correctamente.

Para añadir Travis al proyecto primero es necesario añadir un fichero *.travis.yml* y especificar las versiones de Ruby en las que se van a ejecutar los tests.

```ruby
language: ruby
rvm:
  - 2.3.0
  - 2.4.0
```