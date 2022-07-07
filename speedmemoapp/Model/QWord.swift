//
//  QWord.swift
//  speedmemoapp
//
//  Created by 當山寛人 on 2022/07/07.
//

import Foundation
import RealmSwift

class QWord: Object,ObjectKeyIdentifiable {
    @Persisted var wordName: String //追加したワード
    @Persisted var addedDate: Date = Date()
    @Persisted var isUnderstood: Bool  = false//理解済みかそうでないか
    @Persisted var meaning: String  = "未登録"//ワードの意味
    @Persisted(primaryKey: true) var _id: ObjectId
    
    
    convenience init(wordName: String) {
        self.init()
        self.wordName = wordName
    }
}