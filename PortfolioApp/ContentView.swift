//
//  ContentView.swift
//  PortfolioApp
//
//  Created by Adriano Valumin on 12/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userEmail: String = ""
    @FocusState private var isEmailFieldFocused: Bool
    @State private var userPassword: String = ""
    @FocusState private var isPasswordFieldFocused: Bool

    private var gradientColors = [
        Color(red: 77 / 255, green: 87 / 255, blue: 243 / 255),
        Color(red: 190 / 255, green: 68 / 255, blue: 248 / 255),
    ]

    var body: some View {
        ZStack {
            backgroundView
            headerView
            mainView
        }
    }

    var backgroundView: some View {
        ZStack {
            Color(.white)
            VStack {
                RoundedRectangle(cornerRadius: 60)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .foregroundStyle(Color(red: 246 / 255, green: 242 / 255, blue: 254 / 255))
                    .ignoresSafeArea()
                    .offset(CGSize(width: 0, height: -90.0))
                Spacer()
            }
            .padding(5)
        }
    }

    var headerView: some View {
        VStack {
            HStack {
                Image(systemName: "arrow.backward")

                Spacer()

                Text("Sign In to")
                    .padding(.horizontal, 24)
                    .fontWeight(.medium)
                    .frame(height: 24.0)

                Spacer()
            }
            .padding()

            Button(action: {
                // Do nothing
            }, label: {
                HStack {
                    Image(systemName: "ladybug.fill")
                        .renderingMode(.original)
                    Text("Adriano Valumin")
                        .fontWeight(.heavy)
                        .foregroundStyle(.black)
                }
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 5, y: 5)
            })
            .padding(.top, 16)

            Spacer()
        }
    }

    var mainView: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("E-mail")
                    .font(.system(size: 14))
                    .fontWeight(.light)

                TextField("\(Image(systemName: "envelope")) \("example@gmail.com")", text: $userEmail, prompt: Text?.none)
                    .foregroundStyle(.black)
                    .focused($isEmailFieldFocused)
                    .padding()
                    .fontWeight(.light)
                    .keyboardType(.emailAddress)
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(
                                LinearGradient(
                                    colors: isEmailFieldFocused ? [
                                        Color(red: 77 / 255, green: 87 / 255, blue: 243 / 255),
                                        Color(red: 190 / 255, green: 68 / 255, blue: 248 / 255),
                                    ] : [Color.black],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ),
                                lineWidth: 1
                            )
                    )
            }
            .padding()

            VStack(alignment: .leading) {
                Text("Password")
                    .font(.system(size: 14))
                    .fontWeight(.light)

                SecureField("\(Image(systemName: "lock"))", text: $userPassword)
                    .foregroundStyle(.black)
                    .focused($isPasswordFieldFocused)
                    .padding()
                    .fontWeight(.light)
                    .keyboardType(.emailAddress)
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(
                                LinearGradient(
                                    colors: isPasswordFieldFocused ? [
                                        Color(red: 77 / 255, green: 87 / 255, blue: 243 / 255),
                                        Color(red: 190 / 255, green: 68 / 255, blue: 248 / 255),
                                    ] : [Color.black],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ),
                                lineWidth: 1
                            )
                    )
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
