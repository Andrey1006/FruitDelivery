//
//  ProductDetailsView.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import SwiftUI

struct ProductDetailsScreen: View {
    // MARK: - Setup
    private var viewModel: ProductDetailsViewModel
    
    init(viewModel: ProductDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Image(viewModel.image)
                .resizable()
                .scaledToFit()
                .frame(width: 260, height: 260)
                .padding(12)
                .background(
                    Circle()
                        .fill(Color.init(uiColor: .init(red: 254, green: 248, blue: 234, alpha: 1)).opacity(0.5))
                )
            VStack(spacing: 8) {
                HStack(spacing: 8) {
                    Text(viewModel.title)
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity)
//                    Image(systemName: content.isFavorite ? "heart" : "heart.fill")
//                        .onTapGesture {
//                            
//                        }
                }
                .padding(.top, 16)
                Text(viewModel.price)
                
                MainButton(text: "ORDER", fullWidth: true, fontPalette: .search, layout: .logOut) {
                    
                }
                .padding(.vertical, 8)
                
                Text(viewModel.description)
                    .padding(.horizontal, 36)
                    .padding(.bottom, 24)
            }
            .padding(.horizontal, 36)
            .background(Color.init(uiColor: .init(red: 254, green: 248, blue: 234, alpha: 1)))
            .cornerRadius(24, corners: [.topLeft, .topRight])
            .ignoresSafeArea()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
        )
    }
}

#Preview {
    ProductDetailsScreen(viewModel: .init(id: "1", title: "APPLE", image: "apple", price: "1234", isFavorite: false, description: "fjsjfdslhfjskdhshdfkhgkdfhgkjfshgskhgkfjfdsksjkfdsjklfdjsjlkdjkfsghsfdghkdssghgkjfdfjsjfdslhfjskdhshdfkhgkdfhgkjfshgskhgkfjfdsksjkfdsjklfdjsjlkdjkfsghsfdghkdssghgkjfdfjsjfdslhfjskdhshdfkhgkdfhgkjfshgskhgkfjfdsksjkfdsjklfdjsjlkdjkfsghsfdghkdssghgkjfdfjsjfdslhfjskdhshdfkhgkdfhgkjfshgskhgkfjfdsksjkfdsjklfdjsjlkdjkfsghsfdghkdssghgkjfdfjsjfdslhfjskdhshdfkhgkdfhgkjfshgskhgkfjfdsksjkfdsjklfdjsjlkdjkfsghsfdghkdssghgkjfd"))
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
