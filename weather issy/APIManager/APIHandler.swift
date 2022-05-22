//
//  APIHandler.swift
//  weather issy
//
//  Created by Issy Mayor on 22/5/2022.
//

import RxSwift

class APIHandler {
    private let apiManager: APIManager
    
    init(_ apiManager: APIManager) {
        self.apiManager = apiManager
    }
}
