//
//  SaveUserDataOnRegister.swift
//  NewMontCalm
//
//  Created by Jeevan chandra on 13/12/17.
//  Copyright © 2017 Jeevan chandra. All rights reserved.
//

import Foundation


class SaveUserDataOnRegister{

    static let shared = SaveUserDataOnRegister()

    func saveDataToPList(userModel: RegisterUserInformationModel?){

        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml

        do {
            let data = try encoder.encode(userModel)
            try data.write(to: URL(fileURLWithPath: dataFilePath()))

        } catch {
            // Handle error
            print(error)
        }


    }

    func getUserDataFromPlist(completion: @escaping(RegisterUserInformationModel) -> Void, error: @escaping(String) -> Void ){

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: dataFilePath()))
            let decoder = PropertyListDecoder()
            let settings = try decoder.decode(RegisterUserInformationModel.self, from: data)
            completion(settings)
        } catch {
            // Handle error
            print(error)
        }
    }

    func documentsDirectory()->String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                        .userDomainMask, true)
        let documentsDirectory = paths.first!
        return documentsDirectory
    }

    func dataFilePath ()->String{
        return self.documentsDirectory().appendingFormat("/userList.plist")
    }

}


