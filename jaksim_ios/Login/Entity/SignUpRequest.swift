//
//  SignUpInput.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/03/20.
//

struct SignUpRequest: Encodable {
    var authType: String
    var nickName: String
    var token: String
}
