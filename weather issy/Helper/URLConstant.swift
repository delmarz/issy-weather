//
//  URLConstant.swift
//  weather issy
//
//  Created by Issy Mayor on 22/5/2022.
//

import Foundation

struct APPURL {
    private struct Domains {
        static let Production = "https://testapi.io"
    }
    private struct Routes {
        static let API = "/api/olestang/"
    }
    private static let Domain = Domains.Production
    private static let Route = Routes.API
    private static let BaseURL = Domain + Route
    
    static var weatherList: URL? {
        return URL(string: BaseURL + "weather/list")
    }
    
    static var weatherDetail: URL? {
        return URL(string: BaseURL + "weather/")
    }
    
    static func weatherDetail(byId: Int) -> URL? {
        return URL(string: BaseURL + "weather/\(byId)")
    }
    
    static func iconURL(_ icon: String) -> URL? {
        return URL(string: "http://openweathermap.org/img/wn/\(icon)@2x.png")
    }
}
