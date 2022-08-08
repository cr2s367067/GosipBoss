//
//  DataModel.swift
//  GosipBoss
//
//  Created by Kuan on 2022/8/6.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct PostDM: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var texting: String
    @ServerTimestamp var postedDate: Timestamp?
}

extension PostDM {
    static let empty = PostDM(title: "Testing Title", texting: "Testing Text")
}
