//
//  OscarApp.swift
//  Oscar
//
//  Created by Apple on 03/10/22.
//

import SwiftUI

@main
struct OscarApp: App {
    
    @State var p : String = ""
    @State var yr : String = ""
    @State var r : String = ""
    @State var an : Float = 0.0
    
    
    init() {
        
    }
    
    
    var body: some Scene {
        
        WindowGroup {
            
            ContentView(price: p, years: yr, rate: r, answer: an)
        }
    }
}
