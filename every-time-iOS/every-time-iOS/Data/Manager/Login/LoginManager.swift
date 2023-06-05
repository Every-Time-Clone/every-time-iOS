//
//  LoginManager.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/06/05.
//

import UIKit
import Alamofire

class LoginManager {

    func request(parameters: LoginRequest, onCompletion: @escaping (Bool) -> Void) {
        let url = Constant.base_URL + "/login"

        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate().responseDecodable(of: LoginResponse.self) { response in
                switch response.result {
                case .success(_):
                    onCompletion(true)
                case .failure(let error):
                    print(error.localizedDescription)
                    onCompletion(false)
                }
            }
    }
}
