import Foundation

// 전체 응답을 나타내는 구조체
struct ResponseData: Codable {
    var page: Int
    var perPage: Int
    var totalCount: Int
    var currentCount: Int
    var matchCount: Int
    var data: [CenterData]
}

// 'data' 배열 내의 개별 센터 데이터를 나타내는 구조체
struct CenterData: Codable {
    var id: Int
    var centerName: String
    var sido: String
    var sigungu: String
    var facilityName: String
    var zipCode: String
    var address: String
    var lat: String
    var lng: String
    var createdAt: String
    var updatedAt: String
    var centerType: String
    var org: String
    var phoneNumber: String
}
