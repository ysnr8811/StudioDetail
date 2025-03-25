//
//  ContentView.swift
//  StudioDetail
//
//  Created by 藤井康範 on 2025/02/27.
//

import SwiftUI

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
