//
//  ViewControllersHTTPRequest.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 02/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation



class ViewControllersHTTPRequest: NSObject{

    // Get currency list

    func getCurrencyList(completion: @escaping([GetCurrency]) -> Void, errorIn: @escaping(String) -> Void) {

        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETCURRENCY

        ApiService.shared.postHttpRequest(url: url, completion: { (data) in

            do{
                let receivedCurrency = try JSONDecoder().decode(CurrencyModel.self, from: data)
              //  print(receivedCurrency.currency)

                if let currencyArray = receivedCurrency.currency{
                    completion(currencyArray)
                }

            }catch let jsonError{
                errorIn("Something Went Wrong")
                errorIn(jsonError.localizedDescription)
            }

        }) { (error) in
            errorIn("Something Went Wrong")
        }


    }


    // Get country list

    func getCountryList(completion: @escaping([GetCountry]) -> Void, errorIn: @escaping(String) -> Void) {

        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETCOUNTRYLIST

        ApiService.shared.postHttpRequest(url: url, completion: { (data) in

            do{
                let receivedCountry = try JSONDecoder().decode(CountryModel.self, from: data)
                //  print(receivedCurrency.currency)

                if let countryArray = receivedCountry.country{
                    completion(countryArray)
                }

            }catch let jsonError{
                errorIn("Something Went Wrong")
                errorIn(jsonError.localizedDescription)
            }

        }) { (error) in
            errorIn("Something Went Wrong")
        }



    }



    //MARK: Get temperature with lat & long
    func getTemperature(completion: @escaping (Error) -> Void, errorIn: @escaping(Error) -> Void){
        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETTEMPERATURE
    }

    //MARK: Home & Contact Screen Data

    func getHomeContactDetails(completion: @escaping(HomeContactModel) -> Void, errorIn: @escaping(String) -> Void){
        
        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETHOMECONTACT
       
        ApiService.shared.postHttpRequest(url: url, completion: { (data) in
            
            do{
                let receivedData = try JSONDecoder().decode(HomeContactModel.self, from: data)
                print("The hotel Details ", receivedData)
                completion(receivedData)
            }catch let jsonError{
                errorIn("Something Went Wrong")
                print(jsonError)
            }
            
            
        }) { (error) in
            
            errorIn("Something Went Wrong")
        }
        
        
    }


    //MARK: Get hotel offers

    func getHotelOffers(completion: @escaping(OffersTabBarModel) -> Void, errorIn: @escaping(String) -> Void){
        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETOFFERS

        ApiService.shared.postHttpRequest(url: url, completion: { (data) in

            do{
                let receivedData = try JSONDecoder().decode(OffersTabBarModel.self, from: data)
                print("The hotel Details ", receivedData)
                completion(receivedData)
            }catch let jsonError{
                errorIn("Something Went Wrong")
                print(jsonError)
            }
        }) { (error) in
            errorIn("Something Went Wrong")
        }

    }

    //MARK: Get Explore Wellness

    func getOffersWellness(completion: @escaping(WellnessModel) -> Void, errorIn: @escaping(String) -> Void){
        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETWELLNESS

        ApiService.shared.postHttpRequest(url: url, completion: { (data) in

            do{
                let receivedData = try JSONDecoder().decode(WellnessModel.self, from: data)
                print("The hotel Details ", receivedData)
                completion(receivedData)
            }catch let jsonError{
                errorIn("Something Went Wrong")
                print(jsonError)
            }
        }) { (error) in
            errorIn("Something Went Wrong")
        }

    }

    
    //MARK: Get Explore Packages
    
    func getOffersPackages(completion: @escaping(PackagesModel) -> Void, errorIn: @escaping(String) -> Void){
        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETPACKAGES
        
        ApiService.shared.postHttpRequest(url: url, completion: { (data) in
            
            do{
                let receivedData = try JSONDecoder().decode(PackagesModel.self, from: data)
                print("The hotel Details ", receivedData)
                completion(receivedData)
            }catch let jsonError{
                errorIn("Something Went Wrong")
                print(jsonError)
            }
        }) { (error) in
            errorIn("Something Went Wrong")
        }
        
    }
    
    
    //MARK: Get Explore Restaurants & Bars

