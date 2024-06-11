//
//  Model.swift
//  Chapter9-1
//
//  Created by 문창재 on 6/11/24.
//

import Foundation


struct ResponseData: Codable {
    let page: Int
    let perPage: Int
    let totalCount: Int
    let currentCount: Int
    let matchCount: Int
    let data: [CenterData]
}

struct CenterData: Codable {
    let id: Int
    let centerName: String
    let sido: String
    let sigungu: String
    let facilityName: String
    let zipCode: String
    let address: String
    let lat: String
    let lng: String
    let createdAt: String
    let updatedAt: String
    let centerType: String
    let org: String
    let phoneNumber: String
}
