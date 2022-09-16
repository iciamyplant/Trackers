//
//  ContentView.swift
//  Location_tracking
//
//  Created by Amy Plant on 15/09/2022.
//

import MapKit
import SwiftUI //kit qui permet dutiliser les elements graphiques

/*struct ContentView: View
{
    //@StateObject private var viewModel = ContentViewModel()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.856614, longitude: 2.3522219), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)) //center c'est là où la map est centrée de base, span c'est le zoom
    var body: some View
    {
        Map(coordinateRegion: $region) //c'est ici qu'on lance notre map
            .ignoresSafeArea() //ignorer la barre blanche en haut et en bas
            //.onAppear
            //{
            //    viewModel.checkIfLocationServicesIsEnabled()
            //}
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}*/

// ------------------------------------------------------------------

struct ContentView: View
{
    @StateObject private var viewModel = ContentViewModel()
    //@State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.856614, longitude: 2.3522219), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)) //center c'est là où la map est centrée de base, span c'est le zoom
    var body: some View
    {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true) //c'est ici qu'on lance notre map
            .ignoresSafeArea() //ignorer la barre blanche en haut et en bas
            //.accentColor(Color(.systemPink)) //changer la couleur du bouton de loc
            .onAppear
            {
                viewModel.checkIfLocationServicesIsEnabled()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate //on ajoute NSObject, car le user peut desactiver la loc meme plus tard, donc faut toujours check, pas qu'une fois au debut
{
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.856614, longitude: 2.3522219), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)) //center c'est là où la map est centrée de base, span c'est le zoom
    var locationManager: CLLocationManager? //notre location manager
    
    func checkIfLocationServicesIsEnabled() //permet detre sur que les services de localisation du phone sont on, sinon rien ne va marcher
    {
        if CLLocationManager.locationServicesEnabled() //renvoit un boolean true si activé, et alors rentre ds boucle c OK
        {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            //locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        }
        else
        {
            print("Localisation non activée")
        }
    }
    
    private func checkLocationAuthorization()
    {
        guard let locationManager = locationManager else {return}
        switch locationManager.authorizationStatus
        {
            
        case .notDetermined://ca ca veut dire qu'il faut demander la permission
            locationManager.requestWhenInUseAuthorization()
        case .restricted: //peut etre restrictif car control parental etc.
            print("Votre location est restrictive")
        case .denied:
            print("Vous avez refusé l'accès à la localisation, veuillez-vous rendre dans les paramètres")
        case .authorizedAlways, .authorizedWhenInUse :
            region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.856614, longitude: 2.3522219), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))//centrer sur paris
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager)
    {
        checkLocationAuthorization()
    }
}


