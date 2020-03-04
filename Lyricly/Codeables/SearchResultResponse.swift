//
//  SearchResultResponse.swift
//  Lyricly
//
//  Created by Adrian Böhme on 04.03.20.
//  Copyright © 2020 Hanns Adrian Böhme. All rights reserved.
//

import Foundation

struct SearchResult: Decodable, Identifiable {
    let id = UUID()
    let title: String
    let artist: Artist
    let album: Album
}

struct Artist: Decodable {
    let name: String
}

struct Album: Decodable {
    let title: String
    let cover: String
}
