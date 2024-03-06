//
//  Start.swift
//  ACS
//
//  Created by 90310805 on 3/5/24.
//

import SwiftUI

struct Start: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("EPEagle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .position(CGPoint(x: 200.0, y: 100.0))
                NavigationLink(destination: StudentLogin()){ Image("studentButton")}
                
                
                Spacer()
                    .frame(height: 50.0)
                NavigationLink(destination: ContentView()){ Image("staffButton")}
                
                Spacer()
                    .frame(height: 200.0)
            }
            .background(Color.black)
        }
    }
}

#Preview {
    Start()
}