    func getOffersRestaurantAndBars(completion: @escaping(RestaurantsAndBarModel) -> Void, errorIn: @escaping(String) -> Void){
        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETRESTAURANTANDBAR

        ApiService.shared.postHttpRequest(url: url, completion: { (data) in

            do{
                let receivedData = try JSONDecoder().decode(RestaurantsAndBarModel.self, from: data)
                print("The hotel Details ", receivedData)
                completion(receivedData)
            }catch let jsonError{
                errorIn("Something Went Wrong")
                print(jsonError)
            }
        }) { (error) in
            errorIn("Something Went Wrong")
        }

    }
    
    //MARK: Get Explore Meetings
    
    func getExploreMeetings(completion: @escaping(MeetingAndEventsModel) -> Void, errorIn: @escaping(String) -> Void){
        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETMEETINGANDEVENTS
        
        ApiService.shared.postHttpRequest(url: url, completion: { (data) in
            
            do{
                let receivedData = try JSONDecoder().decode(MeetingAndEventsModel.self, from: data)
                print("The hotel Details ", receivedData)
                completion(receivedData)
            }catch let jsonError{
                print(jsonError)
                errorIn("Something Went Wrong")
            }
        }) { (error) in
            errorIn("Something Went Wrong")
        }
        
    }


    //MARK: GET HOTEL FACILITIES LIST - Metting and events


    func getMettingAndEventsParticularHotel(hotelId: [String: String], completion: @escaping(MeetingAndEventsModel) -> Void, errorIn: @escaping(String) -> Void){

        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETMEETINGANDEVENTS


        ApiService.shared.postHttpRequestWithBody(url: url, bodyParameter: hotelId, completion: { (data) in

            print("The packages for particular hotel",data)

            do{
                let receivedData = try JSONDecoder().decode(MeetingAndEventsModel.self, from: data)
                completion(receivedData)
            }catch let jsonError{
                errorIn("Something Went Wrong")
                print(jsonError.localizedDescription)
            }


        }) { (error) in
            print(error)
        }

    }


    //MARK: GET HOTEL FACILITIES LIST - Offers

    func getOffersParticularHotel(hotelId: [String: String], completion: @escaping(OffersTabBarModel) -> Void, errorIn: @escaping(String) -> Void){

        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETOFFERS

        ApiService.shared.postHttpRequestWithBody(url: url, bodyParameter: hotelId, completion: { (data) in

            print("The packages for particular hotel",data)

            do{
                let receivedData = try JSONDecoder().decode(OffersTabBarModel.self, from: data)
                completion(receivedData)
            }catch let jsonError{
                errorIn("Something Went Wrong")
                print(jsonError.localizedDescription)
            }


        }) { (error) in
            print(error)
        }

    }


    //MARK: GET HOTEL FACILITIES LIST - Offers


    func getRestaurantAndBarsParticularHotel(hotelId: [String: String], completion: @escaping(RestaurantsAndBarModel) -> Void, errorIn: @escaping(String) -> Void){

        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETRESTAURANTANDBAR

        ApiService.shared.postHttpRequestWithBody(url: url, bodyParameter: hotelId, completion: { (data) in

            print("The packages for particular hotel",data)

            do{
                let receivedData = try JSONDecoder().decode(RestaurantsAndBarModel.self, from: data)

                completion(receivedData)
            }catch let jsonError{
                errorIn("Something Went Wrong")
                print("Jeevan error here",jsonError.localizedDescription)
            }


        }) { (error) in
            print("Jeevan error here",error)
        }

    }

    //MARK: GET HOTEL FACILITIES LIST - Packages


