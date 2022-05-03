//
//  GiftDetailView.swift
//  Tif
//
//  Created by ICHAN NAM on 2022/05/03.
//

import SwiftUI

struct GiftDetailView: View {
    let gift: Gift
    
    var body: some View {
        VStack(spacing: 32) {
            VStack(spacing: 8) {
                HStack {
                    Text(gift.what!)
                        .font(.title)
                        .foregroundColor(Color("YellowSun"))
                    Spacer()
                }
                HStack {
                    Text("이/가 인상적인 사람 👍")
                        .font(.title2)
                        .foregroundColor(Color("LiteSlate"))
                    Spacer()
                }
            }
            
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    Text(gift.when!, formatter: dateFormatter)
                }
                HStack(spacing: 4) {
                    Spacer()
                    Text(gift.place!)
                    Text("에서")
                        .foregroundColor(Color("LiteSlate"))
                }
            }
            
            Spacer()
        }
        .navigationTitle(gift.who!)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    Text("수정")
                } label: {
                    Text("수정")
                }
            }
        }
        .padding(EdgeInsets(top: 32, leading: 16, bottom: 16, trailing: 16))
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy년 MM월 dd일"
    return formatter
}()

/*
struct GiftDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GiftDetailView()
    }
}
 */
