//
//  LoginScreenView.swift
//  PortfolioApp
//
//  Created by Adriano Valumin on 12/05/24.
//

import SwiftUI

struct LoginScreenView: View {
    // MARK: - Properties

    @Environment(\.dismiss) var dismiss

    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    @FocusState private var isEmailFieldFocused: Bool
    @FocusState private var isPasswordFieldFocused: Bool

    private var cornerRadius = 7.0
    private var gradientColors = [
        Color(red: 77 / 255, green: 87 / 255, blue: 243 / 255),
        Color(red: 190 / 255, green: 68 / 255, blue: 248 / 255),
    ]

    // MARK: - Body

    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                    .ignoresSafeArea()

                backgroundView

                ScrollView {
                    headerView
                    loginSectionView
                }
            }
        }.navigationBarBackButtonHidden()
    }

    // MARK: - Background

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

    // MARK: - Subviews

    var headerView: some View {
        VStack {
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "arrow.backward")
                })

                Spacer()

                Text("Sign In to")
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
                    .fontWeight(.medium)
                    .frame(maxHeight: 24.0)

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

    var loginSectionView: some View {
        VStack {
            // MARK: - Login Fields

            TextFieldView(fieldName: "E-mail", placeHolder: "example@email.com", iconName: "envelope")
                .padding(.horizontal)
                .padding(.bottom)

            TextFieldView(secureField: true, fieldName: "Password", placeHolder: "Your password", iconName: "lock")
                .padding(.horizontal)
                .padding(.bottom)

            VStack {
                // MARK: - Login Buttons

                Button(action: {
                    // Do nothing
                }, label: {
                    Text("Continue \(Image(systemName: "arrow.forward"))")
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: 32)
                        .padding(.vertical)
                        .background(
                            LinearGradient(
                                colors: gradientColors,
                                startPoint: .leading,
                                endPoint: .trailing
                            ).opacity(0.85)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                        .overlay(
                            RoundedRectangle(
                                cornerRadius: cornerRadius)
                                .stroke(
                                    LinearGradient(
                                        colors: gradientColors,
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                        )
                })

                VStack {
                    // MARK: - Forgot Password

                    Button(action: {
                        // Do nothing
                    }, label: {
                        Text("Forgot your password?")
                            .fontWeight(.light)
                            .foregroundStyle(.black.opacity(0.6))
                            .underline(pattern: .solid, color: .gray.opacity(0.25))
                    })
                    .padding(.top)
                }
            }
            .padding()

            // MARK: - Or Divider

            HStack {
                VStack {
                    Divider()
                        .background(.black)
                }
                VStack {
                    Text("or")
                        .fontWeight(.light)
                        .foregroundStyle(.gray)
                        .padding(.horizontal)
                }
                VStack {
                    Divider()
                        .background(.black)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 16)

            // MARK: - Social Login

            VStack {
                Button(action: {
                    // Do nothing
                }, label: {
                    HStack {
                        Image(systemName: "apple.logo")
                            .resizable()
                            .scaledToFit()

                        Text("Sign In with Apple")
                    }
                    .frame(maxWidth: .infinity, maxHeight: 24)
                    .padding()
                    .foregroundStyle(.black)
                    .background(Color(red: 237 / 255, green: 242 / 255, blue: 254 / 255))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(.black.opacity(0.2)))
                })
                .padding(.bottom)

                Button(action: {
                    // Do nothing
                }, label: {
                    HStack {
                        Image("icon-colored-google")
                            .resizable()
                            .scaledToFit()

                        Text("Sign In with Google")
                    }
                    .frame(maxWidth: .infinity, maxHeight: 24)
                    .padding()
                    .foregroundStyle(.black)
                    .background(Color(red: 237 / 255, green: 242 / 255, blue: 254 / 255))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(.black.opacity(0.2)))
                })
                .padding(.bottom)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    LoginScreenView()
}
