//
//  APIError.swift
//  weather issy
//
//  Created by Issy Mayor on 22/5/2022.
//

import Foundation

enum APIError: Error {
    case urlNotFound
    case timeout
    case unknown
}
