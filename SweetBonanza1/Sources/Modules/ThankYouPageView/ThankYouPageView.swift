//
//  ThankYouPageView.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import SwiftUI

struct ThankYouPageView: View {
    // MARK: - Setup
    public typealias Content = ThankYouPageViewContent
    
    private var content: Content
    
    init(content: Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Image(content.image)
                .resizable()
                .background(.yellow)
                .frame(width: 200, height: 200)
            Text(content.title)
                .bold()
                .font(.title)
                .foregroundStyle(.white)
                .frame(alignment: .center)
            MainButton(text: "OK", fullWidth: false, fontPalette: .sign, layout: .sign) {
                print("OK")
            }

        }
        .padding(.horizontal, 48)
        .background(
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
        )
    }
}

#Preview {
    ThankYouPageView(content: .init(id: "1", image: "apple", title: "THANK YOU FOR ORDERING"))
}
