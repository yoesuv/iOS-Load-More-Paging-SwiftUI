//
//  PagingListViewModel.swift
//  iOS Load More Paging Swift UI
//
//  Created by Yusuf Saifudin on 18/07/24.
//

import Foundation
import Combine

public class PagingListViewModel: ObservableObject {
    
    private var subscriptions = Set<AnyCancellable>()
    @Published var page = 1
    @Published var hasReachedMax = false
    @Published var posts:[PostModel] = []
    
    private let networkService = NetworkService()
    
    public func fetchPosts(page: Int) {
        if self.hasReachedMax { return }
        Task {
            let request = await networkService.fetchPost(page: self.page, limit: 20)
            request.receive(on: DispatchQueue.main)
                .dropFirst()
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure:
                        self.hasReachedMax = true
                        self.page = 1
                    }
                }, receiveValue: { value in
                    if value.isEmpty {
                        self.hasReachedMax = true
                    } else {
                        self.hasReachedMax = false
                        self.page += 1
                        self.posts += value
                    }
                })
                .store(in: &subscriptions)
        }
    }
    
}
