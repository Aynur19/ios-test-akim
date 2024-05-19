//
//  MediaResponseDto.swift
//  TestWork2
//
//  Created by Aynur Nasybullin on 19.05.2024.
//

import Foundation

struct MediaResponseDto: Hashable {
    let media: [MediaItemResponseDto]
}

extension MediaResponseDto: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.media = try container.decode([MediaItemResponseDto].self, forKey: .media)
    }
    
    private enum CodingKeys: String, CodingKey {
        case media
    }
}

struct MediaItemResponseDto: Hashable {
    let imageUrl: String
    let videoUrl: String
}

extension MediaItemResponseDto: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
        self.videoUrl = try container.decode(String.self, forKey: .videoUrl)
    }
    
    private enum CodingKeys: String, CodingKey {
        case imageUrl = "image"
        case videoUrl = "video"
    }
}
