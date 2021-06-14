//
//  ViewModel.swift
//  NewFeaturesSwiftUI
//
//  Created by Miguel Ferrer Fornali on 13/6/21.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    func getUsers() async {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        let session = URLSession(configuration: .default)
        do {
            let task = try await session.data(from: url)
            let users = try JSONDecoder().decode([User].self, from: task.0)
            self.users = users
        } catch {
            print("Error")
        }
    }
}
