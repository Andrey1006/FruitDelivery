//
//  PlacingOrderView.swift
//  SweetBonanza1
//
//  Created by Андрей Сторожко on 14.08.2024.
//

import SwiftUI

extension Date {
    func toString(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

struct PlacingOrderView: View {
    // MARK: - Setup
    public typealias Content = PlacingOrderViewContent
    
    private var content: Content
    
    init(content: Content) {
        self.content = content
    }
    
    @State private var name: String = ""
    @State private var address: String = ""
    
    @State private var date = Date()
    let dateFormatter = DateFormatter()

    var body: some View {
        VStack(spacing: 20) {
            MainTextField(text: $name, placeholder: "NAME...")
            MainTextField(text: $address, placeholder: "ADDRESS...")
            HStack(spacing: 8) {
                Text(date.toString("dd.MM.yyy"))
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .overlay {
                        DatePicker(
                            "",
                            selection: $date,
                            displayedComponents: .date
                        )
                        .blendMode(.destinationOver)
                    }
                    .foregroundStyle(ColorPalette.buttonText.color)
                    .padding(16)
                    .background(
                        RoundedRectangle(
                            cornerSize: .init(width: 16, height: 16)
                        )
                        .foregroundStyle(Color.white)
                        .shadow(color: ColorPalette.shadowColor.color, radius: 3, x: 2, y: 4)
                    )
                    .overlay(
                        RoundedRectangle(
                            cornerSize: .init(width: 16, height: 16)
                        )
                        .stroke(.clear, lineWidth: 1)
                    )
                    .labelsHidden()
                    .datePickerStyle(.compact)
//                Spacer()
                Text(date.toString("HH:mm"))
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .overlay {
                        DatePicker(
                            "",
                            selection: $date,
                            displayedComponents: .hourAndMinute
                        )
                        .blendMode(.destinationOver)
                    }
                    .foregroundStyle(ColorPalette.buttonText.color)
                    .padding(16)
                    .background(
                        RoundedRectangle(
                            cornerSize: .init(width: 16, height: 16)
                        )
                        .foregroundStyle(Color.white)
                        .shadow(color: ColorPalette.shadowColor.color, radius: 3, x: 2, y: 4)
                    )
                    .overlay(
                        RoundedRectangle(
                            cornerSize: .init(width: 16, height: 16)
                        )
                        .stroke(.clear, lineWidth: 1)
                    )
                    .labelsHidden()
                    .datePickerStyle(.compact)
            }
            .frame(maxWidth: .infinity)
            MainButton(text: "CONFIRM", fullWidth: true, fontPalette: .sign, layout: .regular) {
                
            }
            .foregroundColor(.white)
            .padding(.bottom, 48)
        }
        .padding(.horizontal, 36)
        .background(
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
        )
    }
}

#Preview {
    PlacingOrderView(content: .init(id: "1"))
}
