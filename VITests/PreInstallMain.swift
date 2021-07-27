//
//  PreInstallMain.swift
//  VITests
//
//  Created by Ben Sova on 2/05/21.
//

import VeliaUI
import WaterfallGrid

struct PreInstallMain: View {
    @State var hovered: String?
    @Environment(\.colorScheme) var colorScheme
    @State var progress = 0
    @State var compressed = false
    @State var presentHIW = false
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                VIHeader(p: "Patched Sur", s: "v1.0.0 EX (84)", c: $compressed)
                    .alignment(.leading)
                Spacer()
                VIButton(id: "HELP", h: $hovered) {
                    Image("QuestionMark")
                        .resizable()
                        .frame(width: compressed ? 10 : 15, height: compressed ? 10 : 15)
                        .scaleEffect(compressed ? 1.2 : 1)
                } onClick: {
                    presentHIW = true
                }
                VIButton(id: "GITHUB", h: $hovered) {
                    Image("GitHubMark")
                        .resizable()
                        .frame(width: compressed ? 10 : 15, height: compressed ? 10 : 15)
                        .scaleEffect(compressed ? 1.2 : 1)
                } onClick: {
                    NSWorkspace.shared.open(URL(string: "https://github.com/BenSova/Patched-Sur")!)
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, compressed ? 30 : 40)
            Spacer()
            Group {
                switch progress {
                case 0:
                    PreFirstView(hovered: $hovered, p: $progress, c: $compressed)
                default:
                    PreVolumeSelectView(hovered: $hovered)
                }
            }.transition(AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            .padding(.horizontal, 30)
            Spacer()
                .sheet(isPresented: $presentHIW, content: {
                    PreHowItWorksView(hovered: $hovered, p: $progress, c: $compressed, present: $presentHIW)
                })
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct PreFirstView: View {
    @Binding var hovered: String?
    @Binding var p: Int
    @Binding var c: Bool
    @State var text = ""
    var body: some View {
        VStack() {
            Text("Welcome to Patched Sur!").bold()
            Text("This patcher is made to provide you with the simplest upgrade to macOS Big Sur on your unsupported Mac. It prepares everything to be perfect by the end of the installation, and makes sure that nothing will go wrong with your installtion. By the end, Patched Sur will try to make your Mac run just like a supported one.")
                .multilineTextAlignment(.center)
                .padding()
//            VIError("Really long errdfsfor.")
//            VIButton(id: "CONTINUE", h: $hovered) {
//                Text("Get Started")
//                Image("ForwardArrowCircle")
//            }.inPad()
            VITextField(text: $text, w: 300, s: Image(systemName: "person.fill")) {
                Text("Username")
            }
            VITextField(text: $text, w: 300) {
                Text("Username")
            }
        }
    }
}

struct PreVolumeSelectView: View {
    @Binding var hovered: String?
    var body: some View {
        VStack {
            Text("Select a USB Volume").bold()
            Text("To install MacOS Big Sur, you need to make a USB installer. The USB drive must be 16GB or greater to store the main OS and recovery mode. If your USB drive doesn't show up, click refresh to reindex the list.")
                .multilineTextAlignment(.center)
                .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                WaterfallGrid(["Macintosh SSD", "Install macOS Big Sur Beta", "MacOS Is Cool", "This is some text", "Another Drive", "I am Ben", "BOOTCAMP", "Install macOS Big Sur", "Install macOS Catalina", "MacCatalina", "This is a Song", "Continuing List Of Drive", "MacCatalina - Data", "DriveA", "DriveB", "DriveC", "@BenOwl3 on Twitter", "@BenSova on GitHub", "u/BenSova on Reddit", "Say 123ABC", "r/Widgy Mod", "Building UI Designs", "Too Many Things", "This is another pointless drive name that's crazy", "ABC123", "@BenSova#5264 on Discord", "Xcode is Annoying", "HighSur", "macOS Weed", "This is cool", "UI Developer", "macOS Zeon", "Patched-Sur", "Building an App"], id: \.self) { name in
                    Button {
                        
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.accentColor)
                                .opacity(hovered == "VOLUME \(name)" ? 1 : 0.1)
                                .cornerRadius(15)
                            HStack {
                                Text(name)
                            }.foregroundColor(hovered == "VOLUME \(name)" ? .white : .accentColor)
                            .padding(7)
                            .padding(.horizontal, 7)
                        }
                    }.buttonStyle(BorderlessButtonStyle())
                    .onHover { hovering in
                        withAnimation {
                            hovered = hovering ? "VOLUME \(name)" : nil
                        }
                    }
                }.gridStyle(columns: 3, spacing: 8, animation: .default)
                .scrollOptions(direction: .horizontal)
            }
        }.padding(.vertical)
    }
}

