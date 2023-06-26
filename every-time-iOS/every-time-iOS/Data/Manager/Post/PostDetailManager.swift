//
//  PostDetailManager.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/06/27.
//

import Foundation

import Alamofire

class PostDetailManager {

    func request(_ uuid: String, onCompletion: @escaping (PostResponse) -> Void) {
        let url = Constant.base_URL + "/posts/\(uuid)"

        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: PostResponse.self) { response in
                switch response.result {
                case .success(let data):
                    onCompletion(data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
