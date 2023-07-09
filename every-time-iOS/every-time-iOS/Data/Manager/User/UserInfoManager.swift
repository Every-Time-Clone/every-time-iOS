//
//  UserInfoManager.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/07/09.
//

import Foundation

import Alamofire

class UserInfoManager {

    func request(_ uuid: String, onCompletion: @escaping (UserInfoResponse) -> Void) {
        let url = Constant.base_URL + "/users/\(uuid)"
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: UserInfoResponse.self) { response in
                switch response.result {
                case .success(let data):
                    onCompletion(data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
