//
//  AppDelegate.swift
//  VITests
//
//  Created by Ben Sova on 1/31/21.
//

import VeliaUI

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = PreInstallMain()
        
        // Create the window and set the content view.
        window = NSWindow.init(
            contentRect: NSRect(x: 0, y: 0, width: 584, height: 346),
            styleMask: [.titled, .closable, .fullSizeContentView, .borderless, .miniaturizable],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.titleVisibility = .hidden
        window.titlebarAppearsTransparent = true
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}