    func getPackagesParticularHotel(hotelId: [String: String], completion: @escaping(PackagesModel) -> Void, errorIn: @escaping(String) -> Void){

        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETPACKAGES

        ApiService.shared.postHttpRequestWithBody(url: url, bodyParameter: hotelId, completion: { (data) in

            print("The packages for particular hotel",data)

            do{
                let receivedData = try JSONDecoder().decode(PackagesModel.self, from: data)

                completion(receivedData)
            }catch let jsonError{
                errorIn("Something Went Wrong")
                print("Jeevan error here",jsonError.localizedDescription)
            }


        }) { (error) in
            print("Jeevan error here",error)
        }

    }


    //MARK: GET HOTEL FACILITIES LIST - Gallery Images


    func getParticularHotelDetails(hotelId: [String: String], completion: @escaping(HotelDetailModel) -> Void, errorIn: @escaping(String) -> Void){

        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETSPECIFICHOTELDETAIL

        ApiService.shared.postHttpRequestWithBody(url: url, bodyParameter: hotelId, completion: { (data) in

            print("The IMAGES",data)

            do{
                let receivedData = try JSONDecoder().decode(HotelDetailModel.self, from: data)

                completion(receivedData)
            }catch let jsonError{
                errorIn("Something Went Wrong")
                print("Jeevan error here",jsonError.localizedDescription)
            }


        }) { (error) in
            print("Jeevan error here",error)
        }


    }

    //MARK: GET Room Details


    func getParticularRoomDetails(hotelId: [String: String], completion: @escaping(RoomDetailModel) -> Void, errorIn: @escaping(String) -> Void){

        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETSPECIFICROOMDETAIL

        ApiService.shared.postHttpRequestWithBody(url: url, bodyParameter: hotelId, completion: { (data) in



            do{
                let receivedData = try JSONDecoder().decode(RoomDetailModel.self, from: data)

                completion(receivedData)
            }catch let jsonError{
                errorIn("Something Went Wrong")
                print("Jeevan error here",jsonError.localizedDescription)
            }


        }) { (error) in
            print("Jeevan error here",error)
        }


    }





    //MARK: Register User


    func registerUser(userInfo: [String: String], completion: @escaping(RegisterSuccessfulModel) -> Void, errorIn: @escaping(String) -> Void){

        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETSPECIFICROOMDETAIL

        ApiService.shared.postHttpRequestWithBody(url: url, bodyParameter: userInfo, completion: { (data) in
            do{
                let receivedData = try JSONDecoder().decode(RegisterSuccessfulModel.self, from: data)
                completion(receivedData)
            }catch let jsonError{
                errorIn("Something Went Wrong")
                print("Jeevan error here",jsonError.localizedDescription)
            }


        }) { (error) in
            print("Jeevan error here",error)
        }


    }


    //MARK: Edit Registered User Details


    func editRegisteredUserDetails(userInfo: [String: String], completion: @escaping(RegisterSuccessfulModel) -> Void, errorIn: @escaping(String) -> Void){

        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.UPDATEUSERDETAILS

        ApiService.shared.postHttpRequestWithBody(url: url, bodyParameter: userInfo, completion: { (data) in
            do{
                let receivedData = try JSONDecoder().decode(RegisterSuccessfulModel.self, from: data)
                completion(receivedData)
            }catch let jsonError{
                errorIn("Something Went Wrong")
                print("Jeevan error here",jsonError.localizedDescription)
            }


        }) { (error) in
            print("Jeevan error here",error)
        }


    }

    
    //MARK: Get Available Hotels
    
    
    func getAvailableHotels(userInfo: [String: String], completion: @escaping(AvailableHotelsModel) -> Void, errorIn: @escaping(String) -> Void){
        
        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETAVAILABLEHOTEL
        
        ApiService.shared.postHttpRequestWithBody(url: url, bodyParameter: userInfo, completion: { (data) in
            do{
                let receivedData = try JSONDecoder().decode(AvailableHotelsModel.self, from: data)
                completion(receivedData)
            }catch let jsonError{
                errorIn("Something Went Wrong")
                print("Jeevan error here",jsonError.localizedDescription)
            }
            
            
        }) { (error) in
            print("Jeevan error here",error)
        }
        
        
    }
    


