data Serie = UnaSerie {
    nombre :: String,
    genero :: String,
    duracion :: Int,
    cantTemporadas :: Int,
    calificaciones :: [Int],
    esOriginalDeNetflis :: Bool
} deriving (Eq, Show)
  
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
tamanioMaraton = length
--OrdenSuperior
----1
--A)
promedioDuracionMaraton maraton = div (sum (duracionTotalSeriesMaraton maraton)) (tamanioMaraton maraton)
duracionTotalSerie serie = (*) (cantTemporadas serie) (duracion serie)
duracionTotalSeriesMaraton = map duracionTotalSerie 
--B)
promedioCalificacionMaraton maraton = div (sum (listaDeCalificacionesPromedio maraton)) (length (listaDeCalificacionesPromedio maraton))
promediocalficacionSerie serie  | (length.calificaciones) serie == 0 = 0  
								| otherwise = div ((sum.calificaciones) serie) ((length.calificaciones) serie)
listaDeCalificacionesPromedio = map promediocalficacionSerie 
--C)
promedioCalificacionesListaMaratones maratones =  div ((sum.listaCalificacionesMaratones) maratones) (length maratones)
listaCalificacionesMaratones = map promedioCalificacionMaraton
----2
--A)
laMejorCalificacion maraton = filter (\unaSerie->((maximum.listaDeCalificacionesPromedio) maraton) == promediocalficacionSerie unaSerie) maraton
--B)
laSerieMasLarga maraton = filter (\unaSerie->((maximum.duracionTotalSeriesMaraton) maraton) == duracionTotalSerie unaSerie) maraton
--C)
calificacionDeLaMaratonDeMaratones maratonDeMaratones= filter (\unaMaraton->((maximum.listaCalificacionesMaratones) maratonDeMaratones) == (promedioCalificacionMaraton unaMaraton)) maratonDeMaratones 
--3)
--A) 
dMoleitor unaSerie = UnaSerie{nombre = nombre unaSerie, genero =genero unaSerie,duracion = duracion unaSerie,cantTemporadas = cantTemporadas unaSerie,calificaciones =(reducirCalificaciones.calificaciones) unaSerie,esOriginalDeNetflis = esOriginalDeNetflis unaSerie}
reducirCalificaciones:: [Int] -> [Int]
reducirCalificaciones = (++[1]).filter (<=3)
--B)
hypear unaSerie | elem 1 (calificaciones unaSerie) = unaSerie
				|otherwise = UnaSerie{nombre = nombre unaSerie, genero=genero unaSerie,duracion= duracion unaSerie,cantTemporadas = cantTemporadas unaSerie, calificaciones = (sumarCalificacion.calificaciones) unaSerie, esOriginalDeNetflis = esOriginalDeNetflis unaSerie} 
--sumarCalificacion:: [Int]->[Int]

sumarCalificacion listaCalificacion = [(min (((+2).head) listaCalificacion) 5)]++(((take 1).tail) listaCalificacion)++[(min (((+2).last) listaCalificacion) 5)]  
hypeador = hypear 
--C)
valeLaPena unaSerie = ((cantTemporadas unaSerie)>1) && (((length.calificaciones) unaSerie)>=3)
exquisito unaSerie  | valeLaPena unaSerie = UnaSerie{nombre = nombre unaSerie, genero=genero unaSerie,duracion= duracion unaSerie,cantTemporadas = cantTemporadas unaSerie, calificaciones = [((+1).promediocalficacionSerie) unaSerie], esOriginalDeNetflis = esOriginalDeNetflis unaSerie} 
					| otherwise = unaSerie
---D)
cualquierColectivoLoDejaBien unaSerie = UnaSerie{nombre = nombre unaSerie, genero=genero unaSerie,duracion= duracion unaSerie,cantTemporadas = cantTemporadas unaSerie, calificaciones = ((++[5]).calificaciones) unaSerie, esOriginalDeNetflis = esOriginalDeNetflis unaSerie} 