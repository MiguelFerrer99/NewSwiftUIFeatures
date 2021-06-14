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
    @State var showSheet = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Users")) {
                    ForEach(viewModel.users) { user in
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
                Section(header: Text("Others")) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Miguel")
                        Text("quediuen@gmail.com")
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Joan")
                        Text("agarrala@gmail.com")
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
                    searchText == "" ? true : user.email.lowercased().contains(searchText.lowercased())
                }) { user in
                    Text(user.email)
                        .searchCompletion(user.name)
                }
            })
        }.onAppear {
            async {
                await viewModel.getUsers()
            }
        }
        .safeAreaInset(edge: .bottom) {
            Button {
                showSheet.toggle()
            } label: {
                Text("Open sheet").foregroundColor(.white).padding()
            }.frame(width: UIScreen.main.bounds.width - 100)
                .background(Color.blue)
                .clipShape(Capsule())
                .padding(.bottom)
                
        }
        .sheet(isPresented: self.$showSheet) {
            Sheet(showSheet: self.$showSheet)
                .interactiveDismissDisabled(true)
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
