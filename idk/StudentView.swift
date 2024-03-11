//
//  StudentView.swift
//  idk
//
//  Created by 90310805 on 3/11/24.
//

import SwiftUI

struct StudentView: View {
    var body: some View {
        Text("temporary screen")
            .offset(y: -150)
    
       
        HStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Bus")
            })
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Fields")
            })
        }
    }
    
}

#Preview {
    StudentView()
}
