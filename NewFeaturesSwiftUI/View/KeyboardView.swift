//
//  Keyboard.swift
//  NewFeaturesSwiftUI
//
//  Created by Miguel Ferrer Fornali on 14/6/21.
//

import SwiftUI

struct KeyboardView: View {
    
    private enum Field: Int, Hashable {
        case first, second
    }
    @FocusState private var focusedField : Field?
    
    var body: some View {
        NavigationView {
            Form {
                Label {
                    TextField("TextField 1...", text: .constant(""))
                        .focused(self.$focusedField, equals: .first)
                        .submitLabel(.next)
                        .onSubmit {
                            focusedField = .second
                        }
                } icon: {
                    Image(systemName: "1.circle.fill")
                }
                Label {
                    TextField("TextField 2...", text: .constant(""))
                        .focused(self.$focusedField, equals: .second)
                        .submitLabel(.done)
                } icon: {
                    Image(systemName: "2.circle.fill")
                }
                Button {
                    focusedField = .first
                    print("Focused TF1")
                } label: {
                    Text("Focus TF1")
                }
                Button {
                    focusedField = .second
                    print("Focused TF2")
                } label: {
                    Text("Focus TF2")
                }
                Button {
                    print("Submitted")
                    focusedField = nil
                } label: {
                    Text("Submit")
                }
            }
            .navigationBarTitle(Text("Keyboard"))
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView()
    }
}
