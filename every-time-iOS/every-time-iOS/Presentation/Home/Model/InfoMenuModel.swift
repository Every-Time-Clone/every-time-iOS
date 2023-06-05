//
//  InfoMenuModel.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/04/19.
//

import Foundation

struct InfoMenuModel {
    var menuName: String
    var description: String?
    
    static func dummyData() -> [[InfoMenuModel]] {
        return [
            [InfoMenuModel(menuName: "학교 인증"),
             InfoMenuModel(menuName: "비밀번호 변경"),
             InfoMenuModel(menuName: "이메일 변경")],
            [InfoMenuModel(menuName: "닉네임 설정"),
             InfoMenuModel(menuName: "프로필 이미지 변경"),
             InfoMenuModel(menuName: "이용 제한 내역"),
             InfoMenuModel(menuName: "쪽지 설정"),
             InfoMenuModel(menuName: "커뮤니티 이용 규칙")],
            [InfoMenuModel(menuName: "다크모드", description: "시스템 기본값"),
             InfoMenuModel(menuName: "알림설정"),
             InfoMenuModel(menuName: "암호 잠금"),
             InfoMenuModel(menuName: "캐시 삭제")],
            [InfoMenuModel(menuName: "앱 버전", description: "6.311"),
             InfoMenuModel(menuName: "문의하기"),
             InfoMenuModel(menuName: "공지사항"),
             InfoMenuModel(menuName: "서비스 이용약관"),
             InfoMenuModel(menuName: "개인정보 처리방침"),
             InfoMenuModel(menuName: "청소년 보호정책"),
             InfoMenuModel(menuName: "오픈소스 라이선스")],
            [InfoMenuModel(menuName: "정보 동의 설정"),
             InfoMenuModel(menuName: "회원 탈퇴"),
             InfoMenuModel(menuName: "로그아웃")],
        ]
    }
}
