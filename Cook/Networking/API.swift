//
//  API.swift
//  Cook
//
//  Created by Tanveer Bashir on 2/10/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


class API {
    func fetchRecipe(onSuccess: @escaping ([Recipe]) -> Void, onFailure: @escaping (Error) -> Void) {
        Alamofire.request(Constant.bsaeUrl, parameters: Constant.params).responseObject { (response: DataResponse<Base>) in
            switch response.result {
            case .success(let result):
                onSuccess(result.recipes)
            case .failure(let error):
                onFailure(error)
            }
        }
    }

    func searchRecipe(for query: String, onSuccess: @escaping ([Recipe]) -> Void, onFailure: @escaping (Error) -> Void) {
        let params = ["key": key, "q": query]
        Alamofire.request(Constant.bsaeUrl, parameters: params).responseObject { (response: DataResponse<Base>) in
            switch response.result {
            case .success(let result):
                onSuccess(result.recipes)
            case .failure(let error):
                onFailure(error)
            }
        }
    }
}
