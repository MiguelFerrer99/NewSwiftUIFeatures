//
//  ImageView.swift
//  NewFeaturesSwiftUI
//
//  Created by Miguel Ferrer Fornali on 13/6/21.
//

import SwiftUI

struct ImageView: View {
    
    @State var url = URL(string: "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png")!
    
    var body: some View {
        
        NavigationView {
            VStack {
                AsyncImage(url: url, scale: 1.0) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300)
                    }else {
                        ProgressView()
                    }
                }
            }
            .navigationTitle(Text("Async Image"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ControlGroup {
                        Button {
                            print("User details")
                        } label: {
                            Image(systemName: "person.fill")
                        }
                    }
                }
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
