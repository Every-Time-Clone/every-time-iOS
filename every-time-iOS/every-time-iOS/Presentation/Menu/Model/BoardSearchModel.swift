//
//  BoardSearchModel.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/22.
//

struct BoardSearchModel {
    let boardName: String
    let boardDetail: String?
    let isUpdated: Bool
    
    static func dummyData() -> [BoardSearchModel] {
        return [BoardSearchModel(boardName: "홍보대사 동감", boardDetail: "안녕하세요. 같은 느낌 같은 생각, 동국의 느낌 동국인의 생각을 전하는 동국대학교 홍보대사 '동감'입니다.", isUpdated: false),
                BoardSearchModel(boardName: "돈진사", boardDetail: "돈가스를 좋아하는 사람들의 모임", isUpdated: false),
                BoardSearchModel(boardName: "CTA 세무사 시험 게시판", boardDetail: nil, isUpdated: true),
                BoardSearchModel(boardName: "남산학사게시판", boardDetail: "긱사러는 지각 안 해 ㅋ", isUpdated: true)
        ]
    }
}
