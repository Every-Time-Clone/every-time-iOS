//
//  CommentModel.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/02/02.
//

import Foundation

struct CommentModel {
    let name: String
    let content: String
    let time: String
    let isComment: Bool //댓글일 때: isComment = true, 대댓글일 때: isComment = false
    
    static func dummyData() -> [CommentModel] {
        return [CommentModel(name: "익명1", content: "너가 단톡에 올려봐!", time: "02/02 11:41", isComment: true),
                CommentModel(name: "익명(글쓴이)", content: "쥐죽은 듯 조용해서 하고 싶어하는지 어떤지 잘 모르겠어 ㅠ 쥐죽은 듯 조용해서 하고 싶어하는지 어떤지 잘 모르겠어 ㅠ 쥐죽은 듯 조용해서 하고 싶어하는지 어떤지 잘 모르겠어 ㅠ", time: "02/02 11:50", isComment: false),
                CommentModel(name: "익명3", content: "완전 하고 싶어요... 완전", time: "02/02 12:02", isComment: false),
                CommentModel(name: "익명6", content: "저도 법학과... 정모 넘 하고 싶어요 ㅠ", time: "02/02 12:02", isComment: false),
                CommentModel(name: "익명3", content: "법학과 신입생인데... 정모글 올려주시면 바~로바~로바~로바~로바~로", time: "02/02 11:54", isComment: true),
                CommentModel(name: "익명5", content: "망포동 사는 법대 화석 지나갑니다... 망포동 사는 법대 화석 지나갑니다... 망포동 사는 법대 화석 지나갑니다... 망포동 사는 법대 화석 지나갑니다... 망포동 사는 법대 화석 지나갑니다...망포동 사는 법대 화석 지나갑니다...망포동 사는 법대 화석 지나갑니다...망포동 사는 법대 화석 지나갑니다...망포동 사는 법대 화석 지나갑니다...망포동 사는 법대 화석 지나갑니다...", time: "02/02 11:55", isComment: true)
        ]
    }
}
