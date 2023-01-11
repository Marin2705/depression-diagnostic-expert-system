; Base de règles

(defparameter *BR* (list
    '(R1 ((type_activite eq intellectuelle)) 'triste))
    '(R2 ((type_activite eq physique)) 'manque_interer))
    '(R3 ((type_intellectuelle eq creative)) 'trouble_sommeil))
    '(R4 ((type_intellectuelle eq culturelle)) 'trouble_appetit))
    '(R5 ((type_intellectuelle eq reflexive)) 'difficulte_concentration))
    '(R6 ((type_intellectuelle eq detente)) 'faible_estime))
    '(R7 ((type_intellectuelle eq detente)) 'causes_externes_fortes))

;;La dépression réactionnelle

    '(R8 ((type_intellectuelle eq detente)) 'perte_emotionnelle))
    '(R9 ((type_intellectuelle eq detente)) 'ralentissement_psychomoteur))
    '(R10 ((type_intellectuelle eq detente)) 'perte_libido))
    '(R11 ((type_intellectuelle eq detente)) 'pas_causes_externes))
    '(R12 ((type_intellectuelle eq detente)) 'intensité_symptomes_forte))

;;La dépression endogène

    '(R13 ((type_intellectuelle eq detente)) 'intensité_symptomes_faible))
    '(R14 ((type_intellectuelle eq detente)) 'sensible_environnement)) 
    '(R15 ((type_intellectuelle eq detente)) 'causes_externes_faibles))

;;La dépression névrotique

    '(R16 ((type_intellectuelle eq detente)) 'acouchement_4_8_semaines))


;;La dépression du post-partum
    
    '(R17 ((type_intellectuelle eq detente)) 'vieu))
    '(R18 ((type_intellectuelle eq detente)) 'vieille))
    '(R19 ((type_intellectuelle eq detente)) 'mort_conjoint))
    '(R20 ((type_intellectuelle eq detente)) 'maladie))
    '(R21 ((type_intellectuelle eq detente)) 'faible_famille))

;;La dépression de la personne âgée

    '(R22 ((type_intellectuelle eq detente)) 'pas_depressif_en_general))
    '(R23 ((type_intellectuelle eq detente)) 'saison_hiver))

;;La dépression saisonnière

    '(R24 ((type_intellectuelle eq detente)) 'continue))
    '(R25 ((type_intellectuelle eq detente)) 'discontinue_bipolaire))

;;La maniaco-dépression

    '(R26 ((type_intellectuelle eq detente)) 'plaintes_régulières))
    '(R27 ((type_intellectuelle eq detente)) 'symptomes_somatiques))
    '(R28 ((type_intellectuelle eq detente)) 'symptomes_psycho_comportementaux ))
    '(R29  ((type_intellectuelle eq detente)) 'non_symptomes_depressif ))

;;La dépression masquée
