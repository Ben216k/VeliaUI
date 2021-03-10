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
    
    public var body: some View {
        Button {
            onClick()
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(.accentColor)
                    .opacity(hovered == id ? 1 : 0.1)
                    .cornerRadius(15)
                HStack {
                    view()
                }.foregroundColor(hovered == id ? .white : .accentColor)
                .padding(7)
                .padding(.horizontal, useTextPadding ? 7 : 0)
            }
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
    public init(id: String, h: Binding<String?>, @ViewBuilder view: @escaping () -> V, onClick: @escaping () -> ()) {
        self.view = view
        self.id = id
        _hovered = h
        self.onClick = onClick
        useTextPadding = false
    }
}

extension VIButton {
    public func inPad() -> Self {
        .init(view: view, id: id, hovered: $hovered, onClick: onClick, useTextPadding: true)
    }
}
