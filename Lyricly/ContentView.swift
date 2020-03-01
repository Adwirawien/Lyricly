//
//  ContentView.swift
//  Lyricly
//
//  Created by Adrian Böhme on 01.03.20.
//  Copyright © 2020 Hanns Adrian Böhme. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var song: String = ""
    @State var artist: String = ""
    @State var isModalActive: Bool = true

    func change() {
        print("uwu")
    }

    func commit() {
        print("commited!")
    }

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Caption(name: "SONG")
                        .padding(.top, 20)
                        .padding(.bottom, -22.5)
                    TextField("Lone Digger", text: $song)
                        .padding()
                        .padding(.top, 0)
                        .padding(.bottom, 0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(color: colorScheme == .dark ? Color.gray.opacity(0) : Color.gray.opacity(0.2), radius: 10, y: 5)

                    Caption(name: "ARTIST")
                        .padding(.top, -12.5)
                        .padding(.bottom, -50)
                    TextField("Caravan Palace", text: $artist)
                        .padding()
                        .padding(.top, -20)
                        .padding(.bottom, 0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(color: colorScheme == .dark ? Color.gray.opacity(0) : Color.gray.opacity(0.2), radius: 10, y: 5)
                }
                Button(action: { self.isModalActive.toggle() }) {
                    HStack {
                        Spacer()
                        Text("Search Song")
                            .padding(.vertical, 12.5)
                        Spacer()
                    }
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(7.5)
                        .padding(.horizontal)
                        .padding(.top, 10)
                }.sheet(isPresented: $isModalActive, content: {
                    NavigationView {
                        Text("hello world!")
                            .navigationBarTitle(self.song)
                            .navigationBarItems(trailing:
                                    Button(action: { self.isModalActive.toggle() }) {
                                        Text("Close")
                                }
                            )
                    }
                })
                Spacer()
                Image("image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 20)
                Spacer()
            }
                .navigationBarTitle("Lyricly")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
