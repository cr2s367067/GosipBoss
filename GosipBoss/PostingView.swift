//
//  PostingView.swift
//  GosipBoss
//
//  Created by Kuan on 2022/8/7.
//

import SwiftUI

struct PostingView: View {
    
    var postedData: PostDM
    
    var body: some View {
        VStack {
            Text(postedData.title)
            HStack {
                Spacer()
                Text(postedData.postedDate?.dateValue() ?? Date(), format: Date.FormatStyle().year().month().day())
            }
            Text(postedData.texting)
        }
        .modifier(InitViewModifier())
    }
}

struct PostingView_Previews: PreviewProvider {
    static var previews: some View {
        PostingView(postedData: .empty)
    }
}
