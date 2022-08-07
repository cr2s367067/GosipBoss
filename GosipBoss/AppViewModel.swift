//
//  AppViewModel.swift
//  GosipBoss
//
//  Created by Kuan on 2022/8/6.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

class AppViewModel: ObservableObject {
    
    static let uiScreenWith = UIScreen.main.bounds.width
    static let uiScreenHeight = UIScreen.main.bounds.height
    
    @Published var userPosting: PostDM = .empty
    @Published var postSet = [PostDM]()
    
    @Published var showPostingView = false
    
    let db = Firestore.firestore()
    
    func posting(user posting: PostDM) async throws {
        let postRef = db.collection("Posts")
        _ = try await postRef.addDocument(data: [
            "title" : posting.title,
            "texting" : posting.texting,
            "postedDate": Date()
        ])
    }
    
    func fetchPost() async throws {
        let postRef = db.collection("Posts")
        let document = try await postRef.getDocuments().documents
        postSet = document.compactMap { queryDocumentSnapshot in
            let result = Result {
                try queryDocumentSnapshot.data(as: PostDM.self)
            }
            switch result {
            case .success(let data):
                return data
            case .failure(let error):
                print(error.localizedDescription)
            }
            return nil
        }
    }
}


struct InitViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(alignment: .center) {
                Rectangle()
                    .fill(Color("viewBackground"))
                    .edgesIgnoringSafeArea([.top, .bottom])
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
    }
}

