# Fonctionnement 

trackers / coockie






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

Comment crée-t-on une application mobile ?

⇒ Je vais utiliser des SDK pour gagner du temps ⇒ expliquer que c’est justement dans les SDKs que je mets des trackers et que des données partent vers Google, Facebook, etc

on développe une code base + des assets, sur cette code base on pose des SDK (software development kit), ceux de facebook, ou google. Ces SDK vont collecter des données pour leur propose fonctionnement et envoyer les données sur les serveurs de facebook ou google.

Il y a plein de types de SDK : pour faciliter de l’UX/UI, des animations, se connecter à des services clouds, notification de crash, publicité, tracking, profilage, analyse comportementale, etc.

SDK ?
facilement intégrable dans nos applications, ça permet que c’est 
ces SDK = sont une boîte noire, c’est difficile de savoir ce qu’ils font
ca permet de réduire les coûts de développement = par exemple pour monétiser avec google
top des bibliothécaires qu’on trouve dans les applications android : Google Facebook Yahoo Twitter

Certains SDK sont malveillants : y a même eu un trojan qui était introduit dans un SDK qui permet de prendre le contrôle à distance d’un mobile.

Quand on intègre le SDK de Facebook, ça va, sans même que l’utilisateur de l’application ce soit connecté avec son compte, ça va collecter des données et créer un profil fantome qui va collecter différents usages du téléphone etc
certains SDK embarquent d’autres SDK

Monétisation
Google, Facebook, etc vont permettre de monétiser cette applciation, 

risques : détournement d’usage, détournement de données
fuites de données d’applications : ca arrive souvent. Comment ?

Solutions ?
Les entreprises doivent faire de l’audit et adapter
Injecter des données dans l’application, puis voir où partent les données, à qui
les SDK adaptent leur comportement selon l’environnement d’exéctuion, donc ne pas faire le test en debug






Travail d’exodus privacy : ils n’ont pas accès au code source des applications, ils doivent se contenter des classes Java, qu’il récupèrent grâce à l’outil DexDump

Fonctionnement des trackers
Le but du tracker c’est de collecter de la donnée. Ça peut être aussi bien des données à caractère personnel, donc ça peut être par exemple de la géolocalisation, un identifiant unique, des choses comme ça, et puis ça peut être des données d’usage, par exemple l’application ne fonctionne pas bien sur tel modèle de téléphone. Donc, dans l’application, on va se retrouver avec des bouts de code qui font, on va dire, le métier de l’application, par exemple une application de météo c’est donner la météo et, à côté de ça, il va y avoir potentiellement des pisteurs qui vont faire d’autres choses, par exemple collecter la géolocalisation et l’envoyer à une régie publicitaire.

Quand on utilise une application qui a des pisteurs, sans le savoir, dès qu’on lance l’application on se connecte avec plein d’acteurs qui n’ont rien à voir avec l’application et à qui sont envoyées des informations.

il y a quand même des bons pisteurs et des mauvais pisteurs ; des pisteurs qui servent au bon fonctionnement de l’application elle-même, par exemple à faire remonter un bug, et puis d’autres pisteurs qui sont juste là pour envoyer ces informations à des régies publicitaires.

Ca fait quoi si y a plein de gens qui ont nos données ? ⇒ ensuite avec de l’analyse de données, ca crée de la connaissance ⇒ Ça sert à le transformer en un profil qui va être vendu aux annonceurs qui veulent cibler le plus précisément possible leurs publicités.

Il y a aussi des sociétés qu’on ne connaît pas forcément qui agrègent toutes ces données pour les revendre. Qui récupèrent des petits morceaux à droite et à gauche et, avec toutes ces données, on obtient un être virtuel. Plus cet être est constitué, on va dire plus on a de données sur lui, plus il vaut cher.

Quels sont les checks qui sont faits pour google play ?

données collectées avec un identifiant publicitaire qui est spécifique au téléphone. Ensuite on rattache 


Permissions
Les permissions sont demandées sur google play que pour les autorisations qui sont considérées comme dangereuses par Google.
C’est Google qui décide de quelles permissions nécessitent l’autorisation et lesquelles non. Par exemple, pour avoir accès à toutes les applications d’un téléphone, pas besoin de permissions.

Vérifier s’il y a des pisteurs

d’un côté avoir l’application, récupérer la liste des classes Java, ça s’appelle comme ça, et, de l’autre côté avoir la liste des pisteurs qu’on a et puis on vérifie si telle ligne existe dans les pisteurs.

