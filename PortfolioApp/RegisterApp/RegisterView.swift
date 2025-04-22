    //
    //  ContentView.swift
    //  Cadastro
    //
    //  Created by Adriano Valumin on 15/04/25.
    //

import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let age: Int

    func info() -> String {
        "\(name), \(age) anos."
    }
}

struct ContentView: View {
    @State var messageError: String? = nil
    @State var personName: String = ""
    @State var personAge: String = ""
    @State var peopleList: [Person] = []

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Register")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)

                VStack(alignment: .leading, spacing: 15) {
                    TextField("Name", text: $personName)
                        .textFieldStyle(.roundedBorder)

                    TextField("Age", text: $personAge)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                }
                .padding(.horizontal)

                Button(action: {
                    guard let age = Int(personAge), !personName.isEmpty else {
                        withAnimation(.easeInOut) {
                            messageError = "Please enter valid data."
                        }
                        return
                    }
                    withAnimation(.easeOut) {
                        messageError = nil
                    }
                    let user = Person(name: personName, age: age)
                    withAnimation {
                        peopleList.append(user)
                    }
                    personName = ""
                    personAge = ""
                }) {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal)

                if !peopleList.isEmpty {
                    Button("Delete All") {
                        withAnimation {
                            peopleList.removeAll()
                            messageError = nil
                        }
                    }
                    .foregroundColor(.red)
                    .padding(.bottom, 5)
                }

                List {
                    ForEach(peopleList) { user in
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text("\(user.age) years old")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 5)
                        .listRowBackground(Color(.systemGroupedBackground))
                    }
                    .onDelete(perform: deleteUser)
                }
                .listStyle(.plain)
                .background(Color(.systemGroupedBackground))

                if let messageError {
                    RoundedRectangle(cornerRadius: 7.0)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .foregroundStyle(.red)
                        .overlay {
                            Text(messageError)
                                .foregroundColor(.white)
                        }
                }
            }
            .padding()
        }
    }

    func deleteUser(at offsets: IndexSet) {
        withAnimation(.easeInOut) {
            peopleList.remove(atOffsets: offsets)
        }
    }
}

#Preview {
    ContentView()
}
