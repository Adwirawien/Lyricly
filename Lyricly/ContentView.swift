//
//  ContentView.swift
//  Lyricly
//
//  Created by Adrian Böhme on 01.03.20.
//  Copyright © 2020 Hanns Adrian Böhme. All rights reserved.
//

import SwiftUI
import Alamofire
import CodableAlamofire

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var song: String = ""
    @State var loading: Bool = false

    @State var results: [SearchResult] = []

    func change() {
        print(song)
        if (song.count > 0) {
            getSongs(search: song)
        } else {
            results = []
        }
    }

    func getSongs(search: String) {
        loading = true
        let query = search.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        Alamofire.request("https://api.lyrics.ovh/suggest/\(query!)")
            .responseDecodableObject(keyPath: "data", decoder: JSONDecoder()) { (response: DataResponse<[SearchResult]>) in
                if (response.error != nil) {
                    print(response.error!)
                    return
                }
                self.results = response.value!
                self.loading = false
        }
    }

    var body: some View {
        NavigationView {
            List {
                TextField("Search for a song", text: $song, onEditingChanged: { _ in self.change() })
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                VStack {
                    Image("image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, CGFloat(20))
                    Text("🎙 Find the right lyrics")
                        .font(.system(size: 15, weight: .regular, design: .rounded))
                        .foregroundColor(Color.gray.opacity(0.8))
                        .padding(.top, -20)
                    Spacer()
                }
                    .padding(.bottom, 25)

                ForEach(results) { result in
                    SongRow(song: result)
                }
            }
                .navigationBarItems(trailing:
                    Text(loading ? "Loading..." : "").foregroundColor(.gray)
                )
                .navigationBarTitle("Lyricly")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
