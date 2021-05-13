//
//  TextEditorField.swift
//  Test1
//
//  Created by Nigel Gee on 13/05/2021.
//

import SwiftUI

public struct TextEditorField: View {
    /// Required - String for the placeholder
    let placeHolder: String
    /// Color for the border - Default to match.textFieldStyle(RoundedBorderTextFieldStyle())
    let borderColor: Color
    /// Line Width of Border - Default to match.textFieldStyle(RoundedBorderTextFieldStyle())
    let borderLine: CGFloat
    /// Place Holder Text Color - Default to match.textFieldStyle(RoundedBorderTextFieldStyle())
    let textColor: Color
    /// Color for the background of text editor - Default is .clear
    let backgroundColor: Color
    /// Required - Binding text of user input
    @Binding var text: String

    public init(_ placeHolder: String,
         borderColor: Color = Color.secondary.opacity(0.2),
         borderLine: CGFloat = 1,
         textColor: Color = Color(UIColor.placeholderText),
         backgroundColor: Color = Color.clear,
         text: Binding<String>
    ) {
        UITextView.appearance().backgroundColor = .clear
        self.placeHolder = placeHolder
        self.borderColor = borderColor
        self.borderLine = borderLine
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self._text = text
    }

    public var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(borderColor, lineWidth: borderLine)
                )

            if text.isEmpty {
                Text(placeHolder)
                    .foregroundColor(textColor)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }

            TextEditor(text: $text)
                .padding(4)
        }
    }
}

