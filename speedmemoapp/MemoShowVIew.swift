//
//  MemoShowVIew.swift
//  speedmemoapp
//
//  Created by 當山寛人 on 2022/07/06.
//

import SwiftUI
import RealmSwift


extension View {
  func navigationBarTitle<Content>(
    @ViewBuilder content: () -> Content
  ) -> some View where Content : View {
    self.toolbar {
      ToolbarItem(placement: .principal, content: content)
    }
  }
}

struct MemoShowVIew: View {
    @ObservedResults(QWord.self) var qwords
    @State var isShowMemoAddView = false
    @State var isShowMemoEditView = false
    
    @State var selectedQword : QWord = QWord(wordName: "")
    
    var body: some View {
        
        VStack{
            NavigationView {
                List{
                    ForEach(qwords){ qword in
                        HStack{
                            VStack(alignment: .leading){
                                Text(qword.wordName)
                                    .font(.headline)
                                Text(qword.meaning)
                            }
                            .onTapGesture {
                                isShowMemoEditView = true
                                selectedQword = qword
                            }
                            .sheet(isPresented: $isShowMemoEditView){
                                MemoEditView(qword: $selectedQword)
                            }
                            
                            
                            Spacer()
                            HStack{
                                
                                Image(systemName: "tag")
                                    
                                if qword.tagName != ""{
                                    Text(qword.tagName).font(.footnote)
                                }
                            }
                            Image(systemName: qword.isUnderstood ? "checkmark.square" : "questionmark.square.dashed")
                        }
                        .contextMenu(menuItems:{
                            Button(action: {
                                //削除する
                                let deleteQword = qword.thaw()!
                                let realm = try! Realm()
                                try! realm.write{
                                    realm.delete(deleteQword)
                                }
                                
                            }, label: {
                                Text("削除")
                            })
                        })
                    }
                }
                .listStyle(InsetListStyle())
                .navigationBarTitle{
                    Image(systemName: "books.vertical")
                    
                }
                
            }
        
            Button(action: {
                isShowMemoAddView = true
            }, label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)
                    
            })
            .sheet(isPresented: $isShowMemoAddView) {
                MemoAddView()
            }
            
        }
        
    }
}

//
//struct MemoShowVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        MemoShowVIew()
//    }
//}

