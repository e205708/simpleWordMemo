//
//  MemoEditView.swift
//  speedmemoapp
//
//  Created by 當山寛人 on 2022/07/19.
//

import SwiftUI
import RealmSwift

struct MemoEditView: View {
    @Binding var qword : QWord
    
    @State private var textBox : String = "" //単語の意味が入る
    @State private var tagBox : String = "" //タグ名が入る
    @State private var showNoValueSignal : Bool = true
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            HStack{
                
                Image(systemName: "text.bubble")
                TextField("",text:$textBox,onEditingChanged: {_ in 
                    //改行をした時に呼ばれる
                    if textBox == ""{
                        showNoValueSignal = true
                    }
                    else{
                        showNoValueSignal = false
                    }
                })
                
                //空白ならバッテンを表示
                Image(systemName: showNoValueSignal ?  "xmark.circle": "checkmark.circle")
            
            }
            .padding()
                
            
            
            HStack{
                Image(systemName: "tag")
                TextField("",text:$tagBox)
            }
            .padding()
            
            Button(action: {
                if textBox != ""{
                    let tmpQword = qword.thaw()
                    let realm = try! Realm()
                    try! realm.write {
                        tmpQword?.meaning = textBox
                        tmpQword?.isUnderstood = true
                        
                        if tagBox != ""{
                            tmpQword?.tagName = tagBox
                        }
                    }
                    
                    dismiss()
                }
                
            }, label: {
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
            })
            
        }
    }
}


//
//struct MemoEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        MemoEditView()
//    }
//}
