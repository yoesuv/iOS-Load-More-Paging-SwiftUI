//
//  ItemPostGridView.swift
//  iOS Load More Paging Swift UI
//
//  Created by Yusuf Saifudin on 21/07/24.
//

import SwiftUI

struct ItemPostGridView: View {
    
    private var title: String = ""
    
    init(post: PostModel) {
        self.title = "\(post.id ?? 0). \(post.title ?? "")"
    }
    
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .aspectRatio(1, contentMode: .fit)
            .border(Color.gray.opacity(0.2), width: 1)
            .overlay(
                Text(title)
                    .font(.caption)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(4)
                    .padding(8)
            )
    }
}
