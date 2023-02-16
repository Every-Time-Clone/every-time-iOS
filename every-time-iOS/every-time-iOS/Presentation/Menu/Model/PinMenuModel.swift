//
//  PinMenuModel.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/15.
//

struct PinMenuModel {
    let isPinned: Bool
    let menuName: String
    let isUpdated: Bool
    
    static func dummyData() -> [PinMenuModel] {
        return [PinMenuModel(isPinned: true, menuName: "자유게시판", isUpdated: false),
                PinMenuModel(isPinned: true, menuName: "비밀게시판", isUpdated: true),
                PinMenuModel(isPinned: true, menuName: "졸업생게시판", isUpdated: true),
                PinMenuModel(isPinned: true, menuName: "새내기게시판", isUpdated: true),
                PinMenuModel(isPinned: true, menuName: "시사·이슈", isUpdated: true),
                PinMenuModel(isPinned: false, menuName: "장터게시판", isUpdated: true),
                PinMenuModel(isPinned: false, menuName: "정보게시판", isUpdated: true),
        ]
    }
}
