//
//  PostModel.swift
//  iOS Load More Paging Swift UI
//
//  Created by Yusuf Saifudin on 18/07/24.
//

import Foundation

public struct PostModel: Codable, Equatable, Identifiable {
    
    public let id: Int?
    public let userId: Int?
    public let title: String?
    public let body: String?
    
}
