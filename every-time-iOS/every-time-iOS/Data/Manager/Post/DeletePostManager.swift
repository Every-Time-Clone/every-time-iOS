//
//  DeletePostManager.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/07/02.
//

import Foundation

import Alamofire

class DeletePostManager {

    func request(_ uuid: String, onCompletion: @escaping (Bool) -> Void) {
        let url = Constant.base_URL + "/posts/\(uuid)"
        AF.request(url, method: .delete)
            .validate()
            .responseDecodable(of: DeletePostResponse.self) { response in
                switch response.result {
                case .success(_):
                    onCompletion(true)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
