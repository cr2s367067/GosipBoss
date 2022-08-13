//
//  NoticeAndAccessView.swift
//  GosipBoss
//
//  Created by Kuan on 2022/8/13.
//

import SwiftUI

struct NoticeAndAccessView: View {
    
    @EnvironmentObject var appVM: AppViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 20) {
                Spacer()
                Image("noticeImage")
                    .resizable()
                    .frame(width: AppViewModel.uiScreenWith * 0.1, height: AppViewModel.uiScreenHeight * 0.05)
                noticeMessage()
            }
            Button {
                Task {
                    do {
                        try await appVM.accessAsAnonymous()
                    } catch {
                        print("some error occur: \(error.localizedDescription)")
                    }
                }
            } label: {
                Text("Start by Anonymouns")
                    .foregroundColor(.white)
                    .frame(width: AppViewModel.uiScreenWith * 0.5, height: AppViewModel.uiScreenHeight * 0.05)
                    .background(alignment: .center) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("buttonColor"))
                    }
            }
        }
        .modifier(InitViewModifier())
    }
}

struct NoticeAndAccessView_Previews: PreviewProvider {
    
    static var previews: some View {
        let appVM = AppViewModel()
        NoticeAndAccessView()
            .environmentObject(appVM)
    }
}


extension NoticeAndAccessView {
    
    @ViewBuilder
    func noticeMessage() -> some View {
        VStack {
            noticeMessageRow(contain: "1. 請勿人生攻擊")
            noticeMessageRow(contain: "2. 請勿洩露個資")
            noticeMessageRow(contain: "以上言論不代表平台立場")
        }
    }
    
    @ViewBuilder
    func noticeMessageRow(contain: String) -> some View {
        HStack(spacing: 10) {
            Text(contain)
                .font(.title3)
            Spacer()
        }
    }
    
}
