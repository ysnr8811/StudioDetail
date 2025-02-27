//
//  ContentView.swift
//  StudioDetail
//
//  Created by 藤井康範 on 2025/02/27.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: String? = "HOME"
    @State private var isDrawerOpen = false

    var body: some View {
        NavigationStack {
            ZStack {
                if isDrawerOpen {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                isDrawerOpen = false
                            }
                        }
                }
                HStack(spacing: 0) {
                    if isDrawerOpen {
                        Drawer(selection: $selection, isDrawerOpen: $isDrawerOpen)
                            .transition(.move(edge: .leading))
                    }
                    VStack {
                        // switch文を削除
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .navigationBarItems(leading:
                Button(action: {
                    withAnimation {
                        isDrawerOpen.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                }
            )
            .navigationTitle(selection ?? "HOME")
            .navigationDestination(for: String.self) { value in
                switch value {
                case "HOME":
                    HomeView()
                case "ABOUT US":
                    AboutUsView()
                case "WORK":
                    WorkView()
                case "CONTACT":
                    ContactView()
                case "PRIVACY POLICY":
                    PrivacyPolicyView()
                default:
                    HomeView()
                }
            }
        }
    }
}

struct Drawer: View {
    @Binding var selection: String?
    @Binding var isDrawerOpen: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Group{
                NavigationLink(value: "HOME") {
                    Text("HOME")
                }
                NavigationLink(value: "ABOUT US") {
                    Text("ABOUT US")
                }
                NavigationLink(value: "WORK") {
                    Text("WORK")
                }
                NavigationLink(value: "CONTACT") {
                    Text("CONTACT")
                }
                NavigationLink(value: "PRIVACY POLICY") {
                    Text("PRIVACY POLICY")
                }
            }
            .padding()
            Spacer()
        }
        .frame(width: 200)
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct HomeView: View {
    var body: some View {
        Text("HOME")
    }
}

struct AboutUsView: View {
    var body: some View {
        Text("ABOUT US")
    }
}

struct WorkView: View {
    var body: some View {
        Text("WORK")
    }
}

struct ContactView: View {
    var body: some View {
        Text("CONTACT")
    }
}

struct PrivacyPolicyView: View {
    var body: some View {
        Text("PRIVACY POLICY")
    }
}
