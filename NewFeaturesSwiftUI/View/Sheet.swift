//
//  Sheet.swift
//  NewFeaturesSwiftUI
//
//  Created by Miguel Ferrer Fornali on 13/6/21.
//

import SwiftUI

struct Sheet: View {
    
    @Binding var showSheet:Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Customized System Images:").padding()
                Image(systemName: "cloud.sun.rain.fill")
                    .padding()
                    .font(.largeTitle)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.secondary, .yellow, .blue)
            }
            .navigationBarItems(trailing:
                Button(action: {
                showSheet.toggle()
                }, label: {
                    Image(systemName: "multiply.circle.fill").foregroundColor(.gray)
                })
            )
        }
    }
}

struct Sheet_Previews: PreviewProvider {
    static var previews: some View {
        Sheet(showSheet: .constant(true))
    }
}
