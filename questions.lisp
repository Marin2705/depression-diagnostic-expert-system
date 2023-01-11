; symptomes principaux :

    ; une tristesse constante
        ; une humeur dépressive qui dure presque toute la journée et qui se répète pratiquement tous les jours depuis au moins deux semaines. Elle peut s'accompagner de pleurs ;
    ; un abattement et une perte d'intérêt et de plaisir
        ; pour des activités du quotidien et aussi pour les activités habituellement agréables ;
    ; une réduction de l'énergie ou une fatigabilité anormale.
        ; La personne souffre d'une fatigue intense, souvent dès le matin et a l'impression de manquer d'énergie en permanence. Cette fatigue n'est pas améliorée par le repos ou le sommeil.

; symptomes secondaires :

    ; une dévalorisation de soi, une perte de confiance en soi et d'estime de soi, un sentiment d'inutilité ;
    ; un sentiment d'inutilité et une culpabilité excessive et injustifiée ;
    ; une vision du futur et de la vie très négative avec des perspectives pessimistes ;
    ; des pensées autour de la mort en général, et parfois autour du suicide ;
    ; une diminution de la capacité de concentration, d'attention et de mémorisation ;
    ; une dégradation du sommeil. Il devient peu réparateur, souvent trop court avec des réveils précoces, le matin ;
    ; une perte de l'appétit qui peut entraîner un amaigrissement.

; dépression chez les personnes âgées

; Après l'accouchement, baby blues et dépression du post-partum

(defparameter *questions* (list
    '(humeur ("Comment décririez-vous votre humeur en ce moment ?") (joie tristesse colere neutre peur))
    '(dureeJournee ("Cette humeur dure-t-elle toute la journée ou presque ?") (oui non))
    '(constance ("La ressentez-vous pratiquement tous les jours depuis au moins deux semaines ?") (oui non))

    '(troublePrincipal1 ("Avez-vous ressenti un abattement et une perte d'intérêt et de plaisir dans vos activités du quotidien et vos activités habituellement agréables ?") (oui non))

    '(troublePrincipal2 ("Ressentez-vous une réduction de l'énergie ou une fatigabilité anormale ?" "Souffrez-voous d'une fatigue intense, souvent dès le matin ?" "Avez-vous l'impression de manquer d'énergie en permanence ?" "Cette fatigue n'est pas améliorée par le repos ou le sommeil.") (oui non))


    '(troubleSecondaire1 ("Ressentez-vous une dévalorisation de soi, une perte de confiance en soi et d'estime de soi, un sentiment d'inutilité ?") (oui non))

    '(troubleSecondaire2 ("Ressentez-vous un sentiment d'inutilité et une culpabilité excessive et injustifiée ?") (oui non))

    '(vision ("Quelle est votre vision actuelle du futur et de la vie ?" "Est-elle très négative avec des perspectives pessimistes ?") (positive negative pessimiste optimiste neutre))

    '(troubleSecondaire4 ("Avez-vous des pensées autour de la mort en général, et parfois autour du suicide ?") (oui non))

    '(troubleSecondaire5 ("Avez-vous ressenti une diminution de la capacité de concentration, d'attention et de mémorisation ?") (oui non))

    '(troubleSecondaire6 ("Avez-vous ressenti une dégradation du sommeil ?" "Il devient peu réparateur, souvent trop court avec des réveils précoces, le matin") (oui non))

    '(troubleSecondaire7 ("Avez-vous ressenti une perte de l'appétit ?" "Celle-ci peut également entraîner un amaigrissement.") (oui non))



    ; '(nombreTroublesPrincipaux ("nombre de troubles principaux") "nombre" numberp)
    ; '(nombreTroublesSecondaires ("nombre de troubles secondaires") "nombre" numberp)
    ; '(moisDepuisAccouchement "nombre de mois depuis l'accouchement" numberp)
    ; '(symptomesPostnatale "nombre de symptomes de la dépression post-natale" numberp)
    ; '(genre "votre genre ? (H/F)" (H F))
    ; '(age "votre age ?" numberp)
    ; '(troublePhysiqueOuCognitif "avez-vous un trouble physique ou cognitif ? (oui/non)" (oui non))
))