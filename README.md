## I - Définition

Trackers = pisteurs =  « morceau » de logiciel en charge de collecter des informations sur la personne qui utilise une application, ou bien sur les usages ou l'environnement de cette personne

Liste non exhaustive de pisteurs sur Android : [liste](https://reports.exodus-privacy.eu.org/fr/trackers/)

| Type tracker | Explication | 
|----------|-------|
| Crash reporting | gestion des crashes des applications, infos collectées permettent d'avertir du dysfonctionnement au développeur + aider à résoudre | 
| Analytics |  collecter des données d'usage, permet au développeur de mieux connaître son audience| 
| Profiling | récupérer un maximum d'informations sur la personne qui utilise une application afin d'en construire un profil virtuel (historique de navigation, liste des applications installées..)| 
| Identification | déterminer votre identité numérique. Cette identité peut faire référence à une identité officielle ou bien à des identifiants abstraits (pseudonyme, etc). L'objectif sera, par exemple, de pouvoir corréler les activités en ligne et hors ligne d'une personne |
|Ads|identifier la personne qui utilise une application afin de lui présenter de la publicité ciblée. Cela n'est rendu possible et pertinent que si cette personne dispose déjà d'un profil virtuel, objectif de monétiser son application|
|Location| déterminer la position géographique d'un mobile. Via : puce GPS, antennes GSM environnantes, réseaux wi-fi environnants, balises Bluetooth environnantes ou encore de sons particuliers émis par des hauts-parleurs|

# II - Coder une application test

- Application Native = codées dans un langage qui est pris en charge en natif par le système d’exploitation d’un appareil spécifique
- Application Hybride = sont « multi-plateformes » qui n’ont pas besoin d’être construites séparément pour Android et iOS

Y a plein de langages voilà quelques un principaux : 

| Langage | Android | Apple | Commentaire
|----------|-------|-------|-------|
|Objective-C||oui||
|Swift||oui|Successeur d’Objective-C, langage de programmation open-source, lancé par Apple|
|Java|oui|||
|Kotlin|oui|||
|React Native|oui|oui||

Développement Web côté serveur = PHP, ASP.NET, Node.JS, Python, etc

### II.1 Xcode

Xcode est un environnement de développement pour macOS, ainsi que pour iOS, watchOS et tvOS. Le iOS SDK est combiné avec Xcode
- premier fichier = carte d'identité de l'application (OS utilisé, etc.)
- fenêtre de droite donne l'ensemble des informations sur le fichier que je suis en train d'éditer
- il y a les fichiers en .swift
- le fichier main.storyboard = permet de faire toute la partie design de l'app
- assets = l'ensemble des visuels que l'on veut importer dans l'application (par exemple une image)
- launchscreen.storyboard = c'est le fichier quand on lance l'application (souvent y a une petite animation)
- info.plist = regroupe les infos nécessaires quand on publie l'app sur le store. Regroupe un certain nombre d'infos qui permet d'identifier l'app sur l'app store. C'est là qu'on déclare des keys spécifiques lorsqu'on veut utiliser des infos personnnelles sur l'utilisateur (localisation, etc.)
- xcode tests = sert à décrire des cas de tests unitaires
- Tests UI = des tests mais que de l'UI
- Dossier Products = c'est la que y a xcode.app, c'est ce fichier qu'on pousse sur le store
- Sur la fenêtre de gauche, troisième onglet, on a accès à toutes les classes, et toutes les méthodes qui composent chaque classes
- developer.apple.com ==> tout un tas d'informations, doc, explication des nouveautés etc, pour les développeurs d'applications apple.

|SwiftUI| StoryBoard|
|-----|----|
|Swift UI is basically a toolkit released by apple to create UI’s in a declarative way |Interface Builder editor within Xcode ==> makes it simple to design a full user interface without writing any code. Simply drag and drop windows, buttons, text fields, and other objects onto the design canvas to create a functioning user interface|

Framework SwiftUI = a declarative framework that developers use to compose the layout and behavior of multiplatform apps

### II.2 Syntaxe Swift

[voir tutoriels youtube](https://www.youtube.com/c/ObjectifD%C3%A9veloppeur/videos)

````
var nomVariable = valeur
let nomConstante = valeur
//option + clic sur la constante = ns donne son type
let test = "coucou"
test.count //nb de caractères dans la string test
test.uppercased() //met en majuscules

func #creer fonction
func nomDeLaFonction(nomParametre: TypeParametre) -> TypeRetour
{
}

struct #permet de creer notre propre type avec des variables dedans
struct Utilisateur //NomDeLaStructure
{
  // propriétés(=variables liées à une strucutre) et méthodes (=fonction liée à un type)
  let marque: String
  var kilometrage: Int //propriété
  func klaxonner() //méthode
  {
  }
}

let jean = Utilisateur(Prenom: "jean", age:39) // une instance est une variable du type de notre strucutre
jean.age // accéder a une propriété dinstance
marie.age += 1 // modifier une prorpiété dinstance
jean.sePresenter() //imaginons que y a une fonction dans la structure Utilisateur
//les struct c'est des copies, alors que les class, tu changes les valeurs direct dnas la class

Get, Set, didSet willSet

var tableauEntiers: [Int] = [] //créer un tableau vide
var listeCourses : [String] = ["oeuf", "pâtes"]
var dictionnnaireEntiers: [Int: String] = [:] //creer un dict vide
var partieflechettes: [String : Int] = ["Pierre": 139, "Lea": 236]
partieflechettes["Pierre"]   //accéder a un elt du dict

y a une main view controller, et des child view controller, chaque page qui peut s'afficher a sa view controller
```` 

### II.3 First App

[Tuto suivi](https://www.youtube.com/watch?v=2C8J9SJ1os8)
````
./Trackers/First_app 
````



# III - Récupérer des informations sur l'utilisateur

### III.1 Récupérer la localisation

1. Importer MapKit & lancer map
````
import MapKit
@State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.856614, longitude: 2.3522219), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)) //center c'est là où la map est centrée de base, span c'est le zoom. Coordonnées de Paname
Map(coordinateRegion: $region, showsUserLocation: true) //c'est ici qu'on lance notre map
.ignoresSafeArea() //ignorer la barre blanche en haut et en bas
````
2. Permission
==> On ne peut pas avoir la localisation de l'utilisateur sans sa permission
Nous ajoutons une vue pour tous les elements de localisation
````
final class ContentViewModel: ObservableObject
{
}
````
La principale chose dont on a besoin pour avoir l'emplacement du user est le locationManager.
````
var locationManager: CLLocationManager? //notre location manager
locationManager = CLLocationManager()
// on peut faire plein de choses avec le location manager : 
// comme activityType => spécifier quel type d'action (courir, vélo, marche, voiture)
// comme desiredAccuracy =>  spécifie la précision de la loc, au kilomètre, dans les 100m, etc.
````
[CLLocationManager Documentation](https://developer.apple.com/documentation/corelocation/cllocationmanager)

Il faut check d'abord si la localisation du tel est alumée + si on a bien l'autorisation d'avoir la localisation.
Pour les autorisations de la localsiation plusieurs cas : on peut avoir une autorisation déjà en place, une autorisation limitée, etc.
````
        case .notDetermined:
            <#code#>
        case .restricted:
            <#code#>
        case .denied:
            <#code#>
        case .authorizedAlways:
            <#code#>
        case .authorizedWhenInUse:
            <#code#>
        @unknown default:
            <#code#>
````

Aller dans le fichier plist, ajouter une propriété + mettre le message à droite de pourquoi l'app a beosin de la loc



3. On doit obligatoirement demander l'autorisation, donc ajouter une propriété dans le info.plist
- quand le téléphone utilise l'application - Privacy when in use
- quand l'application est en arrière plan - Privacy

Permissions : Les permissions sont demandées sur google play que pour les autorisations qui sont considérées comme dangereuses par Google.
C’est Google qui décide de quelles permissions nécessitent l’autorisation et lesquelles non. Par exemple, pour avoir accès à toutes les applications d’un téléphone, pas besoin de permissions.


### III.2 Autres informations

- Micro
- Camera
- Photo library
- Contacts

### III.3 Regarder l'activité réseau de l'application, quelles informations vont où ?

Consulter la façon dont les apps utilisent les autorisations qui leur ont été accordées : Accédez à Réglages  > Confidentialité, puis touchez « Rapport de confidentialité des apps » (iOS 15.2 ou ultérieur)

Le rapport de confidentialité des apps vous indique comment les apps utilisent les autorisations que vous leur avez accordées, ainsi que leur activité réseau. Il affiche les domaines internes utilisés par les applications et vous permet de savoir quels services/sites Web tiers, y compris les outils d’analyse et de suivi, sont contactés par l’application en arrière-plan.


# IV - Pourquoi et comment des tiers récupèrent des données via mon application ?
### IV.1 Trackers tiers

On développe une code base, sur cette code base on pose des SDK (software development kit). SDK = Software development kit = collection of software development tools in one installable package. They facilitate the creation of applications by having a compiler, debugger and sometimes a software framework. J'ai utilisé des SDK pour gagner du temps ⇒ c’est justement dans les SDKs que je mets des trackers et que des données partent vers Google, Facebook, etc.

Il y a plein de types de SDK : pour faciliter de l’UX/UI, des animations, se connecter à des services clouds, notification de crash, publicité, tracking, profilage, analyse comportementale, etc. Ils permettent de réduire les coûts de développement = par exemple pour monétiser avec Google.

Ces SDK = sont des boîtes noires, c’est difficile de savoir ce qu’ils font vraiment. Certains SDK embarquent d’autres SDK. Ils vont collecter des données pour leur propose fonctionnement et envoyer les données sur les serveurs de Facebook ou Google. Les top des bibliothécaires qu’on trouve dans les applications Android sont : Google Facebook Yahoo Twitter. Quand on intègre le SDK de Facebook, ça va, sans même que l’utilisateur de l’application ce soit connecté avec son compte, collecter des données et créer un profil fantome qui va collecter différents usages du téléphone etc.

### IV.2 Le marché de la publicité ciblée

Les données récupérées servent à transformer les informations en un profil qui va être vendu aux annonceurs qui veulent cibler le plus précisément possible leurs publicités. Il y a aussi des sociétés qu’on ne connaît pas forcément qui agrègent toutes ces données pour les revendre. Qui récupèrent des petits morceaux à droite et à gauche et, avec toutes ces données, on obtient un être virtuel. Plus cet être est constitué, on va dire plus on a de données sur lui, plus il vaut cher.

Avertising ID = identifiants, propres à chaque smartphone, initialement conçus pour les régies publicitaires (id sans avoir le vrai nom prenom etc)
- approche la plus commune = calculer une empreinte du smartphone en collectant, par exemple, la marque, le nom du modèle, le nom et la version du firmware, la taille de l'écran, etc. Ainsi, si cet identifiant est réinitialisé, il sera fort probablement possible de l'associer à l'ancien, simplement en vérifiant l'empreinte du smartphone
- autre approche = collecte d'identifiants uniques non réinitialisables (adresse MAC de la puce wi-fi, IMEI de la puce GSM, android id généré par Android lors du premier démarrage du smartphone)

### IV.4 La concentration des données personnelles

````
./Trackers/Androidtrackers_analyse //Analyse de données fournies par Exodus Privacy sur les trackers Android
// travail fait dans le cadre du Master 2 IREN, avec @annemkht and @te-mbu
````


# V - Apple Guidelines ? Politique de Confidentialité des apps ? Quelles solutions ?

Quels sont les checks qui sont faits pour pouvoir être sur Google Play ? Sur l'Apple Store ?

Les entreprises doivent faire de l’audit et adapter, injecter des données dans l’application, puis voir où partent les données, à qui.
les SDK adaptent leur comportement selon l’environnement d’exéctuion, donc ne pas faire le test en debug.

# VI - Exodus Privacy

Ils n’ont pas accès au code source des applications, ils doivent se contenter des classes Java, qu’il récupèrent grâce à l’outil DexDump. D’un côté avoir l’application, récupérer la liste des classes Java, de l’autre côté avoir la liste des pisteurs qu’on a et puis on vérifie si telle ligne existe dans les pisteurs.

