//
//  GridView.swift
//  NewFeaturesSwiftUI
//
//  Created by Miguel Ferrer Fornali on 14/6/21.
//

import SwiftUI

struct GridView: View {
    
    @ObservedObject var viewModel = ViewModel()
    @State var minimumValue:Double = 100
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumValue))], spacing: 20) {
                        ForEach(1...50, id: \.self) { number in
                            Image(systemName: "1.circle.fill")
                        }
                    }.padding()
                }
                HStack {
                    Slider(value: self.$minimumValue, in: 10...200)
                    Text("Minimum value: \(minimumValue)")
                }.padding()
            }
            .navigationBarTitle(Text("Grid"))
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
