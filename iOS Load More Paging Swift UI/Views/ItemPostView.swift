//
//  ItemPostView.swift
//  iOS Load More Paging Swift UI
//
//  Created by Yusuf Saifudin on 20/07/24.
//

import SwiftUI

struct ItemPostView: View {
    
    private var title: String = ""
    private var content: String = ""
    
    init(post: PostModel) {
        self.title = "\(post.id ?? 0) \(post.title ?? "")"
        self.content = post.body ?? ""
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text(title)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .padding(.horizontal, 16)
            Text(content)
                .font(.caption2)
                .fontWeight(.regular)
                .foregroundStyle(.black.opacity(0.8))
                .padding(.horizontal, 16)
            Divider()
                .padding(.vertical, 8)
        }
    }
    
}
