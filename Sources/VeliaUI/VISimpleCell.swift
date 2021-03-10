//
//  VISimpleCell.swift
//  VeliaUI
//
//  Created by Ben Sova on 2/1/21.
//

import SwiftUI

public struct VISimpleCell: View {
    let title: String
    let description: String
    let symbol: String
    let filledSymbol: String
    let id: String
    @Binding var hovered: String?
    @Environment(\.colorScheme) var colorScheme
    public var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(colorScheme == .dark ? Color.accentColor.opacity(0.7) : Color.accentColor)
                .opacity(hovered == id ? 1 : 0)
                .cornerRadius(15)
                .frame(width: 375)
                .offset(x: 5)
            HStack(spacing: 15) {
                ZStack() {
                    Rectangle()
                        .foregroundColor(hovered == id ? Color.white.opacity(0.2) : Color.accentColor.opacity(0.2))
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                    if #available(OSX 11.0, *) {
                        Image(systemName: hovered == id ? filledSymbol : symbol)
                            .foregroundColor(hovered == id ? .white : .accentColor)
                            .font(Font.system(size: 30).weight(.light))
                            .padding(10)
                    } else {
                        // Fallback on earlier versions
                    }
                }
                VStack(alignment: .leading) {
                    Text(title)
                        .font(Font.system(size: 13.5).bold())
                        .foregroundColor(hovered == id ? .white : .primary)
                    Text(description)
                        .foregroundColor(hovered == id ? .white : .primary)
                        .font(Font.system(size: 11))
                        .opacity(0.8)
                }
            }.padding(.leading, 5).padding(5)
        }.fixedSize().onHover { hovering in
            withAnimation {
                hovered = hovering ? id : nil
            }
        }
    }
    public init(t: String, d: String, s: String, f: String? = nil, id: String, h: Binding<String?>) {
        title = t
        description = d
        symbol = s
        filledSymbol = f ?? s + ".fill"
        self.id = id
        _hovered = h
    }
}
