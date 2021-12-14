//  ApiResourceFile.swift
//  DemoPractice
//  Created by Siddhesh Kotavdekar on 12/11/21.
//  Copyright © 2021 Siddhesh Kotavdekar. All rights reserved.


import Foundation
import UIKit

protocol ApiResource{
    func getRespons<T>(ent:T)
}

class getData:NSObject{
    
    var dele:ApiResource?
    
    func getUserResponse <T:Decodable>(method: HttpMethods,strParameterName:[String:Any],endpoint:EndPoint,Object:T.Type){
        
        var urlRequest = URLRequest(url: URL(string: endpoint.rawValue)!)
        
        urlRequest.allHTTPHeaderFields = DPConstant.shared.headerforapi
        
        urlRequest.httpMethod = method.rawValue
        do{
            if let postData = try? JSONSerialization.data(withJSONObject: strParameterName, options:[]) as? Data{ urlRequest.httpBody = postData }
            
        }catch{print(error) }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (datavalue, response, error) in
            guard let data = datavalue else {return}
            do{
               //if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] {}
                guard let ent = try? JSONDecoder().decode(Object, from: data)else{return}
                self.dele?.getRespons(ent: ent)
            }catch{ print(error.localizedDescription)}
        }
      task.resume()
    }
}

