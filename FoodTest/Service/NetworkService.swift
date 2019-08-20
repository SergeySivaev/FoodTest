//
//  FoodService.swift
//  FoodTest
//
//  Created by macbook on 13/08/2019.
//  Copyright © 2019 macbook. All rights reserved.

// 22336689eb1680d8d53c568345147e4b
// 406db0d85b05ace220ef88351775b38b

import Foundation
import Alamofire

class NetworkService {
    let url = "https://www.food2fork.com"
    let key = "22336689eb1680d8d53c568345147e4b"
    
    public func search(completion: @escaping (_ foodList: FoodList?) -> Void) {
        
        let path = "/api/search"
        let params: Parameters = [
            "key": key
        ]
        
        Alamofire.request(url + path, method: .get, parameters: params).responseJSON { response in
            if response.result.isSuccess {
                guard let data = response.data else {return}
                do{
                    //let json = String(data: data, encoding: .utf8)
                    //print(json)
                    let myResponse = try JSONDecoder().decode(FoodList.self, from: data)
                    
                    completion(myResponse)
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                print("response is Fail")
            }
        }
    }
}
