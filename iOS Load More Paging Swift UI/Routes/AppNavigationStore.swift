//
//  AppNavigationStore.swift
//  iOS Load More Paging Swift UI
//
//  Created by Yusuf Saifudin on 18/07/24.
//

import SwiftUI

@MainActor
class AppNavigationStore: ObservableObject {
    @Published var path = NavigationPath()

    func navigate(to route: AppRoute) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}
