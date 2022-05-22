//
//  AnimalReduxApp.swift
//  AnimalRedux
//
//  Created by Кирилл Тила on 22.05.2022.
//

import SwiftUI

@main
struct AnimalReduxApp: App {
    
    private let store: AppStore = .init(state: AppState(),
                                        rootReducer: RootReducer(),
                                        middlewares: [
                                            AnimalMiddleware.middleware(service: AnimalService())
                                        ])
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