struct PreHowItWorksView: View {
    @Binding var hovered: String?
    @Binding var p: Int
    @Binding var c: Bool
    @Binding var present: Bool
    var body: some View {
        ScrollView {
            HStack {
                VIHeader(p: "How It Works", s: "", c: .constant(true))
                Spacer()
                VIButton(id: "EXIT-HIW", h: $hovered) {
                    Image("XmarkCircle")
                } onClick: {
                    present = false
                }
            }
            Text(howitworks)
                .multilineTextAlignment(.center)
                .padding(.vertical)
            VIButton(id: "START", h: $hovered) {
                Text("Get Started")
                Image("ArrowRightCircle")
            } onClick: {
                withAnimation {
                    p += 1
                    c = true
                    present = false
                }
            }.inPad()
        }.padding(30)
        .frame(width: 534, height: 296)
    }
}

let howitworks = """
Patched Sur is a simple Application for running macOS on unsupported Macs. It used all official software from Apple, but optimizes it for your Mac.
PLEASE REMEMBER: Patched Sur should work perfectly fine on most Macs, but a lot can go wrong with the process, especially if you don't read the instructions. Potential problems may include data loss, kernel panics, no entry signs, and more. Please always make a Time Machine Backup before using Patched Sur in case anything goes wrong and you need to reset your Mac.
Just note though, this isn't all by me. I only made the app and made the changes to make it easy for anyone to go through this process. Here's where everyone else came to help:
- ASentientBot: Made the Hax patches for the installer and brought GeForce Tesla (9400M/320M) framebuffer to Big Sur
- jackluke: Figured out how to bypass compatibility checks on the installer USB.
- highvoltage12v: Made the first WiFi kexts used with Big Sur
- ParrotGeek: developed the LegacyUSBInjector kext to get USB ports working on some older Macs and figuring out a way to skip the terminal commands when opening the installer app on the USB.
- testheit: Helped with the kmutil command in the micropatcher (that is used in Patched Sur too)
- barrykn: Made the micropatcher that introduced me to the patching process and restored my faith in my really old computer. My hat is down to barrykn, and yours should be too.
- Ausdauersportler: Integrated patches for iMac Metal GPU support.
- and several others who helped with making Big Sur run as great as it does on unsupported Macs.
Yeah, I didn't even do a third of the work, but just so you know your Mac is safe, here's everything Patched Sur does.
It creates the usb installer used to install macOS Big Sur onto your Mac. To do that it needs a couple of things: an official copy of the Install macOS Big Sur.app, downloaded straight from Apple or you can choose your own, and a copy of barrykn's micropatcher used for patching a couple of things on the usb and later for replacing your kexts (similar to drivers which make stuff like WiFi and USB ports work).
The installer is used to flash a copy of something similar to Recovery Mode onto the USB so you can boot into that. However, before that you need to patch it so that you can reinstall macOS like you normally would if something went wrong with your Mac (which in this case is Apple dropping support for it).
Booting into the installer is relatively simple, but you have to do one thing first. Part of the usb patches is that it adds a second drive you need to boot into first. AND!!! I'll finish this later! On to v0.0.4.
"""

struct ReleaseTrackView: View {
    @State var hovered: String?
    
    var body: some View {
        VStack {
            Text("Set Update Track")
                .font(.system(size: 15)).bold()
            Text("Your update track defines what versions of macOS get. The Release track is the most stable, and probably what you're using already. Beta gives you access to new features of macOS early, but it's unstable at times.")
                .multilineTextAlignment(.center)
                .padding(.vertical)
            HStack {
                VIButton(id: "RELEASE", h: $hovered) {
                    Image("TriUpCircleFill")
                    Text("Release")
                        .fontWeight(.heavy)
                } onClick: {
                }.inPad()
                .btColor(.gray)
                .useHoverAccent()
                VIButton(id: "BETA", h: $hovered) {
                    Image("AntCircle")
                    Text("Beta")
                        .fontWeight(.regular)
                } onClick: {
                }.inPad()
                .btColor(.gray)
                .useHoverAccent()
            }.padding(.bottom)
            VIButton(id: "CONTINUE", h: $hovered) {
                Text("Continue")
                Image("ForwardArrowCircle")
            } onClick: {
                withAnimation {
                }
            }.inPad()
        }
    }
}
