//
//  UserPostsManager.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/07/08.
//

import Foundation

import Alamofire

class UserPostsManager {

    func request(_ uuid: String, onCompletion: @escaping (UserPostsResponse) -> Void) {
        let url = Constant.base_URL + "/users/\(uuid)/posts"

        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: UserPostsResponse.self) { response in
                switch response.result {
                case .success(let data):
                    onCompletion(data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
