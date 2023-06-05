//
//  Environment.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/05/25.
//

import Foundation

struct Environment {
    static let baseURL = (Bundle.main.infoDictionary?["BASE_URL"] as! String).replacingOccurrences(of: " ", with: "")
}
