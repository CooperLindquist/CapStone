//
//  ContentView.swift
//  ACSCJA
//
//  Created by 90310805 on 3/6/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var email = ""
    @State private var password = ""
    @State private var showSheet = false
    var body: some View {
        NavigationStack {
            ZStack {
                ZStack{
                    if viewModel.isLoading {
                        ProgressView()
                    }
                    Color.black
                    
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [.pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 1000, height: 400)
                        .rotationEffect(.degrees(135))
                        .offset(y: -350)
                    Image("EPEagle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100.0)
                        .offset(y: -300)
                        
                    
                    
                    
                    VStack(spacing: 20) {
                        
                        Text("Student Login")
                            .foregroundColor(.white)
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .offset(x: -60, y: -100)
                        
                        TextField("Email", text: $email)
                            .foregroundColor(.white)
                            .textFieldStyle(.plain)
                            .placeholder(when: email.isEmpty) {
                                Text("Email")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        Rectangle()
                            .frame(width: 350, height: 1)
                            .foregroundColor(.white)
                        
                        SecureField("Password", text: $password)
                            .foregroundColor(.white)
                            .textFieldStyle(.plain)
                            .placeholder(when: password.isEmpty) {
                                Text("Password")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        
                        Rectangle()
                            .frame(width: 350, height: 1)
                            .foregroundColor(.white)
                        
                        Button {
                            //sign up
                            Task {
                                try? await viewModel.createUser(email: email, password: password)
                            }
                        } label: {
                            Text("Sign Up")
                                .bold()
                                .frame(width: 200, height: 40)
                                
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.white)
                        .offset(y: 100)
                        Button {
                            showSheet.toggle()
                        } label: {
                            Text("Already have an account? Login")
                                .bold()
                                .foregroundColor(.white)
                        }
                        .padding(.top)
                        .offset(y: 110)
                        
                    }
                    .frame(width: 350)
                }
                
                
                .opacity(viewModel.isLoading ? 0.5 : 1.0)
                .ignoresSafeArea()
            }
        }
        .alert(viewModel.hasError ? "Error" : "Success", isPresented: $viewModel.showAlert) {
            if viewModel.hasError {
                Button("Try Again") {}
            } else {
                Button("Ok") {
                    dismiss()
                }
            }
        } message: {
            Text(viewModel.alertMessage)
        }
        .sheet(isPresented: $showSheet) {
            StudentLogin()
        }
    }

}

#Preview {
    ContentView()
   }

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}


