//
//  Meeting.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/20.
//

import Foundation

struct Meeting {
    var name: String
    //var numberOfpeople: Int
    var maximumNumber: Int
    //var isLocked: Bool
    var password: String
    var description: String
    
    init(_ item: MeetingItem) {
        name = item.name
        //numberOfpeople = item.memberCount
        maximumNumber = item.limit
        password = item.password
        description = item.descript
    }
}
