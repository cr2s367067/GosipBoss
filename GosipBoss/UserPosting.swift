//
//  UserPosting.swift
//  GosipBoss
//
//  Created by Kuan on 2022/8/8.
//

import SwiftUI

struct UserPosting: View {
    
    @EnvironmentObject var appVM: AppViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Title: ")
                Spacer()
            }
            TextField("", text: $appVM.userPosting.title)
                .textFieldStyle(.roundedBorder)
                .onTapGesture {
                    appVM.userPosting.title = ""
                }
            TextEditor(text: $appVM.userPosting.texting)
                .lineSpacing(5)
                .multilineTextAlignment(.leading)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .onTapGesture {
                    appVM.userPosting.texting = ""
                }
            Spacer()
            HStack {
                Spacer()
                Button {
                    Task {
                        do {
                            try await appVM.posting(user: appVM.userPosting)
                        } catch {
                            print("Error Occure: \(error.localizedDescription)")
                        }
                    }
                } label: {
                    Text("Post")
                        .foregroundColor(.white)
                        .frame(width: AppViewModel.uiScreenWith * 0.3, height: AppViewModel.uiScreenHeight * 0.035)
                        .background(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color("buttonColor"))
                        }
                }
            }
        }
        .modifier(InitViewModifier())
    }
}

struct UserPosting_Previews: PreviewProvider {
    static var previews: some View {
        
        let appVM = AppViewModel()
        
        UserPosting()
            .environmentObject(appVM)
    }
}
