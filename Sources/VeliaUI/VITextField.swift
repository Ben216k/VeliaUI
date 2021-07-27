//
//  VITextField.swift
//  VeliaUI
//
//  Created by Ben Sova on 7/27/21.
//

import SwiftUI

public struct VITextField<V: View>: View {
    let view: () -> V
    let w: CGFloat?
    @Binding var text: String
    public var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Accent"))
                .opacity(0.1)
                .cornerRadius(15)
            HStack {
                view()
                    .foregroundColor(Color("Accent"))
                Spacer()
            }.padding(7)
            .padding(.horizontal, 7)
            TextField("", text: $text)
                .textFieldStyle(PlainTextFieldStyle())
                .foregroundColor(Color("Accent"))
                .padding(.horizontal, 7)
                .padding(7)
                .multilineTextAlignment(.leading)
        }.fixedSize(horizontal: false, vertical: true).frame(width: w)
    }
}

extension VITextField {
    public init(text: Binding<String>, w: CGFloat?, @ViewBuilder view: @escaping () -> V) {
        self.view = view
        self.w = w
        self._text = text
    }
}

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}

extension NSTextView {
    open override var frame: CGRect {
        didSet {
            insertionPointColor = NSColor(named: "Accent")!
        }
    }
}
