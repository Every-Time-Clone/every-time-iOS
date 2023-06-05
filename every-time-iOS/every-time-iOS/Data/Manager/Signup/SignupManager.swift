//
//  SignupManager.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/06/05.
//

import Foundation
import Alamofire

class SignupManager {

    func reqeust(parameter: SignupReqeust, onCompletion: @escaping (SignupResponse) -> Void) {
        let url = Constant.base_URL + "/register"

        AF.request(url, method: .post, parameters: parameter, encoder: JSONParameterEncoder())
            .validate()
            .responseDecodable(of: SignupResponse.self) { response in
                switch response.result {
                case .success(let data):
                    onCompletion(data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
