//
//  WritingInputView.swift
//  Tif
//
//  Created by ICHAN NAM on 2022/04/28.
//

import SwiftUI

struct WritingInputView: View {
    let placeholder: String
    var binding: Binding<String>
    let placeholderFont: Font
    let following: String
    let followingFont: Font
    
    var body: some View {
        HStack(spacing: 4.0) {
            TextField(placeholder, text: binding)
                .font(placeholderFont)
                .fixedSize()
                .foregroundColor(Color("YellowSun"))
            Text(following)
                .font(followingFont)
        }
    }
}

struct WritingInputView_Previews: PreviewProvider {
    var tmp: String
    
    static var previews: some View {
        WritingInputView(placeholder: "누구", binding: .constant(""), placeholderFont: .title, following: "의", followingFont: .title2)
    }
}
