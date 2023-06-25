//
//  String +.swift
//  every-time-iOS
//
//  Created by 김민 on 2023/06/18.
//

import Foundation

extension String {

    func convertTimeStampToDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss" // 2020-08-13 16:30

        let convertDate = dateFormatter.date(from: self)

        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yy/MM/dd"
        myDateFormatter.locale = Locale(identifier:"ko_KR")

        let convertStr = myDateFormatter.string(from: convertDate!)
        return convertStr
    }
}
