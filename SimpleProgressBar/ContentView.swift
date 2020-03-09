//
//  ContentView.swift
//  SimpleProgressBar
//
//  Created by Huynh Tan Phu on 3/9/20.
//  Copyright © 2020 Filesoft. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var simpleProgess: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Text("\(Int(self.simpleProgess*100))%")
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 400, height: 20)
                    .cornerRadius(20)
                
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: self.simpleProgess * 400, height: 20)
                    .cornerRadius(20)
            }
            
            Button(action: { self.startTimer() }) {
                Text("Start Timer")
            }
        }
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            if self.simpleProgess >= 1.0 {
                timer.invalidate()
            } else {
                self.simpleProgess += 0.01
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
