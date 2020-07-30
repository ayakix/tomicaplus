//
//  IntentHandler.swift
//  tomicaintent
//
//  Created by Ryota Ayaki on 2020/07/30.
//  Copyright © 2020 Ryota Ayaki. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return MyIntentHandler()
    }
}
