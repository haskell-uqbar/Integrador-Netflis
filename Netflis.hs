data Serie = UnaSerie {
    nombre :: String,
    genero :: String,
    duracion :: Int,
    cantTemporadas :: Int,
    calificaciones :: [Int],
    esOriginalDeNetflis :: Bool
} deriving (Eq, Show, Ord)
  
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

--Listas
maraton1 = [tioGolpetazo,cosasExtranias,dbs,espejoNegro,rompiendoMalo,treceRazonesPorque]
maraton2 = [tioGolpetazo]
listaMaraton = [maraton1,maraton1]
listaMaraton2 = [maraton1,maraton2]
--OrdenSuperior
----1
--A)
promedioSegun funcion lista = div ((sum.map funcion) lista) (length lista)
promedioDuracionMaraton = promedioSegun duracionTotalSerie
promedioCalificacionesMaraton = promedioSegun calificacionesSerie

avg lista = promedioSegun id lista
calificacionesSerie = avg.calificaciones
duracionTotalSerie serie = cantTemporadas serie * duracion serie

promedioCalificacionesMaratones listaMaratones = promedioSegun promedioCalificacionesMaraton listaMaratones
promedioCalificacionesMaratonesPF = promedioSegun promedioCalificacionesMaraton
----2
--A)
maximoSegun funcion lista = foldl1 (maxSegun funcion) lista
maxSegun funcion x y 
 |funcion x > funcion y = x
 |otherwise = y

laMejorCalificacion maraton = maximoSegun calificacionesSerie maraton
--B)
laSerieMasLarga maraton = maximoSegun duracionTotalSerie maraton
--C)
laMejorMaraton maratones = maximoSegun laMejorCalificacion maratones
--3)
--A) 

type Calificaciones = [Int]
data Critico = UnCritico {
    criterio :: (Serie -> Bool),
    comoCalifica :: (Calificaciones-> Calificaciones)
}


--A
dMoleitor = UnCritico {
 criterio = serieFloja, 
 comoCalifica = reducirCalificaciones
 }

serieFloja serie = cantTemporadas serie == 1
reducirCalificaciones:: [Int] -> [Int]
reducirCalificaciones lista = (filter (>=3) lista) ++ [1]
--reducirCalificaciones = (++[1]).filter (>=3)

--B
hypeador = UnCritico {
 criterio = hypeable, 
 comoCalifica = hypear
 }

hypeable serie = notElem 1 (calificaciones serie)
premiar numero = min 5 (numero + 2)
sinHeadNiTail = tail.init
hypear calificaciones = [(premiar.head) calificaciones] ++ sinHeadNiTail calificaciones ++ [(premiar.last) calificaciones] 
--C
exquisito = UnCritico {
 criterio = valeLaPena, 
 comoCalifica = calificarExquisito
 }
valeLaPena unaSerie = cantTemporadas unaSerie >1 && length (calificaciones unaSerie) >= 3
calificarExquisito calificaciones = [avg calificaciones + 1]

--D
cualquierColectivoLoDejaBien = UnCritico {
    criterio = (\_ -> True), 
    comoCalifica = (++[5])
    } 

criticar critico unaSerie 
    | (criterio critico) unaSerie = unaSerie{calificaciones = (comoCalifica critico) (calificaciones unaSerie)}
    | otherwise = unaSerie 

--calificarMaraton unCritico maraton = map (criticar unCritico) maraton 

