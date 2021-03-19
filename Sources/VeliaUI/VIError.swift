//
//  VIError.swift
//  VeliaUI
//
//  Created by Ben Sova on 3/14/21.
//

import SwiftUI

public struct VIError: View {
    public let e: String
    
    public var body: some View {
        VStack {
            Button {
                let pasteboard = NSPasteboard.general
                pasteboard.declareTypes([.string], owner: nil)
                pasteboard.setString(e, forType: .string)
            } label: {
                ZStack {
                    Color.red
                        .opacity(0.1)
                        .frame(maxHeight: 400)
                    ScrollView(showsIndicators: false) {
                        HStack {
                            Text(e)
                                .font(.system(size: 10, design: .monospaced))
                                .foregroundColor(.red)
                                .padding(10)
                            Spacer()
                        }
                    }.frame(width: 450, height: 100)
                }.fixedSize()
            }.buttonStyle(BorderlessButtonStyle())
            .cornerRadius(10)
            Text("Click to Copy")
                .font(.caption)
        }
    }
    
    public init (_ e: String) {
        self.e = e
    }
}
