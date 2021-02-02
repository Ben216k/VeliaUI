//
//  ContentView.swift
//  VITests
//
//  Created by Ben Sova on 1/31/21.
//

import VeliaUI

struct ContentView: View {
    var body: some View {
        VStack {
            VIHeader(p: "Good Morning", s: titleDate(), t: "VELIA UI IS GOOD")
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
