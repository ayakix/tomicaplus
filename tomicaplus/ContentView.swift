//
//  ContentView.swift
//  tomicaplus
//
//  Created by Ryota Ayaki on 2020/05/12.
//  Copyright © 2020 Ryota Ayaki. All rights reserved.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @ObservedObject var nfcReader = NFCReader()
    
    var body: some View {
        VStack(spacing: 50) {
            Image("sample")
                .resizable()
                .scaledToFit()
                .opacity(0.1)
                .padding(.top, -120)
            Image(nfcReader.vehicle?.rawValue ?? "")
                .resizable()
                .scaledToFit()
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true))
                .padding(.top, -120)
            Spacer()
            Button(action: {
                self.nfcReader.startSession()
//                self.vehicle = Vehicle.getRandomCase()
            }) {
                Text("もう一回")
            }
        }
        .onAppear(perform: {
            self.nfcReader.startSession()
        })
        .onDisappear(perform: {
            self.nfcReader.stopSession()
        })
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            self.nfcReader.startSession()
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
