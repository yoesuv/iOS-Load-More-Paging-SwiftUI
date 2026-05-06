//
//  PagingListViewModel.swift
//  iOS Load More Paging Swift UI
//
//  Created by Yusuf Saifudin on 18/07/24.
//

import Foundation
@preconcurrency import Combine

@MainActor
class PagingListViewModel: ObservableObject {
    
    @Published var page = 1
    @Published var hasReachedMax = false
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var posts: [PostModel] = []
    
    private let networkService = NetworkService()
    
    nonisolated init() {}
    
    func fetchPosts() {
        guard !hasReachedMax, !isLoading else { return }
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let result = try await networkService.fetchPost(page: page, limit: 20)
                if result.isEmpty {
                    hasReachedMax = true
                } else {
                    page += 1
                    posts += result
                }
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
    
}
