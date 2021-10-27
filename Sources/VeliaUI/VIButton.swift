//
//  VIButton.swift
//  VeliaUI
//
//  Created by Ben Sova on 2/6/21.
//

import SwiftUI

// MARK: Generation

public struct VIButton<V: View>: View {
    let view: () -> V
    let id: String
    @Binding var hovered: String?
    let onClick: () -> ()
    @Environment(\.colorScheme) var colorScheme
    var useTextPadding: Bool
    var color: Color
    let useAccent: Bool
    let fixedHorizontal: Bool
    
    public var body: some View {
        Button {
            onClick()
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(hovered == id && useAccent ? Color("Accent") : color)
                    .opacity(hovered == id ? 1 : 0.1)
                    .cornerRadius(15)
                ZStack(alignment: .center) {
                    HStack {
                        view()
                    }.foregroundColor(.white)
                    .opacity(hovered == id ? 1 : 0)
                    HStack {
                        view()
                    }.foregroundColor(color)
                    .opacity(hovered == id ? 0 : 1)
                }.padding(7)
                .padding(.horizontal, useTextPadding ? 7 : 0)
            }.fixedSize(horizontal: fixedHorizontal, vertical: true)
        }.buttonStyle(BorderlessButtonStyle())
        .onHover { hovering in
            withAnimation {
                hovered = hovering ? id : nil
            }
        }
    }
}

// MARK: Initialization

extension VIButton {
    public init(id: String, h: Binding<String?>, @ViewBuilder view: @escaping () -> V, onClick: @escaping () -> () = {}) {
        self.view = view
        self.id = id
        _hovered = h
        self.onClick = onClick
        useTextPadding = false
        color = Color("Accent")
        useAccent = false
        fixedHorizontal = true
    }
}

extension VIButton {
    public func inPad() -> Self {
        .init(view: view, id: id, hovered: $hovered, onClick: onClick, useTextPadding: true, color: color, useAccent: useAccent, fixedHorizontal: fixedHorizontal)
    }
    
    public func btColor(_ c: Color) -> Self {
        .init(view: view, id: id, hovered: $hovered, onClick: onClick, useTextPadding: useTextPadding, color: c, useAccent: useAccent, fixedHorizontal: fixedHorizontal)
    }
    
    public func useHoverAccent() -> Self {
        .init(view: view, id: id, hovered: $hovered, onClick: onClick, useTextPadding: useTextPadding, color: color, useAccent: true, fixedHorizontal: fixedHorizontal)
    }
    
    public func fixedHorizontal(_ b: Bool) -> Self {
        .init(view: view, id: id, hovered: $hovered, onClick: onClick, useTextPadding: useTextPadding, color: color, useAccent: useAccent, fixedHorizontal: b)
    }
}
