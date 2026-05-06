//
//  ContentView.swift
//  iOS Load More Paging Swift UI
//
//  Created by Yusuf Saifudin on 14/07/24.
//

import SwiftUI

public struct MainPagingView: View {
    
    @EnvironmentObject private var appNavStore: AppNavigationStore
    
    public var body: some View {
        NavigationStack(path: $appNavStore.path) {
            VStack(spacing: .zero) {
                Spacer()
                Button(action: {
                    appNavStore.navigate(to: .pagingList)
                }, label: {
                    Text("Pagination List")
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1))
                })
                Button(action: {
                    appNavStore.navigate(to: .pagingGrid)
                }, label: {
                    Text("Pagination Grid")
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1))
                })
                .padding(.top, 10)
                Spacer()
            }
            .padding()
            .navigationTitle("Infinite Scroll")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .pagingList:
                    PagingListView()
                case .pagingGrid:
                    PagingGridView()
                }
            }
        }
    }
    
}

#Preview {
    MainPagingView()
}
