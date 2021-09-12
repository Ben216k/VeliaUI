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
    let action: () -> ()
    @Binding var hovered: String?
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.locale) var locale
    public var body: some View {
        Button {
            action()
        } label: {
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(colorScheme == .dark ? Color("Accent").opacity(0.7) : Color("Accent"))
                    .opacity(hovered == id ? 1 : 0.001)
                    .frame(width: 280)
                    .cornerRadius(15)
                    .offset(x: 5)
                    .cornerRadius(15)
                HStack(spacing: 10) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(hovered == id ? Color.white.opacity(0.2) : Color("Accent").opacity(0.2))
                            .frame(width: 52.5, height: 52.5)
                            .cornerRadius(10)
                        ZStack(alignment: .center) {
                            if #available(OSX 11.0, *) {
                                    Image(systemName: filledSymbol)
                                        .foregroundColor(hovered == id ? .white : Color("Accent"))
                                        .font(Font.system(size: 31.25).weight(.light))
                                        .frame(width: 31.25, height: 31.25)
                                        .padding(5)
                                        .opacity(hovered == id ? 1 : 0)
                                    Image(systemName: symbol)
                                        .foregroundColor(hovered == id ? .white : Color("Accent"))
                                        .font(Font.system(size: 31.25).weight(.light))
                                        .frame(width: 31.25, height: 31.25)
                                        .padding(5)
                                        .opacity(hovered == id ? 0 : 1)
                            } else {
                                // Fallback on earlier versions
                            }
                        }
                    }.padding(.leading, 5)
                    ZStack {
                        VStack(alignment: .leading, spacing: 1) {
                            Text(title)
                                .font(Font.system(size: locale.identifier.hasPrefix("de") || locale.identifier.hasPrefix("el") ? 11.5 : 13.5).bold())
                                .foregroundColor(.white)
                                .opacity(hovered == id ? 1 : 0)
                                .frame(width: 290, alignment: .leading)
                            Text(description)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                                .font(Font.system(size: locale.identifier.hasPrefix("de") || locale.identifier.hasPrefix("el") ? 9.5 : 11))
                                .opacity(0.8)
                                .lineLimit(4)
                                .frame(maxWidth: 210, alignment: .leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .offset(y: 1)
                                .opacity(hovered == id ? 1 : 0)
                        }.frame(width: 180, alignment: .leading)
                        VStack(alignment: .leading, spacing: 1) {
                            Text(title)
                                .font(Font.system(size: locale.identifier.hasPrefix("de") || locale.identifier.hasPrefix("el") ? 11.5 : 13.5).bold())
                                .foregroundColor(.primary)
                                .opacity(hovered == id ? 0 : 1)
                                .frame(width: 290, alignment: .leading)
                            Text(description)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.primary)
                                .font(Font.system(size: locale.identifier.hasPrefix("de") || locale.identifier.hasPrefix("el") ? 9.5 : 11))
                                .opacity(0.8)
                                .lineLimit(4)
                                .frame(maxWidth: 210, alignment: .leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .offset(y: 1)
                                .opacity(hovered == id ? 0 : 1)
                        }.frame(width: 180, alignment: .leading)
                    }
                }.padding(.leading, 5).padding(5)
            }.fixedSize().onHover { hovering in
                withAnimation {
                    hovered = hovering ? id : nil
                }
            }
            .onAppear {
                print(locale.identifier)
            }
        }.buttonStyle(BorderlessButtonStyle())
        .padding(.vertical, locale.identifier.hasPrefix("de") || locale.identifier.hasPrefix("el") ? 2.5 : 0)
    }
    public init(t: String, d: String, s: String, f: String? = nil, id: String, h: Binding<String?>, a: @escaping () -> () = {}) {
        title = t
        description = d
        symbol = s
        filledSymbol = f ?? s + ".fill"
        self.id = id
        _hovered = h
        action = a
    }
}
