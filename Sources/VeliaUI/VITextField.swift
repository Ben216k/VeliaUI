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
    let symbol: Image?
    @Binding var text: String
    public var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Accent"))
                .opacity(0.1)
                .cornerRadius(15)
            HStack {
                if let symbol = symbol {
                    symbol
                        .font(.system(size: 15, weight: .medium))
                        .frame(width: 15, height: 15)
                        .foregroundColor(Color("Accent"))
                }
                ZStack {
                    HStack {
                        view()
                            .foregroundColor(Color("Accent"))
                            .opacity(text.isEmpty ? 1 : 0)
                        Spacer()
                    }
                    TextField("", text: $text)
                        .textFieldStyle(PlainTextFieldStyle())
                        .foregroundColor(Color("Accent"))
                        .multilineTextAlignment(.leading)
                }
            }.padding(7).padding(.horizontal, 7)
        }.fixedSize(horizontal: false, vertical: true).frame(width: w)
    }
}

extension VITextField {
    public init(text: Binding<String>, w: CGFloat? = nil, s: Image? = nil, @ViewBuilder view: @escaping () -> V) {
        self.view = view
        self.w = w
        self._text = text
        self.symbol = s
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
