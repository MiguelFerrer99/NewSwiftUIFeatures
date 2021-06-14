//
//  ContentView.swift
//  NewFeaturesSwiftUI
//
//  Created by Miguel Ferrer Fornali on 13/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var numberOfNotifications = 5
    
    var body: some View {
        TabView {
            UsersView().tabItem {
                Image(systemName: "person.circle.fill")
                Text("Users")
            }.badge(numberOfNotifications)
            ImageView().tabItem {
                Image(systemName: "photo.fill")
                Text("AsyncImage")
            }.badge(numberOfNotifications)
            KeyboardView().tabItem {
                Image(systemName: "keyboard.fill")
                Text("Keyboard")
            }.badge(numberOfNotifications)
            GridView().tabItem {
                Image(systemName: "rectangle.3.offgrid.fill")
                Text("Grid")
            }.badge(numberOfNotifications)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
