//
//  PostInstallMain.swift
//  VITests
//
//  Created by Ben Sova on 1/31/21.
//

import VeliaUI

struct ContentView: View {
    @State var hovered: String?
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                VIHeader(p: "Patched Sur", s: "v1.0.0 EX (84)")
                    .alignment(.leading)
                    .padding(.leading, 30)
                Spacer()
                VISymbolShadowButton(s: "gearshape", id: "GEAR", h: $hovered, onClick: {})
                    .padding(.trailing, 30)
            }.padding(.top, 40)
            Spacer()
            VStack(alignment: .leading, spacing: 5) {
                VISimpleCell(t: "Update macOS", d: "Go from your current version of macOS to a newer one,\nwhere there's something new.", s: "arrow.clockwise.circle", id: "UPDATE", h: $hovered)
                VISimpleCell(t: "Patch Kexts", d: "Kexts provide macOS with it's full functionality. So that\neverything works like it should.", s: "doc.circle", id: "KEXTS", h: $hovered)
                VISimpleCell(t: "About This Mac", d: "The most unnecessary thing I added to this patcher. It\nshows some information about your Mac.", s: "info.circle", id: "ABOUT", h: $hovered)
//                VISimpleCell(t: "Settings", d: "Some extra options that might help with your Patched Sur\ninstalltion. Just some extras.", i: "gearshape")
            }.padding(.horizontal, 40)
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
