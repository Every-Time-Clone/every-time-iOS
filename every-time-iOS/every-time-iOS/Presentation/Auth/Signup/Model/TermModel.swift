//
//  TermModel.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/03/15.
//

import Foundation

struct TermModel {
    var isOpened: Bool
    var termTitle: String
    
    static func termDummyData() -> [TermModel] {
        return [TermModel(isOpened: true, termTitle: "서비스 이용 약관 동의(필수)"),
                TermModel(isOpened: true, termTitle: "개인정보 수집 및 이용 동의(필수)"),
                TermModel(isOpened: true, termTitle: "커뮤니티 이용 규칙 확인(필수)")]
    }
}
