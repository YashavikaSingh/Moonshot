//
//  ContentView.swift
//  Moonshot
//
//  Created by Yashavika Singh on 12.06.24.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    var body: some View {
        Text(String(astronauts.count))
    }
}

#Preview {
    ContentView()
}
