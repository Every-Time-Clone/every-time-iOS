//
//  PostModel.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/01/31.
//

import Foundation

struct PostModel {
    let title: String
    let content: String
    let time: String
    let name: String
    let likeNumber: String
    let commentNumber: String
    
    static func dummyData() -> [PostModel] {
        return [PostModel(title: "자취 새내기", content: "쿠팡 집으로 시켰다;; 당장 샴푸도 없네ㅋㅋㅋㅋ", time: "15분 전", name: "익명", likeNumber: "0", commentNumber: "0"),
                PostModel(title: "재수강 하려는데", content: "과목이 p/f로 바꼈음 어떡해 ,,?", time: "15분 전", name: "", likeNumber: "0", commentNumber: "0"),
                PostModel(title: "대학 바뀌면", content: "에타 대학도 다시 등록하고 바뀌는거겠죠? 중복으로는 볼 수 없고?", time: "15분 전", name: "익명", likeNumber: "0", commentNumber: "0"),
                PostModel(title: "뭐하고", content: "방학 때 뭐하고 지내나요?", time: "15분 전", name: "익명", likeNumber: "0", commentNumber: "0"),
                PostModel(title: "영어학입문", content: "영어학입문 이번 여름 계절학기에 들으실분 계신가요..?ㅠㅠ", time: "15분 전", name: "익명", likeNumber: "0", commentNumber: "0"),
                PostModel(title: "공항에서 탑승수속", content: "출국 3시간 전부터 가능한가여?\n셀프체크인은 24시간 전부터 가능한걸로 알고 있는데 셀프수하물이나 탑승수속은 3시간 전부터만 가능한가요? 더 빨리 할 수는 없겠죠…?", time: "15분 전", name: "익명", likeNumber: "0", commentNumber: "0"),
                PostModel(title: "뭐하고", content: "방학 때 뭐하고 지내나요?", time: "15분 전", name: "익명", likeNumber: "0", commentNumber: "0"),
                PostModel(title: "뭐하고", content: "방학 때 뭐하고 지내나요?", time: "15분 전", name: "익명", likeNumber: "0", commentNumber: "0")
        ]
    }
}
