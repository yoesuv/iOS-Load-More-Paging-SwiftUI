//
//  AppRoute.swift
//  iOS Load More Paging Swift UI
//
//  Created by Yusuf Saifudin on 18/07/24.
//

import SwiftUI

public enum AppRoute: Hashable {
    case pagingList
    case pagingGrid
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .pagingList:
            PagingListView()
        case .pagingGrid:
            PagingGridView()
        }
    }
    
}
