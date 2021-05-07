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
                VIButton(id: "GITHUB", h: $hovered) {
                    Image("GitHubMark")
                } onClick: {
                    
                }
                    .padding(.trailing, 30)
            }.padding(.top, 40)
            Spacer()
            HStack {
                VStack(alignment: .leading, spacing: 7) {
                    VISimpleCell(t: "Update macOS", d: "Go from your current version of macOS to a newer one, where there's something new.", s: "arrow.clockwise.circle", id: "UPDATE", h: $hovered)
                    VISimpleCell(t: "Patch Kexts", d: "Kexts provide macOS with it's full functionality. So that everything works like it should.", s: "doc.circle", id: "KEXTS", h: $hovered)
                    VISimpleCell(t: "Settings", d: "Disable animations, enable graphics switching, show logs and maybe more.", s: "gearshape", id: "SETTINGS", h: $hovered)
                }
                VStack(alignment: .leading, spacing: 7) {
                    VISimpleCell(t: "Create Installer", d: "Go from your current version of macOS to a newer one, where there's something new.", s: "externaldrive", id: "INSTALLER", h: $hovered)
//                    VISimpleCell(t: "Install Recovery", d: "Kexts provide macOS with it's full functionality. So that everything works like it should.", s: "asterisk.circle", id: "RECOVERY", h: $hovered)
                    VISimpleCell(t: "Instalar Modo Recuperación", d: "Kexts provide macOS with it's full functionality. So that everything works like it should.", s: "asterisk.circle", id: "RECOVERY", h: $hovered)
                    VISimpleCell(t: "About This Mac", d: "Disable animations, enable graphics switching, show logs and maybe more.", s: "info.circle", id: "ABOUT", h: $hovered)
                }
            }.frame(width: 600, alignment: .center).padding(.horizontal, 40)
            Spacer()
        }.frame(width: 600, alignment: .center)
        .edgesIgnoringSafeArea(.all)
    }
}
