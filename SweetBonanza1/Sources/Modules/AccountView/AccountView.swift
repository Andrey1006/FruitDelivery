//
//  AccountView.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import SwiftUI
import WebKit

struct AccountView: View {
    // MARK: - Setup
    public typealias Content = AccountViewContent
    
    private var content: Content
    private var action: (() -> Void)?
    
    @State private var isPresentWebView = false
    
    init(content: Content, action: (() -> Void)? = nil) {
        self.content = content
        self.action = action
    }
    
    var body: some View {
        contentView
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)
            .background(
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
            )
    }
    
    var contentView: some View {
        VStack() {
            HStack(spacing: 24) {
                Image(content.image)
                    .frame(width: 100, height: 100)
                VStack(alignment: .leading, spacing: 24) {
                    CounterView(text: "NAME...", layout: .main)
                    CounterView(text: "EMAIL...", layout: .main)
                }
            }
            .padding(.top, 128)
            Spacer()
            VStack(spacing: 24) {
                Button(action: {
                    isPresentWebView = true
                }, label: {
                    Text("PRIVACY POLYCY")
                        .bold()
                        .foregroundStyle(.white)
                })
                .sheet(isPresented: $isPresentWebView) {
                    NavigationStack {
                        // 3
                        WebView(url: URL(string: "https://sites.google.com/view/qrcodescannerforiphone/privacy-policy")!)
                            .ignoresSafeArea()
                            .navigationTitle("Sarunw")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }
                MainButton(text: "LOG OUT", fullWidth: true, fontPalette: .hThree, layout: .logOut) {
                    print("Выйти из аккаунтa")
                }
                Button(action: {
                    print("Удалить аккаунт")
                }, label: {
                    Text("DELETE ACCOUNT")
                        .foregroundStyle(.white)
                        .bold()
                })
            }
            .padding(.bottom, 16)
        }
        .padding(.horizontal, 32)
        .padding(.bottom, 32)
    }
}
    

#Preview {
    AccountView(content: .init(id: "1", image: "orange", name: "Kukulaku", email: "xz@gmail.com")) {
        print("OnboardingView")
    }
}

struct WebView: UIViewRepresentable {
    // 1
    let url: URL

    
    // 2
    func makeUIView(context: Context) -> WKWebView {

        return WKWebView()
    }
    
    // 3
    func updateUIView(_ webView: WKWebView, context: Context) {

        let request = URLRequest(url: url)
        webView.load(request)
    }
}
