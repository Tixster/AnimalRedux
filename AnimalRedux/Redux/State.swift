//
//  State.swift
//  AnimalRedux
//
//  Created by Кирилл Тила on 22.05.2022.
//

import Foundation

struct AppState: ReduxState {
    var animal: AnimalState = .init()
}

struct AnimalState: ReduxState {
    var currentAnimal: String = ""
}
