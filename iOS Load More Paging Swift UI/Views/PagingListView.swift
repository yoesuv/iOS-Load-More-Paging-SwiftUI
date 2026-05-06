//
//  PagingListView.swift
//  iOS Load More Paging Swift UI
//
//  Created by Yusuf Saifudin on 18/07/24.
//

import SwiftUI

struct PagingListView: View {
    
    @ObservedObject var viewModel: PagingListViewModel
    
    init(viewModel: PagingListViewModel = PagingListViewModel()) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .center, spacing: .zero) {
                ForEach(viewModel.posts) { post in
                    ItemPostView(post: post).onAppear {
                        if viewModel.posts.last == post {
                            viewModel.fetchPosts()
                        }
                    }
                }
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .controlSize(.large)
                        .tint(.teal)
                }
                if let errorMessage = viewModel.errorMessage {
                    VStack(spacing: 8) {
                        Text(errorMessage)
                            .font(.caption)
                            .foregroundStyle(.red)
                        Button("Retry") {
                            viewModel.fetchPosts()
                        }
                        .font(.caption)
                        .tint(.teal)
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            viewModel.fetchPosts()
        }
    }
    
}
