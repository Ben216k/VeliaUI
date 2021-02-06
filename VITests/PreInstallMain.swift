//
//  PreInstallMain.swift
//  VITests
//
//  Created by Ben Sova on 2/05/21.
//

import VeliaUI

struct PreInstallMain: View {
    @State var hovered: String?
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                VIHeader(p: "Patched Sur", s: "v1.0.0 EX (84)")
                    .alignment(.leading)
                Spacer()
                Button {
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.accentColor)
                            .opacity(hovered == "GITHUB" ? 1 : 0.1)
                            .cornerRadius(15)
                        Image("GitHubMark")
                            .foregroundColor(hovered == "GITHUB" ? .white : .accentColor)
                        .padding(7)
                    }
                }.buttonStyle(BorderlessButtonStyle())
                .onHover { hovering in
                    withAnimation {
                        hovered = hovering ? "GITHUB" : nil
                    }
                }
            }.padding(.horizontal, 30)
            .padding(.top, 40)
            Spacer()
            VStack() {
                Text("Welcome to Patched Sur!").bold()
                Text("This patcher is made to provide you with the simplest upgrade to macOS Big Sur on your unsupported Mac. It prepares everything to be perfect by the end of the installation, and makes sure that nothing will go wrong with your installtion. By the end, Patched Sur will try to make your Mac run just like a supported one.")
                    .multilineTextAlignment(.center)
                    .padding()
                Button {
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.accentColor)
                            .opacity(hovered == "START" ? 1 : 0.1)
                            .cornerRadius(15)
                        HStack {
                            Text("Get Started")
                            Image("ArrowRightCircle")
                        }.foregroundColor(hovered == "START" ? .white : .accentColor)
                        .padding(7)
                        .padding(.horizontal, 10)
                    }
                }.buttonStyle(BorderlessButtonStyle())
                .onHover { hovering in
                    withAnimation {
                        hovered = hovering ? "START" : nil
                    }
                }
            }.padding(.horizontal, 40)
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .accentColor(.init("AccentColor"))
    }
}
