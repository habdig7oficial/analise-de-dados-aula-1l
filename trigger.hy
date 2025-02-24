(import lib [gera_relatorio])
(import matplotlib [pyplot :as plt])
(setv arr  [291, 10.9, 47, 86, 44, 18.9, 1, 50, 190.4, 45.7, 28.5, 18.9, 16, 34, 8.6, 9.6])

(gera_relatorio arr)
(setv [fig, ax] (.subplots plt))

(.boxplot ax arr)

(.savefig plt "hello")


(setv arr2  [20, 35, 8, 70, 5, 15, 25, 30, 40, 35, 10, 12, 40, 15, 20])
(gera_relatorio arr2)

(setv [fig2, ax2] (.subplots plt))

(.boxplot ax2 arr2)

(.savefig plt "hello2")

