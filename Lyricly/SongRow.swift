//
//  SongRow.swift
//  Lyricly
//
//  Created by Adrian Böhme on 04.03.20.
//  Copyright © 2020 Hanns Adrian Böhme. All rights reserved.
//

import SwiftUI

struct SongRow: View {
    var song: SearchResult
    @State var show = false

    var body: some View {
        Button(action: { self.show.toggle() }) {
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
                    Spacer()
                    Text("loading...")
                    Spacer()
                }
                    .navigationBarTitle(self.song.title)
            }
        }
        )
    }
}
