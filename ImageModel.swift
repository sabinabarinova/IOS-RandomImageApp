

import Foundation

struct ImageModel: Codable {
    let id: String
    let urls: URLS
}

struct URLS: Codable {
    let small: String
}
