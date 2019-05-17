# Netflis
 
### *Sacando series y películas buenas del catálogo desde 1997.*

A lo largo de los años, los streamings multimedia se han hecho más y más famosos, llegando incluso a superar la misma televisión. Netflis pretende ser la empresa más importante de este rubro, gracias a su gran catálogo. En esta ocasión nos han pedido que modelemos las series que ofrecerán en su catálogo, para así darle una buena experiencia al usuario. Sabemos que una serie se compone de un nombre, un género, una duración total en horas, una cantidad de temporadas, una calificación (en una escala de 5 estrellas) y si es original de Netflis.

Tenemos las siguientes definiciones sobre las cuales partir:

```haskell
data Serie = UnaSerie {
    nombre :: String,
    genero :: String,
    duracion :: Int,
    cantTemporadas :: Int,
    calificaciones :: [Int],
    esOriginalDeNetflis :: Bool
} deriving (Eq, Show)
```


```haskell
tioGolpetazo = UnaSerie {
    nombre = "One punch man",
    genero = "Monito chino",
    duracion = 24,
    cantTemporadas = 1,
    calificaciones = [5],
    esOriginalDeNetflis = False
}
 
cosasExtranias = UnaSerie {
    nombre = "Stranger things",
    genero = "Misterio",
    duracion = 50,
    cantTemporadas = 2,
    calificaciones = [3,3],
    esOriginalDeNetflis = True
}

dbs = UnaSerie {
    nombre = "Dragon ball supah",
    genero = "Monito chino",
    duracion = 150,
    cantTemporadas = 5,
    calificaciones = [],
    esOriginalDeNetflis = False
}

espejoNegro = UnaSerie {
    nombre = "Black mirror",
    genero = "Suspenso",
    duracion = 123,
    cantTemporadas = 4,
    calificaciones = [2],
    esOriginalDeNetflis = True
}

rompiendoMalo = UnaSerie {
    nombre = "Breaking Bad",
    genero = "Drama",
    duracion = 200,
    cantTemporadas = 5,
    calificaciones = [],
    esOriginalDeNetflis = False
}

treceRazonesPorque = UnaSerie {
    nombre = "13 reasons why",
    genero = "Drama",
    duracion = 50,
    cantTemporadas = 1,
    calificaciones = [3,3,3],
    esOriginalDeNetflis = True
}
```

## Parte 1: Listas básicas
     
1. Crear una maratón con los ejemplos dados. Una maratón es una colección de series.
2. Saber la cantidad de series del maratón
3. Saber si una serie es popular: una serie se considera popular si recibió 3 o más calificaciones.
4. Averiguar si una serie vale la pena, es decir, si tiene más de una temporada y tiene 3 o más calificaciones.
5. Saber si una maratón vale la pena: una maratón vale la pena si la primera y la última serie de la maratón valen la pena, o bien si está el drama "Breaking Bad", con 5 temporadas y 200 minutos, sin calificar, que no es original de netflis.
6. Averiguar si una maratón repunta al final, lo que sucede si la primera mitad de las series constituyen una maratón que no valdría la pena, pero la segunda mitad sí. (si es cantidad impar de series de la maratón, la segunda mitad tiene una serie más que la primera)
7. Calcular la calificación de una serie. Es el promedio de las calificaciones recibidas, (redondeado hacia abajo) 
8. Obtener la dispersión de las calificaciones de la serie, que es la diferencia entre la mejor y peor calificación. (Si todas las calificaciones son coincidentes, se deduce que la dispersión es 0), 
9. Calificar una serie, que significa agregar una nueva calificación al final de las anteriores.
10. Hypear una serie: cuando se hypea una serie, se alteran la primer y última calificación recibida, aumentándola en 2 estrellas (recordá que la escala de calificación es de 5 estrellas máximo). Si la serie recibió alguna calificación de 1 estrella, no se puede hypear.

## Parte 2: Jugando más con listas
1. Obtener todas las series que sean de monitos chinos
2. Obtener las series  originales de Netflis que valen la pena.
3. Obtener las series que tengan una cantidad n de temporadas
4. Saber si una maratón (una lista de series) es flojita: una maratón se considera flojita cuando todas sus series son de 1 temporada
5. Dada una maratón, saber cuánto tiempo se tarda en ver esa maratón completa
6. Actualizar la forma de saber si una maratón vale la pena: una maratón vale la pena si al menos una serie de la maratón vale la pena; o bien, si Breaking Bad forma parte de la maratón. 
7. Dada una maratón de series, saber la calificación más alta que se le dio a una serie original de Netflis
8. Dada una maratón de series, hypear las series que corresponda. Una serie debe ser hypeada si es de drama o de suspenso 

## Parte 3: Alto orden
1. Se quieren obtener más promedios, en todos los casos, redondeados hacia abajo:
* Obtener el promedio de duración de las series de una maratón (considerar duración por cantidad de temporadas).
* Obtener la calificación de una maratón, que es el promedio de calificaciones de las series que componen la maratón. 
* Obtener el promedio de calificaciones de una lista de maratones.
2. También se buscan algunos records:
* La serie mejor calificada de una maratón
* La serie más larga de una maratón
* Dada una lista de maratones, encontrar la mejor de todas, que es la maratón que tiene la mejor calificación.
3. Aparecen los críticos de series, que se especializan en analizar y establecer calificaciones. Cada crítico tiene su preferencia respecto de cuáles series calificar y cómo hacerlo. 
Por ejemplo, están los siguientes
* *D. Moleitor:* Se especializa en series flojitas, elimina todas sus calificaciones mayores a 3, si hubiera alguna, y agrega una calificacion 1 al final. 
* *Hypeador:* A todas las series que se pueden hypear, las hypea (como se explicó anteriormente).
Exquisito: Prefiere las series que valen la pena. Sustittuye todas sus calificaciones recibidas por un nueva lista con una única calificación, que es el promedio de calificaciones más uno. 
* *CualquierColectivoLoDejaBien:* A todas las series les agrega una calificación de 5. 


