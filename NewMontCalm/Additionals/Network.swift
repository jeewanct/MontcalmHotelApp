//
//  Network.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation


class ApiService: NSObject {


    static let shared = ApiService()

    func postMethod(url: String, bodyParameter: [String : String], completion: @escaping (Data) -> Void){

        guard let httpBody = getData(changeToData: bodyParameter), let getUrl = URL(string: url) else {
            return
        }

        var request = URLRequest(url: getUrl, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 20)
        request.httpMethod = "POST"
        request.httpBody = httpBody

        URLSession.shared.dataTask(with: request) { (data, resonse, error) in

                guard let responseData = data else {
                    return
                }

                completion(responseData)



            }.resume()


    }

    func getData(changeToData: [String: String]) -> Data? {

        do{
            return try JSONEncoder().encode(changeToData.self)
        }catch let error {
            print(error)
        }
        return nil
    }

}

