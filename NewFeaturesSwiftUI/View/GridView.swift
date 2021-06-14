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
                LazyVGrid(columns: [GridItem(.adaptive(minimum: minimumValue))], spacing: 20) {
                    ForEach(1...10, id: \.self) { number in
                        Image(systemName: "\(number).circle.fill")
                    }
                }
                HStack {
                    Slider(value: self.$minimumValue, in: 20...500)
                    Text("Minimum value: \(minimumValue)")
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
