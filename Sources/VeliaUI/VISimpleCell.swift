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
    public var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.accentColor.opacity(hovered == id ? 0.1 : 0))
                .cornerRadius(15)
                .shadow(radius: 2)
                .frame(width: 375)
                .offset(x: 5)
            HStack(spacing: 15) {
                ZStack() {
                    Rectangle()
                        .foregroundColor(Color.accentColor.opacity(0.2))
                        .frame(width: 50, height: 50)
                        .cornerRadius(10)
                    if #available(OSX 11.0, *) {
                        Image(systemName: hovered == id ? filledSymbol : symbol)
                            .foregroundColor(.accentColor)
                            .font(Font.system(size: 30).weight(.light))
                            .padding(10)
                    } else {
                        // Fallback on earlier versions
                    }
                }
                VStack(alignment: .leading) {
                    Text(title)
                        .font(Font.system(size: 13.5).bold())
                    Text(description)
                        .foregroundColor(.secondary)
                        .font(Font.system(size: 11))
                }
            }.padding(5)
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
