# I - Définition

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



# III - Application avec map et user location

### III.1 Récupérer la localisation

[User Location on a Map Tutoriel - SwiftUI](https://www.youtube.com/watch?v=hWMkimzIQoU)

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


### III.2 Stocker les données de localisation avec Firebase



[tutoriel récupérer des données dans une real-time database à partir de Xcode](https://www.simplifiedios.net/firebase-realtime-database-tutorial/)


# IV - Activité réseau d'un téléphone

- Micro
- Camera
- Photo library
- Contacts

Consulter la façon dont les apps utilisent les autorisations qui leur ont été accordées : Accédez à Réglages  > Confidentialité, puis touchez « Rapport de confidentialité des apps » (iOS 15.2 ou ultérieur)

Le rapport de confidentialité des apps vous indique comment les apps utilisent les autorisations que vous leur avez accordées, ainsi que leur activité réseau. Il affiche les domaines internes utilisés par les applications et vous permet de savoir quels services/sites Web tiers, y compris les outils d’analyse et de suivi, sont contactés par l’application en arrière-plan.

# V - La concentration des données personnelles

````
./Trackers/Androidtrackers_analyse //Analyse de données fournies par Exodus Privacy sur les trackers Android
// travail fait dans le cadre du Master 2 IREN, avec @annemkht and @te-mbu
````
