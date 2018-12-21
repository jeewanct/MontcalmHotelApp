//
//  Network.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 01/08/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation
import Alamofire
import UIKit


class ApiService: NSObject {


    //MARK: Single instance of Class
    static let shared = ApiService()

    //MARK: GET REQUEST

    func getHttpRequest(url: String, completion: @escaping(Data) -> Void, error: @escaping(Error) -> Void){

        Alamofire.request(url).response { response in // method defaults to `.get`
            
            // Data
            if let dataJSON = response.data{
                completion(dataJSON)
            }

            // Error encoutered

            if let errorJSONData = response.error{
                error(errorJSONData)
            }



        }
    }


    //MARK: Post Method without Parameters


    func postHttpRequest(url: String, completion: @escaping (Data) -> Void, error: @escaping(Data) -> Void){

        Alamofire.request(url, method: .post , parameters: [:], encoding: JSONEncoding.default)





            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)


                
                if response.statusCode == 200{

                    if let JSONData = data{
                        completion(JSONData)
                    }

                }else{

                    if let ErrorData = data{
                        error(ErrorData)
                    }
                }



                return .success



            }





        }


//    func postHttpRequest2(url: String, completion: @escaping (Data) -> Void, error: @escaping(Data) -> Void){
//
//        Alamofire.request(url, method: .post, parameters: [:],encoding: JSONEncoding.default, headers: nil).responseJSON {
//            response in
//            switch response.result {
//            case .success:
//
//
//                print("the restaurant data is", response.data)
//                if let receivedData = response.data{
//                    completion(receivedData)
//                }
//
//
//                break
//            case .failure(let error1):
//                 error("")
//                print("jeevan tiwari ",error)
//            }
//        }
//
//
//    }




    //MARK: Post Method with Parameters





    func postHttpRequestWithBody(url: String, bodyParameter: [String : String], completion: @escaping (Data) -> Void, error: @escaping(String) -> Void){



        Alamofire.request(url, method: .post, parameters: bodyParameter,encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:


                print("the restaurant data is", response.data)
                if let receivedData = response.data{
                     completion(receivedData)
                }


                break
            case .failure(let error1):

                error("")
                print("jeevan tiwari ",error)
            }
        }
        


    }




}

