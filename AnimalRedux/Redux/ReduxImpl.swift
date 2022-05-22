//
//  ReduxImpl.swift
//  AnimalRedux
//
//  Created by Кирилл Тила on 22.05.2022.
//

import Foundation

protocol ReduxState {}
protocol ReduxAction {}

protocol ReduxStore: ObservableObject {
    associatedtype State: ReduxState
    var state: State { get }
    func dispatch(_ action: ReduxAction)
}

protocol ReduxReducer {
    associatedtype State: ReduxState
    func reduce(_ state: inout State, _ action: ReduxAction)
}
