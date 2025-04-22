//
//  TextFieldView.swift
//  PortfolioApp
//
//  Created by Adriano Valumin on 14/05/24.
//

import SwiftUI

struct TextFieldView: View {
    @FocusState var isFieldFocused: Bool
    @State var fieldValue: String = ""
    var secureField: Bool = true
    var fieldName: String
    var placeHolder: String
    var iconName: String?
    var cornerRadius = 7.0

    var body: some View {
        VStack(alignment: .leading) {
            Text(fieldName)
                .font(.system(size: 14))
                .fontWeight(.light)

            if secureField {
                SecureField(text: $fieldValue, prompt: Text?.none) {
                    HStack {
                        if let iconName {
                            Text("\(Image(systemName: iconName)) \(placeHolder)")
                        }
                        Text(placeHolder)
                    }
                }
                .foregroundStyle(.black)
                .focused($isFieldFocused)
                .padding()
                .fontWeight(.light)
                .keyboardType(.emailAddress)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(
                            LinearGradient(
                                colors: isFieldFocused ? [
                                    Color(red: 77 / 255, green: 87 / 255, blue: 243 / 255),
                                    Color(red: 190 / 255, green: 68 / 255, blue: 248 / 255),
                                ] : [Color.black],
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            lineWidth: 1
                        )
                )
            } else {
                TextField(text: $fieldValue, prompt: Text?.none) {
                    HStack {
                        if let iconName {
                            Text("\(Image(systemName: iconName)) \(placeHolder)")
                        }
                        Text(placeHolder)
                    }
                }
                .foregroundStyle(.black)
                .focused($isFieldFocused)
                .padding()
                .fontWeight(.light)
                .keyboardType(.emailAddress)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(
                            LinearGradient(
                                colors: isFieldFocused ? [
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
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TextFieldView(fieldName: "E-mail", placeHolder: "example@email.com", iconName: "envelope")
}
