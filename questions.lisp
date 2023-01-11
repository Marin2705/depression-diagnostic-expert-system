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

(defun testHF(x)
    (or (equalp x 'H) (equalp x 'F)))

(defun testYesNo(x)
    (or (equalp x 'oui) (equalp x 'non)))

(defparameter *questions* (list
    '(troublePrincipal1 ("Avez-vous ressenti le symptome suivant :" "une tristesse constante" "une humeur dépressive qui dure presque toute la journée et qui se répète pratiquement tous les jours depuis au moins deux semaines. Elle peut s'accompagner de pleurs" "(réponse attendue : oui/non)") testYesNo)

    '(troublePrincipal2 ("Avez-vous ressenti le symptome suivant :" "un abattement et une perte d'intérêt et de plaisir" "pour des activités du quotidien et aussi pour les activités habituellement agréables" "(réponse attendue : oui/non)") testYesNo)

    '(troublePrincipal3 ("Avez-vous ressenti le symptome suivant :" "une réduction de l'énergie ou une fatigabilité anormale." "La personne souffre d'une fatigue intense, souvent dès le matin et a l'impression de manquer d'énergie en permanence. Cette fatigue n'est pas améliorée par le repos ou le sommeil." "(réponse attendue : oui/non)") testYesNo)

    '(troubleSecondaire1 ("Avez-vous ressenti le symptome suivant :" "une dévalorisation de soi, une perte de confiance en soi et d'estime de soi, un sentiment d'inutilité" "(réponse attendue : oui/non)") testYesNo)

    '(troubleSecondaire2 ("Avez-vous ressenti le symptome suivant :" "un sentiment d'inutilité et une culpabilité excessive et injustifiée" "(réponse attendue : oui/non)") testYesNo)

    '(troubleSecondaire3 ("Avez-vous ressenti le symptome suivant :" "une vision du futur et de la vie très négative avec des perspectives pessimistes" "(réponse attendue : oui/non)") testYesNo)

    '(troubleSecondaire4 ("Avez-vous ressenti le symptome suivant :" "des pensées autour de la mort en général, et parfois autour du suicide" "(réponse attendue : oui/non)") testYesNo)

    '(troubleSecondaire5 ("Avez-vous ressenti le symptome suivant :" "une diminution de la capacité de concentration, d'attention et de mémorisation" "(réponse attendue : oui/non)") testYesNo)

    '(troubleSecondaire6 ("Avez-vous ressenti le symptome suivant :" "une dégradation du sommeil. Il devient peu réparateur, souvent trop court avec des réveils précoces, le matin" "(réponse attendue : oui/non)") testYesNo)

    '(troubleSecondaire6 ("Avez-vous ressenti le symptome suivant :" "une perte de l'appétit qui peut entraîner un amaigrissement." "(réponse attendue : oui/non)") testYesNo)



    ; '(nombreTroublesPrincipaux ("nombre de troubles principaux") numberp)
    ; '(nombreTroublesSecondaires ("nombre de troubles secondaires") numberp)
    '(moisDepuisAccouchement "nombre de mois depuis l'accouchement" numberp)
    '(symptomesPostnatale "nombre de symptomes de la dépression post-natale" numberp)
    '(genre "votre genre ? (H/F)" testHF)
    '(age "votre age ?" numberp)
    '(troublePhysiqueOuCognitif "avez-vous un trouble physique ou cognitif ? (vrai/faux)" testYesNo)
))