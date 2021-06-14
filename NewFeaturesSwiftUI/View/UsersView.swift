//
//  UsersView.swift
//  NewFeaturesSwiftUI
//
//  Created by Miguel Ferrer Fornali on 13/6/21.
//

import SwiftUI

struct UsersView: View {

    @ObservedObject var viewModel = ViewModel()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Users")) {
                    ForEach(viewModel.users.filter{user in
                        searchText == "" ? true : user.name.lowercased().contains(searchText.lowercased())
                    }) { user in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.name)
                            Text(user.email)
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button {
                                print("User removed")
                            } label: {
                                Image(systemName: "multiply.circle.fill")
                            }
                            .tint(.red)
                            Button {
                                print("User added")
                            } label: {
                                Image(systemName: "person.fill.badge.plus")
                            }
                            .tint(.blue)
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button {
                                print("User pinned")
                            } label: {
                                Image(systemName: "pin.fill")
                            }
                            .tint(.yellow)
                        }
                    }
                }.headerProminence(.increased)
                .listStyle(.insetGrouped)
            }
            .navigationTitle(Text("Users"))
            .refreshable(action: {
                await viewModel.getUsers()
            })
            .searchable("Search User", text: self.$searchText, placement: .navigationBarDrawer(displayMode: .always), suggestions: {
                ForEach(viewModel.users.filter{user in
                    searchText == "" ? true : user.name.lowercased().contains(searchText.lowercased())
                }) { user in
                    Text(user.name)
                        .searchCompletion(user.name)
                }
            })
        }.onAppear {
            async {
                await viewModel.getUsers()
            }
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
