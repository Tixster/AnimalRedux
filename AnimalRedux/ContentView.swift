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
        
        let shouldDisplayError =  Binding<Bool>(
            get: { store.state.animal.fetchError != nil },
            set: { _ in store.dispatch(AnimalAction.fetchError(error: nil)) }
        )
        
        VStack {
            if store.state.animal.fetchInProgress {
                ProgressView("Fetching Animal…")
            } else {
                Text(store.state.animal.current)
                    .font(.system(.largeTitle))
                    .padding()
                Button("Tap Me") {
                    store.dispatch(AnimalAction.getAnimal)
                }
            }

        }
        .alert(isPresented: shouldDisplayError) {
            Alert(title: Text("An error has Ocurred"),
                  message: Text(store.state.animal.fetchError ?? ""),
                  dismissButton: .default(Text("Got it!")))
        }
        .onAppear {
            store.dispatch(AnimalAction.getAnimal)
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
