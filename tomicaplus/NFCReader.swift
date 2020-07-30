//
//  NFCReader.swift
//  tomicaplus
//
//  Created by Ryota Ayaki on 2020/05/12.
//  Copyright © 2020 Ryota Ayaki. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import CoreNFC

class NFCReader: NSObject, ObservableObject, NFCNDEFReaderSessionDelegate {
    private var session: NFCNDEFReaderSession!
    private var audioPlayer = AudioPlayer()
    @Published var vehicle: Vehicle? {
        didSet {
            if let audioPath = vehicle?.audioPath {
                self.audioPlayer.startPlayback(audioPath: audioPath)
            }
        }
    }
    
    func startSession() {
        guard NFCNDEFReaderSession.readingAvailable else {
            print("Cannot use NFC")
            return
        }
        if session != nil {
            stopSession()
        }
        session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
        session?.alertMessage = "タグをiPhone上部に近づけてね"
        session?.begin()
    }
    
    func stopSession() {
        session?.invalidate()
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetect tags: [NFCNDEFTag]) {
        // https://qiita.com/Kyome/items/1bf108110dd6bf9fac60
        guard let tag = tags.first else {
            return
        }
        session.connect(to: tag) { (error) in
            if error != nil {
                session.restartPolling()
                return
            }
        }
        tag.queryNDEFStatus { (status, capacity, error) in
            tag.readNDEF { (message, error) in
                guard error == nil, message != nil, let record = message?.records.first else {
                    self.stopSession()
                    print(error?.localizedDescription ?? "")
                    return
                }
                guard let type = String(data: record.type, encoding: .utf8), type == "T" else {
                    return
                }
                guard let text = record.wellKnownTypeTextPayload().0, let vehicle = Vehicle(rawValue: text) else {
                    return
                }
                self.stopSession()
                DispatchQueue.main.async {
                    self.vehicle = vehicle
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.startSession()
                }
            }
        }
    }
}
