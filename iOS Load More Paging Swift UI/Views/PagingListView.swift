//
//  PagingListView.swift
//  iOS Load More Paging Swift UI
//
//  Created by Yusuf Saifudin on 18/07/24.
//

import SwiftUI

struct PagingListView: View {
    
    @ObservedObject var viewModel = PagingListViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: .zero) {
                ForEach(viewModel.posts) { post in
                    ItemPostView(post: post).onAppear {
                        if viewModel.posts.last == post {
                            viewModel.fetchPosts(page: viewModel.page)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchPosts(page: viewModel.page)
        }
    }
    
}
