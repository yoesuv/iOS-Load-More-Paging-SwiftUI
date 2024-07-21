//
//  PagingGridView.swift
//  iOS Load More Paging Swift UI
//
//  Created by Yusuf Saifudin on 18/07/24.
//

import SwiftUI

struct PagingGridView: View {
    
    @ObservedObject var viewModel = PagingListViewModel()
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.posts) { post in
                        ItemPostGridView(post: post).onAppear {
                            if viewModel.posts.last == post {
                                viewModel.fetchPosts(page: viewModel.page)
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                if !viewModel.hasReachedMax {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .controlSize(.large)
                        .tint(.teal)
                }
            }
        }
        .onAppear {
            viewModel.fetchPosts(page: viewModel.page)
        }
    }
    
}

#Preview {
    PagingGridView()
}
