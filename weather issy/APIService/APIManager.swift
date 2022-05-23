//
//  APIManager.swift
//  weather issy
//
//  Created by Issy Mayor on 22/5/2022.
//

import RxSwift

protocol APIManagerProtocol {
    func load<T: Decodable>(resource: Resource<T>) -> Observable<T>
}

final class APIManager: APIManagerProtocol {
    func load<T: Decodable>(resource: Resource<T>) -> Observable<T> {
        return URLRequest.load(resource: resource)
    }
}
