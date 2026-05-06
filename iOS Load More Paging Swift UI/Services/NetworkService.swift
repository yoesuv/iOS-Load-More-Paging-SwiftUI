//
//  NetworkService.swift
//  iOS Load More Paging Swift UI
//
//  Created by Yusuf Saifudin on 18/07/24.
//

import Foundation
import Alamofire

@MainActor
class NetworkService {
    
    private let baseUrl = "https://jsonplaceholder.typicode.com/posts"
    
    func fetchPost(page: Int, limit: Int) async throws -> [PostModel] {
        let params: Parameters = [
            "_page": page,
            "_limit": limit
        ]
        return try await AF.request(
            baseUrl,
            method: .get,
            parameters: params,
            encoding: URLEncoding.queryString
        )
        .serializingDecodable([PostModel].self)
        .value
    }
}
