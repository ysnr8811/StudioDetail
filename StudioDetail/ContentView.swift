//
//  ContentView.swift
//  StudioDetail
//
//  Created by 藤井康範 on 2025/02/27.
//

import SwiftUI

// メインのContentView構造体
struct ContentView: View {
    @State private var selection: String? = "HOME" // 現在選択されているナビゲーション項目を追跡
    @State private var isDrawerOpen = false // ドロワーが開いているか閉じているかを追跡

    var body: some View {
        NavigationStack { // ナビゲーションを管理するためのNavigationStack
            ZStack { // ドロワーとコンテンツを重ねるためのZStack
                if isDrawerOpen {
                    // ドロワーが開いているときの背景を暗くする
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all) // 画面全体を覆う
                        .onTapGesture {
                            // 背景をタップするとドロワーを閉じる
                            withAnimation {
                                isDrawerOpen = false
                            }
                        }
                }
                HStack(spacing: 0) {
                    if isDrawerOpen {
                        // ドロワービュー（スライドインのトランジション付き）
                        Drawer(selection: $selection, isDrawerOpen: $isDrawerOpen)
                            .transition(.move(edge: .leading)) // 左からスライドイン
                    }
                    VStack {
                        // メインコンテンツエリア（現在は空）
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // 利用可能なスペースを埋める
                }
            }
            .toolbar {
                // ツールバーにドロワーを開閉するボタンを追加
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // ボタンを押すとドロワーを開閉
                        withAnimation {
                            isDrawerOpen.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3") // ハンバーガーメニューアイコン
                    }
                }
            }
            .navigationTitle(selection ?? "HOME") // 現在の選択に基づいてタイトルを設定
            .navigationDestination(for: String.self) { value in
                // 選択された項目に応じてビューを切り替える
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

// ドロワービュー
struct Drawer: View {
    @Binding var selection: String? // 選択されたナビゲーション項目
    @Binding var isDrawerOpen: Bool // ドロワーの開閉状態

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                // 各ナビゲーションリンク
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
            .padding() // 各リンクにパディングを追加
            Spacer() // 下部にスペースを追加
        }
        .frame(width: 200) // ドロワーの幅を設定
        .background(Color(.systemGray6)) // 背景色を設定
        .edgesIgnoringSafeArea(.bottom) // 下部の安全領域を無視
    }
}

// 各ビューの定義
struct HomeView: View {
    var body: some View {
        Text("HOME") // HOMEビューの内容
    }
}

struct AboutUsView: View {
    var body: some View {
        Text("ABOUT US") // ABOUT USビューの内容
    }
}

struct WorkView: View {
    var body: some View {
        Text("WORK") // WORKビューの内容
    }
}

struct ContactView: View {
    var body: some View {
        Text("CONTACT") // CONTACTビューの内容
    }
}

struct PrivacyPolicyView: View {
    var body: some View {
        Text("PRIVACY POLICY") // PRIVACY POLICYビューの内容
    }
}
