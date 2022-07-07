//
//  MemoAddView.swift
//  speedmemoapp
//
//  Created by 當山寛人 on 2022/07/07.
//

import SwiftUI
import RealmSwift


struct MemoAddView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedResults(QWord.self) var qwords
    @State var inputText: String = ""
    var body: some View {
        
        VStack{
            TextField(text: $inputText){
                Text("入力")
            }
            
            Button(action: {
                $qwords.append(QWord(wordName: inputText))
                dismiss()
            }, label: {
                Text("追加")
            })
        }
        
        
    }
}

struct MemoAddView_Previews: PreviewProvider {
    static var previews: some View {
        MemoAddView()
    }
}
