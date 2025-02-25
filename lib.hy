(import math)
(import decimal [Decimal])
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
    (print f"Dataset: {dados}\n")
	(.sort dados)
	(setv media (/ (sum dados) (len dados) ))
        (setv med (mediana dados))
	(setv minv (min dados))
	(setv qt1 (mediana (get dados (slice None (.ceil math (/ (len dados) 2))))))
	(setv qt3 (mediana (get dados (slice (.ceil math (/ (len dados) 2)) None))))
	(setv maxv (max dados))

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
Média:       {media}
------------------
TEORIA DOS 5 NÚMEROS
Mínimo:      {minv}
1º Quartil:  {qt1}
Mediana:     {med}
3º Quartil:  {qt3}
Máximo:      {maxv}
------------------
AIQ: {aiq}
ls:  {ls}
li:  {li}
------------------
Elementos: {se}\n
Variância:       {s}
Desvio Padrão:   {dp}

/*--------------*/
nse: {nse}
ns: {(round (Decimal ns) 3)}
\n-- FIM DO RELATÓRIO --
	")
	(return {
		:media media
		:minV minv
		:qt1 qt1
		:med med
		:qt3 qt3
		:maxv maxv
		:aiq aiq
		:ls ls
		:li li
		:se se
		:s s
		:dp dp
 	})
)