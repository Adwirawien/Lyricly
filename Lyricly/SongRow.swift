//
//  SongRow.swift
//  Lyricly
//
//  Created by Adrian Böhme on 04.03.20.
//  Copyright © 2020 Hanns Adrian Böhme. All rights reserved.
//

import SwiftUI
import Alamofire
import CodableAlamofire

struct SongRow: View {
    var song: SearchResult
    @State var show = false
    @State var loading = false

    @State var lyrics: Lyrics = Lyrics(lyrics: "", error: nil)

    func getLyrics(artist: String, song: String) {
        loading = true
        let parsedArtistName = artist.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let parsedSongName = song.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        Alamofire.request("https://api.lyrics.ovh/v1/\(parsedArtistName!)/\(parsedSongName!)")
            .responseDecodableObject(decoder: JSONDecoder()) { (response: DataResponse<Lyrics>) in
                if (response.error != nil) {
                    print(response.error!)
                    return
                }
                self.lyrics = response.value!
                self.loading = false
        }
    }

    var body: some View {
        Button(action: {
            self.show.toggle()
            self.getLyrics(artist: self.song.artist.name, song: self.song.title)
        }) {
            VStack {
                Text(song.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(song.album.title + " · " + song.artist.name)
                    .font(.system(size: 12, weight: .semibold, design: .rounded))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.sheet(isPresented: $show, content: {
            NavigationView {
                VStack {
                        Text(self.song.album.title + " · " + self.song.artist.name)
                            .font(.system(size: 15, weight: .semibold, design: .rounded))
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    if self.loading {
                        Spacer()
                        Text("loading...")
                        Spacer()
                    } else {
                        ScrollView {
                            HStack {
                                Text(self.lyrics.error == nil ? self.lyrics.lyrics! : self.lyrics.error!)
                                Spacer()
                            }
                        }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                    }
                }
                    .navigationBarTitle(self.song.title)
            }
        })
    }
}
