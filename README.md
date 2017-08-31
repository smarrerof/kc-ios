# Westeros
Práctica de Fundamentos iOS con Swift 4 del V KeepCoding Startup Engineering Master Bootcamp (2017)

## Objetivos
Se debe extender el código realizado durante las sesiones prácticas con las siguientes funcionalidades:
* Crea la clase Season que representa una temporada. Debe de tener un número > 0 de episodios, un nombre y fecha de lanzamiento
* Cada episodio está representado por una instancia de Episode. Cada Episode tiene un título y una fecha de emisión.
* Todo episodio tiene una referencia a la Season de la que es parte. ¡Mucho cuidado con crear referencias circulares! Mírate weak en la parte opcional. La referencia que tiene Episode a
Season ha de ser *weak*.

Luego
* Implementa los siguientes protocolos en Episode y Season con sus correspondientes tests (CustomStringConvertible, Equatable, Hashable, Comparable)
* Crea una propiedad calculada en tu Repository.local llamada seasons (similar a houses). Devuelve las primeras 6 temporadas, ordenadas, con sus episodios (2 por temporada, no hace falta ponerlos todos :).
* Crea una función en tu Repository.local llamada seasons(filteredBy:) > [Season] que acepta una clausura (similar a lo que hicimos para houses) y te permite recibir un [Season] filtrado.
* Crea un SeasonsViewController (tabla, ya sea usando la técnica genérica descrita más arriba o repitiendo el código). Al hacer clic sobre una celda, se debe de hacer un push de un SeasonViewController.
* Haz lo equivalente para EpisodesViewController y EpisodeViewController
* Nueva Interfaz:
  + Crea a un HousesViewController empaquetado dentro de un NavigationController.
  + Crea un SeasonsViewController empaquetado dentro de un NavigationViewController
  + Mete a ambos dentro de un UITabBarController empaquetado dentro de un NavigationController.
  + Usa éste como rootViewController de tu App. Asegúrate de poder cambiar de uno a otro y poder navegar de House a Person y de Season a Episode.

A parte de lo expuesto anteriormente se han investigado y desarrollado los siguientes aspectos
* Uso de ScrollView
* Uso de CustomCell
* Creación de un LauchScreen
* Uso de imágenes en el TabBar
