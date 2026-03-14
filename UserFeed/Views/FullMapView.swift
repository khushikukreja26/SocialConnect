import SwiftUI
import MapKit

struct FullMapView: View {
    
    let user: User
    
    var body: some View {
        
        let latitude = Double(user.address.geo.lat) ?? 0
        let longitude = Double(user.address.geo.lng) ?? 0
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
        
        Map(initialPosition: .region(region)) {
            Marker(user.name, coordinate: region.center)
        }
        .ignoresSafeArea()
        .navigationTitle("User Location")
    }
}
