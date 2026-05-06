//
//  PagingGridView.swift
//  iOS Load More Paging Swift UI
//
//  Created by Yusuf Saifudin on 18/07/24.
//

import SwiftUI

struct PagingGridView: View {
    
    @ObservedObject var viewModel: PagingListViewModel
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    init(viewModel: PagingListViewModel = PagingListViewModel()) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.posts) { post in
                        ItemPostGridView(post: post).onAppear {
                            if viewModel.posts.last == post {
                                viewModel.fetchPosts()
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
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

#Preview {
    PagingGridView()
}
