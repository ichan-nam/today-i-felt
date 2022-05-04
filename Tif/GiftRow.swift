//
//  GiftRow.swift
//  Tif
//
//  Created by ICHAN NAM on 2022/05/02.
//

import SwiftUI

struct GiftRow: View {
    @ObservedObject var gift: Gift
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let who = gift.who, let what = gift.what {
                Text(who)
                    .font(.headline)
                    .foregroundColor(Color("AccentColor"))
                Text(what)
                    .foregroundColor(Color("LiteSlate"))
            }
        }
        .padding(.vertical, 8)
    }
}

/*
struct GiftRow_Previews: PreviewProvider {
    GiftRow()
}
 */
