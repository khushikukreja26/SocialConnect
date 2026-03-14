import SwiftUI
import MapKit

struct MapView: View {
    
    let user: User
    @State private var showFullMap = false
    
    var body: some View {
        
        let latitude = Double(user.address.geo.lat) ?? 0
        let longitude = Double(user.address.geo.lng) ?? 0
        
        let coordinate = CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
        
        Map(initialPosition: .region(region)) {
            Marker(user.name, coordinate: coordinate)
        }
        .frame(height: 300)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
        .shadow(radius: 6)
        
        .onTapGesture {
            showFullMap = true
        }
        
        .navigationDestination(isPresented: $showFullMap) {
            FullMapView(user: user)
        }
    }
    
    
    private var region: MKCoordinateRegion {
        
        let latitude = Double(user.address.geo.lat) ?? 0
        let longitude = Double(user.address.geo.lng) ?? 0
        
        return MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: latitude,
                longitude: longitude
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.2,
                longitudeDelta: 0.2
            )
        )
    }
}

