//
//  AlbumDetailView.swift
//  AlbumsSample
//
//  Created by 홍길동 on 2022/07/15.
//

import SwiftUI

struct AlbumDetailView: View {
    let album:Album
    var body: some View {
        List {
            Image(systemName: "music.note.list")
                .resizable()
                .frame(width: 200, height: 200)

            
            HStack {
                Text("album.albumTitle")
                Text(album.albumTitle)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            HStack{
                Text("Artist name")
                Text(album.artistName)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            ForEach(0 ..< 5 ) {index in
                Text("song : \(album.albumTitle)" )
            }
        }
        .navigationTitle(album.albumTitle)
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(album: Album (
            albumTitle: "Title", artistName: "Artist", image: "???"))
    }
}
