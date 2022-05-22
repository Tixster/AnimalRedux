//
//  ContentView.swift
//  AnimalRedux
//
//  Created by Кирилл Тила on 22.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        VStack {
            Text(store.state.animal.currentAnimal)
                .font(.system(.largeTitle))
                .padding()
            Button("Tap Me") {
                store.dispatch(AnimalAction.getAnimal)
            }
        }
        .onAppear {
            store.dispatch(AnimalAction.fetchAnimal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let store: AppStore = .init(state: AppState(),
                                rootReducer: RootReducer())
    static var previews: some View {
        
        ContentView()
            .environmentObject(store)
    }
}
