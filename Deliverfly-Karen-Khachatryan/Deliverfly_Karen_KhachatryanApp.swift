//
//  Deliverfly_Karen_KhachatryanApp.swift
//  Deliverfly-Karen-Khachatryan
//
//  Created by user on 6/16/24.
//

import SwiftUI

@main
struct Deliverfly_Karen_KhachatryanApp: App {
    @ObservedObject private var navigation = Navigation()
    @State private var IsSplash = true;
    
    var body: some Scene {
        WindowGroup {
            if IsSplash {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            IsSplash = false
                        }
                    }
            } else {
                NavigationStack(path: $navigation.path) {
                    HomeView()
                        .navigationBarBackButtonHidden()
                        .navigationDestination(for: Navigation.View.self) { view
                            in
                            switch view {
                            case .restaurant(let info):
                                RestaurantView(restaurant: info)
                                    .navigationBarBackButtonHidden()
                            }
                        }
                }
                .environmentObject(navigation)
            }
        }
    }
}
