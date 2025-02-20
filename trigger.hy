(import math)
(defn mediana [dados]
	       (if (= (% (len dados) 2) 0)
                (/ (+
                        (get dados (.ceil math(- (/ (len dados) 2) 1)))
                        (get dados (.ceil math (/ (len dados) 2)))
                ) 2)
                (get dados (int (/ (len dados) 2)))
        )
)
(defn gera_relatorio [dados] 
	(.sort dados)
	(setv media (/ (sum dados) (len dados) ))
        (setv med (mediana dados))
	(setv qt1 (mediana (get dados (slice None (int(/ (len dados) 2))))))
	(setv qt3 (mediana (get dados (slice (int(/ (len dados) 2)) None))))
	(setv aiq (- qt3 qt1))
	(setv [ls li] [
			(+ med (* 1.5 aiq))
			(- med (* 1.5 aiq))
	])
	(setv se [] nse [])
	(lfor i dados (.append se (** (- i media)  2)))
	(setv s (/ (sum se) (- (len se) 1) ) )	
	(setv dp (.sqrt math s))

	(lfor i dados (.append nse (- i media) ))
        (setv ns (/ (sum nse) (- (len nse) 1) ) )	


	(print f"
média: {media}
------------------
TEORIA DOS 5 NÚMEROS
min: {(min dados)}
qt1: {qt1}
med: {med}
qt3: {qt3}
max: {(max dados)}
------------------
aiq: {aiq}
ls: {ls}
li: {li}
------------------
se: {se}
s2: {s}
dp: {dp}

/*--------------*/
nse: {nse}
ns: {ns}
	")
)

(setv arr  [291, 10.9, 47, 86, 44, 18.9, 1, 50, 190.4, 45.7, 28.5, 18.9, 16, 34, 8.6, 9.6])

(print arr)
(gera_relatorio arr)
