//
//  AppNavigationStore.swift
//  iOS Load More Paging Swift UI
//
//  Created by Yusuf Saifudin on 18/07/24.
//

import SwiftUI

public class AppNavigationStore: ObservableObject {
    @Published public var path = NavigationPath()
    public init(){}
}
