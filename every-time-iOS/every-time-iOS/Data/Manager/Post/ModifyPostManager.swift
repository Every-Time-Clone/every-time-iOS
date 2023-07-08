//
//  ModifyPostManager.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/06/18.
//

import Foundation

import Alamofire

class ModifyPostManager {

    func patchPost(_ parameters: PostRequest, _ uuid: String, onCompletion: @escaping (PostsResponse) -> Void) {
        let url = Constant.base_URL + "/posts/\(uuid)"

        AF.request(url, method: .patch, parameters: parameters, encoder: JSONParameterEncoder())
            .validate()
            .responseDecodable(of: PostsResponse.self) { response in
                switch response.result {
                case .success(let data):
                    onCompletion(data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
