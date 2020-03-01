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
        print(song)
    }

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Caption(name: "SONG")
                        .padding(.top, CGFloat(20))
                        .padding(.bottom, CGFloat(-22.5))
                    TextField("Lone Digger", text: Binding(
                        get: {
                            self.song
                        },
                        set: { (newValue) in
                            self.song = newValue
                            self.change()
                        }
                        ))
                        .padding()
                        .padding(.top, CGFloat(0))
                        .padding(.bottom, CGFloat(0))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(color: colorScheme == .dark ? Color.gray.opacity(0.0) : Color.gray.opacity(0.2), radius: CGFloat(10), y: CGFloat(5))
                }
                Spacer()
                VStack {
                    Image("image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, CGFloat(20))
                    Text("🎙 Find the right lyrics")
                        .font(.system(size: 15, weight: .regular, design: .rounded))
                        .foregroundColor(Color.gray.opacity(0.8))
                        .padding(.top, -20)
                }
                .padding(.bottom, 80)
                Spacer()
            }
                .navigationBarTitle(song != "" ? song : "Lyricly")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
