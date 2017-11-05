# bcrypt

Es un algoritmo de cifrado de hashing. Los algoritmos Hash toman una entrada  de datos (por ejemplo, la contraseña de  usuario) y crean una "huella digital" o hash de la misma. Como este proceso no es reversible, no hay forma de obtener la contraseña.

``
hash(p) #=> <unique gibberish>
``

Puede almacenar el hash y verificarlo con una contraseña validada:

``
<unique gibberish> =? hash(just_entered_password)
``


## Password_digest: cómo encriptar nuestros datos en la base de datos


Cuando construya una aplicación web con Ruby , deberá implementar una autenticación de usuario. Si busca ejemplos de autenticación, encontrará una columna llamada 'password_digest' en la tabla de migración de usuarios, en lugar de 'contraseña' para el atributo del modelo de usuario. Pero en los formularios sign_up y log_in, el nombre de entrada es 'password', no 'password_digest'. Entonces, ¿de dónde viene este password_digest? Para evitar el robo de contraseñas, la contraseña se cifra antes de almacenarse en su base de datos. Esto se hace por bcrypt ruby ​​gem. El bcypt Ruby gem te proporciona el método has_secure_password. El método has_secure_password encripta las contraseñas mezclando y hasheando las contraseñas y generando 'password_digest'.[Para mas informacion](https://en.wikipedia.org/wiki/Bcrypt)