//
//  iOS_Load_More_Paging_Swift_UIApp.swift
//  iOS Load More Paging Swift UI
//
//  Created by Yusuf Saifudin on 14/07/24.
//

import SwiftUI

@main
struct iOS_Load_More_Paging_Swift_UIApp: App {
    
    @StateObject private var appNavStore = AppNavigationStore()
    
    var body: some Scene {
        WindowGroup {
            MainPagingView()
                .environmentObject(appNavStore)
        }
    }
}
