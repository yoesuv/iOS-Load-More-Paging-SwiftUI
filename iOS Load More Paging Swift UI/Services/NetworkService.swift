//
//  NetworkService.swift
//  iOS Load More Paging Swift UI
//
//  Created by Yusuf Saifudin on 18/07/24.
//

import Foundation
import Alamofire
import Combine

public class NetworkService {
    
    private let baseUrl = "https://jsonplaceholder.typicode.com/posts"
    
    func fetchPost(page: Int, limit: Int) async -> AnyPublisher<[PostModel], AFError> {
        let subject = CurrentValueSubject<[PostModel], AFError>([])
        let params: Parameters = [
            "_page": page,
            "_limit": limit
        ]
        AF.request(
            baseUrl,
            method: .get, parameters: params,
            encoding: URLEncoding.queryString
        )
        .responseDecodable(of: [PostModel].self) { response in
            switch response.result {
            case .success(_):
                subject.send(response.value ?? [])
            case .failure(_):
                subject.send(completion: .failure(response.error!))
            }
        }
        return subject.eraseToAnyPublisher()
    }
}
