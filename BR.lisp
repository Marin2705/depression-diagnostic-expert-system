; Base de règles

(defparameter *BR* (list
    '(R1 ((>= nombreTroublesPrincipaux 2)) (= ressentTroublesPrincipaux T))
    '(R2 ((>= nombreTroublesSecondaires 2)) (= ressentTroublesSecondaires T))
    ; '(R ((= accouchementCetteAnnee T)) (= accouchementRecent T)) ; demander si déjà accouché avant de demander depuis combien de mois...
    '(R3 ((<= moisDepuisAccouchement 6)) (= accouchementRecent T))
    '(R4 ((>= symptomesPostnatale 1)) (= ressentSymptomesPostnatale T))
    '(R5 ((= genre 'homme) (>= age 79)) (= personneAgee T))
    '(R6 ((= genre 'femme) (>= age 85)) (= personneAgee T))

    '(R7 ((= ressentTroublesPrincipaux T) (= ressentTroublesSecondaires T)) (= etatDepressif T))
    '(R8 ((= accouchementRecent T) (= ressentSymptomesPostnatale T)) (= etatDepressif T))
    '(R9 ((= personneAgee T) (= troublePhysiqueOuCognitif T)) (= etatDepressif T))
    
    ; troubles principaux
    '(R10 ((= troublePrincipal1 T) (= troublePrincipal2 T) (= troublePrincipal3 T)) (= ressentTroublesPrincipaux T))
    '(R11 ((= troublePrincipal1 T) (= troublePrincipal2 T)) (= ressentTroublesPrincipaux T))
    '(R12 ((= troublePrincipal1 T) (= troublePrincipal3 T)) (= ressentTroublesPrincipaux T))
    '(R13 ((= troublePrincipal2 T) (= troublePrincipal3 T)) (= ressentTroublesPrincipaux T))
    
    ; trouble principal 1
    '(R14 ((= humeur tristesse) (= dureeJournee oui) (= constance oui)) (= troublePrincipal1 T))
    
    ; trouble secondaire 3
    '(R15 ((= vision pessimiste)) (= troubleSecondaire3 T))
    '(R16 ((= vision negative)) (= troubleSecondaire3 T))

    ; troubles secondaires
    ;: TODO règle pour les 7 troubles secondaires (trop de combinaison, trouver comment les écrire)
    ))
