//
//  VISymbolShadowButton.swift
//  VeliaUI
//
//  Created by Ben Sova on 2/1/21.
//

import SwiftUI

// MARK: Generation

public struct VISymbolShadowButton: View {
    let symbol: String
    let filledSymbol: String
    let id: String
    @Binding var hovered: String?
    let onClick: () -> ()
    @Environment(\.colorScheme) var colorScheme
    public var body: some View {
        Button {
            onClick()
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(.accentColor)
                    .opacity(colorScheme == .dark ? 0.1 : 0.05)
                    .frame(width: 30, height: 30)
                    .cornerRadius(15)
                if #available(OSX 11.0, *) {
                    Image(systemName: hovered == id ? filledSymbol : symbol)
                        .foregroundColor(.accentColor)
                } else {
                    
                }
            }
        }.buttonStyle(BorderlessButtonStyle())
        .onHover { hovering in
            withAnimation {
                hovered = hovering ? id : nil
            }
        }.shadow(color: .accentColor, radius: hovered == id ? 9 : 0)
    }
    
    public init(s: String, f: String? = nil, id: String, h: Binding<String?>, onClick: @escaping () -> ()) {
        symbol = s
        filledSymbol = f ?? "\(s).fill"
        self.id = id
        _hovered = h
        self.onClick = onClick
    }
}

