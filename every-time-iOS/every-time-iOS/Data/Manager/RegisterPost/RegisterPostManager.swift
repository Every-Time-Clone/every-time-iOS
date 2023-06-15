//
//  RegisterPostManager.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/06/15.
//

import Foundation

import Alamofire

class RegisterPostManager {

    func request(_ parameter: RegisterPostRequest, onCompletion: @escaping (String) -> Void) {
        let url = Constant.base_URL + "/posts"

        AF.request(url, method: .post, parameters: parameter, encoder: JSONParameterEncoder())
            .validate()
            .responseDecodable(of: String.self) { response in
                switch response.result {
                case .success(let data):
                    onCompletion(data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
