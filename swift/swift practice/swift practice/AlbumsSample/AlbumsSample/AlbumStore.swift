//
//  AlbumStore.swift
//  AlbumsSample
//
//  Created by 홍길동 on 2022/07/14.
//

import Foundation
import SwiftUI

struct Album:Codable {
    var albumTitle: String
    var artistName: String
    var image: String
}
struct AlbumData:Codable {
    var albums: [Album]
}

class AlbumStore: ObservableObject {
    static let singleton = AlbumStore()
    @Published var albums = [Album]()
    func load() {
        guard let url = Bundle.main.url(forResource: "res/albums.json", withExtension: "")
        else {
            return
        }
        print("URL : \(url)")
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        print("Data : \(data)")
        let decoder = JSONDecoder()
        guard let albumData = try? decoder.decode(AlbumData.self, from: data) else {
            return
        }
        self.albums = albumData.albums
        print("Loaded albums: \(albums.count)")
    }
}
