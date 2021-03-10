//
//  VIHeader.swift
//  VeliaUI
//
//  Created by Ben Sova on 2/1/21.
//

@_exported import SwiftUI

// MARK: Generation

public struct VIHeader: View {
    let primaryText: String
    let secondaryText: String
    let tritaryText: String?
    @State var useSecondTitle = false
    var alignment = HorizontalAlignment.center
    @Binding var compressed: Bool
    public var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: alignment) {
                HStack(alignment: .bottom) {
                    Text(primaryText)
                        .font(compressed ? .system(size: 17.5) : .title)
                        .bold()
                    if compressed {
                        if useSecondTitle {
                            Text(tritaryText ?? "VELIA UI ERROR x1")
                                .font(.system(size: 10))
                                .bold()
                                .foregroundColor(.secondary)
                                .offset(y: -2.5)
                        } else {
                            Text(secondaryText)
                                .font(.system(size: 10))
                                .bold()
                                .foregroundColor(.secondary)
                                .offset(y: -2.5)
                        }
                    }
                }
                    .onAppear {
                        if tritaryText != nil {
                            withAnimation(Animation.linear(duration: 1).delay(5).repeatForever()) {
                                useSecondTitle = true
                            }
                        }
                    }
                if !compressed {
                    if useSecondTitle {
                        Text(tritaryText ?? "VELIA UI ERROR x1")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    } else {
                        Text(secondaryText)
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
//        .padding(.top, 40)
    }
    
    internal init(p: String, s: String, t: String? = nil, a: HorizontalAlignment, c: Binding<Bool> = .constant(false)) {
        primaryText = p
        secondaryText = s
        tritaryText = t
        alignment = a
        _compressed = c
    }
}

// MARK: Initialization

public extension VIHeader {
    init(p: String, s: String, t: String? = nil, c: Binding<Bool> = .constant(false)) {
        primaryText = p
        secondaryText = s
        tritaryText = t
        _compressed = c
    }
}

// MARK: Modification

public extension VIHeader {
    func alignment(_ align: HorizontalAlignment) -> Self {
        .init(p: primaryText, s: secondaryText, t: tritaryText, a: align, c: $compressed)
    }
}

public func titleDate() -> String {
    let titleFormater = DateFormatter()
    titleFormater.dateFormat = "EEEE  MMM d yyyy"
    return titleFormater.string(from: Date()).uppercased()
}
