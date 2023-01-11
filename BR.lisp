; Base de règles

(defparameter *BR* (list
    '(R1 ((tristesse eq oui)) 'triste)
    '(R2 ((faible_interet eq oui)) 'manque_interer)
    '(R3 ((trouble eq sommeil)) 'trouble_sommeil)
    '(R4 ((trouble eq appetit)) 'trouble_appetit)
    '(R5 ((trouble eq concentration)) 'trouble_concentration)
    '(R6 ((estime_de_soi eq oui)) 'faible_estime)
    '(R7 ((evennement_traumatisant >= 5)) 'causes_externes_fortes)

;;La dépression réactionnelle

    '(R8 ((empathie eq oui)) 'perte_emotionnelle)
    '(R9 ((ralentissement_psychomoteur eq oui)) 'ralentissement_psychomoteur)
    '(R10 ((libido eq oui)) 'perte_libido)
    '(R11 ((evennement_traumatisant = 0)) 'pas_causes_externes)
    '(R12 ((intensite >= 5)) 'intensité_symptomes_forte)

;;La dépression endogène

    '(R13 ((intensite < 5)) 'intensité_symptomes_faible)
    '(R14 ((environnement eq oui)) 'sensible_environnement)
    '(R15 ((evennement_traumatisant < 5) (evennement_traumatisant != 0)) 'causes_externes_faibles)

;;La dépression névrotique

    '(R16 ((sexe eq femme) (nb_acouchement > 4) (nb_acouchement < 8)) 'acouchement_4_8_semaines)

;;La dépression du post-partum
    
    '(R17 ((sexe eq homme) (age > 79)) 'vieu_sensible)
    '(R18 ((sexe eq femme) (age > 85)) 'vieille_sensible)
    '(R19 ((décé eq oui)) 'mort_conjoint)
    '(R20 ((maladies eq oui)) 'maladie)
    '(R21 ((famille eq oui)) 'faible_famille)

;;La dépression de la personne âgée

    '(R22 ((continuite eq oui)) 'pas_depressif_en_general)
    '(R23 ((hiver eq oui)) 'saison_hiver)

;;La dépression saisonnière

    '(R24 ((saut_humeur eq oui)) 'discontinue_bipolaire)

;;La maniaco-dépression

    '(R25 ((plainte eq oui)) 'plaintes_régulières)
    '(R26 ((proche_station eq oui)) 'symptomes_somatiques)
    '(R27  ((sensation_depression eq non)) 'non_symptomes_depressif )

;;La dépression masquée

    '(R28  ((futur eq oui)) 'vision_futur_négatif )
))
