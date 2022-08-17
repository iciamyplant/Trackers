Trackers = pisteurs =  « morceau » de logiciel en charge de collecter des informations sur la personne qui utilise une application, ou bien sur les usages ou l'environnement de cette personne

| Type tracker | Explication | 
|----------|-------|
| Crash reporting | gestion des crashes des applications, infos collectées permettent d'avertir du dysfonctionnement au développeur + aider à résoudre | 
| Analytics |  collecter des données d'usage, permet au développeur de mieux connaître son audience| 
| Profiling | récupérer un maximum d'informations sur la personne qui utilise une application afin d'en construire un profil virtuel (historique de navigation, liste des applications installées..)| 
| Identification | déterminer votre identité numérique. Cette identité peut faire référence à une identité officielle ou bien à des identifiants abstraits (pseudonyme, etc). L'objectif sera, par exemple, de pouvoir corréler les activités en ligne et hors ligne d'une personne |
|Ads|identifier la personne qui utilise une application afin de lui présenter de la publicité ciblée. Cela n'est rendu possible et pertinent que si cette personne dispose déjà d'un profil virtuel, objectif de monétiser son application|
|Location| déterminer la position géographique d'un mobile. Via : puce GPS, antennes GSM environnantes, réseaux wi-fi environnants, balises Bluetooth environnantes ou encore de sons particuliers émis par des hauts-parleurs|

# créer une application mobile

étapes de création d'une app mobile?
apparition des SDKs ? SDK = Software development kit = collection of software development tools in one installable package. They facilitate the creation of applications by having a compiler, debugger and sometimes a software framework

# identification

Avertising ID = identifiants, propres à chaque smartphone, initialement conçus pour les régies publicitaires (id sans avoir le vrai nom prenom etc)

- approche la plus commune = calculer une empreinte du smartphone en collectant, par exemple, la marque, le nom du modèle, le nom et la version du firmware, la taille de l'écran, etc. Ainsi, si cet identifiant est réinitialisé, il sera fort probablement possible de l'associer à l'ancien, simplement en vérifiant l'empreinte du smartphone
- autre approche = collecte d'identifiants uniques non réinitialisables (adresse MAC de la puce wi-fi, IMEI de la puce GSM, android id généré par Android lors du premier démarrage du smartphone)


https://reports.exodus-privacy.eu.org/fr/trackers/


