//
//  CustomButton.swift
//  Kel5Mini1
//
//  Created by Jonathan Heriyanto on 28/04/23.
//

import SwiftUI

struct BorderButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Font.custom("Fredoka-Medium", size: 16))
            .padding()
            .frame(height: 44)
            .background(configuration.isPressed ? Color("Secondary") : Color(.white))
            .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(configuration.isPressed ? Color("Secondary") : Color("Secondary"))
                    )
            .cornerRadius(6)
            .foregroundColor(configuration.isPressed ? Color(.white) : Color("Secondary"))
    }
}

struct FillButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Font.custom("Fredoka-Medium", size: 16))
            .padding()
            .frame(height: 44)
            .background(configuration.isPressed ? Color("SO-600") : Color("Secondary"))
            .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(configuration.isPressed ? Color("SO-600") : Color("Secondary"))
                    )
            .cornerRadius(6)
            .foregroundColor(configuration.isPressed ? Color(.white) : Color(.white))
    }
}