    //MARK: Get RateType Details

    func getAvailableHotelRate(userInfo: [String: String], completion: @escaping(RateTypeModel) -> Void, errorIn: @escaping(String) -> Void){

        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETAVAILABELROOMS

        ApiService.shared.postHttpRequestWithBody(url: url, bodyParameter: userInfo, completion: { (data) in
            do{
                let receivedData = try JSONDecoder().decode(RateTypeModel.self, from: data)
                completion(receivedData)
            }catch let jsonError{
                errorIn("Something Went Wrong")
                print("Jeevan rate type heres",jsonError.localizedDescription)
            }


        }) { (error) in
            errorIn("Something Went Wrong")
            print("Jeevan error here",error)
        }


    }


    //MARK: Login User

    func loginGetDetails(userInfo: [String: String], completion: @escaping(LoginModel) -> Void, errorIn: @escaping(String) -> Void){

        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.LOGINUSER

        ApiService.shared.postHttpRequestWithBody(url: url, bodyParameter: userInfo, completion: { (data) in
            do{
                let receivedData = try JSONDecoder().decode(LoginModel.self, from: data)
                if let errorMessage = receivedData.errorMessage{
                    if errorMessage == ""{
                        completion(receivedData)
                    }else{
                        print("Wrong Credentials")
                        errorIn("Wrong Credentials")
                    }
                }


                
            }catch let jsonError{
                errorIn("Something Went Wrong")
                print("Jeevan LOgin type heres",jsonError.localizedDescription)
            }


        }) { (error) in
            errorIn("Something Went Wrong")
            print("Jeevan Login error here",error)
        }


    }




    //MARK: Get Booking History

    func getBookingHistory(userInfo: [String: String], completion: @escaping(BookingHistoryModel) -> Void, errorIn: @escaping(String) -> Void){

        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETBOOKINGHISTORY

        ApiService.shared.postHttpRequestWithBody(url: url, bodyParameter: userInfo, completion: { (data) in
            do{
                let receivedData = try JSONDecoder().decode(BookingHistoryModel.self, from: data)
                if let errorMessage = receivedData.errorMessage{
                    if errorMessage == ""{
                        completion(receivedData)
                    }else{
                        print("Wrong Credentials")
                        errorIn("Wrong Credentials")
                    }
                }



            }catch let jsonError{
                errorIn("Something Went Wrong")
                print("Jeevan LOgin type heres",jsonError.localizedDescription)
            }


        }) { (error) in
            errorIn("Something Went Wrong")
            print("Jeevan Login error here",error)
        }


    }


    func getHomeContactDetails1(userInfo: [String: String], completion: @escaping(HomeContactModel) -> Void, errorIn: @escaping(String) -> Void){

        let url = Constants.CustomApis.HOMEURL + Constants.CustomApis.GETHOMECONTACT

        ApiService.shared.postHttpRequestWithBody(url: url, bodyParameter: userInfo, completion: { (data) in
            do{
                let receivedData = try JSONDecoder().decode(HomeContactModel.self, from: data)
               // if let errorMessage = receivedData.errorMessage{
                 //   if errorMessage == ""{
                        completion(receivedData)
                  //  }else{
                     //   print("Wrong Credentials")
                      //  errorIn("Wrong Credentials")
                   // }
              //  }



            }catch let jsonError{
                errorIn("Something Went Wrong")
                print("Jeevan LOgin type heres",jsonError.localizedDescription)
            }


        }) { (error) in
            errorIn("Something Went Wrong")
            print("Jeevan Login error here",error)
        }


    }
    
    





}
