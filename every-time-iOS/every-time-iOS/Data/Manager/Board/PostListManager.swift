//
//  PostListManager.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/06/13.
//

import Foundation
import Alamofire

class PostListManager {

    func request(onCompletion: @escaping (Posts) -> Void) {
        let url = Constant.base_URL + "/posts/all"

        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: Posts.self) { response in
                switch response.result {
                case .success(let data):
                    onCompletion(data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
