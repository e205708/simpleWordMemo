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
            
            HStack{
                Image(systemName: "text.book.closed")
                TextField(text: $inputText){
                    
                }
            }
            
            Button(action: {
                $qwords.append(QWord(wordName: inputText))
                dismiss()
            }, label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red)
            })
        }
        
        
    }
}

struct MemoAddView_Previews: PreviewProvider {
    static var previews: some View {
        MemoAddView()
    }
}
