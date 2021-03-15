//
//  PostInstallMain.swift
//  VITests
//
//  Created by Ben Sova on 1/31/21.
//

import VeliaUI

struct PostInstallMain: View {
    @State var hovered: String?
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                VIHeader(p: "Patched Sur", s: "v1.0.0 EX (84)")
                    .alignment(.leading)
                    .padding(.leading, 30)
                Spacer()
                VIButton(id: "SETTINGS", h: $hovered) {
                    Image(systemName: "gearshape")
                } onClick: {
                    
                }
                    .padding(.trailing, 30)
            }.padding(.top, 40)
            Spacer()
            VStack(alignment: .leading, spacing: 5) {
                VISimpleCell(t: "Update macOS", d: "Go from your current version of macOS to a newer one,\nwhere there's something new.", s: "arrow.clockwise.circle", id: "UPDATE", h: $hovered)
                VISimpleCell(t: "Patch Kexts", d: "Kexts provide macOS with it's full functionality. So that\neverything works like it should.", s: "doc.circle", id: "KEXTS", h: $hovered)
                VISimpleCell(t: "Settings", d: "Disable animations, enable graphics switching, show\nlogs from Patch Kexts, and maybe more.", s: "gearshape", id: "ABOUT", h: $hovered)
            }.padding(.horizontal, 40)
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}