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
    '(R9 ((= personneAgee T) (= troublePhysiqueOuCognitif T)) (= etatDepressif T))))
