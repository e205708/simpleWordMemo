//
//  MemoShowVIew.swift
//  speedmemoapp
//
//  Created by 當山寛人 on 2022/07/06.
//

import SwiftUI
import RealmSwift

struct MemoShowVIew: View {
    @ObservedResults(QWord.self) var qwords
    @State var isShowMemoAddView = false
    @State var isShowMemoEditView = false
    
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
                            }
                            .sheet(isPresented: $isShowMemoEditView){
                                MemoEditView(qword: qword)
                            }
                            
                            
                            Spacer()
                            Image(systemName: "questionmark.square.dashed")
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
                .navigationTitle(Text("単語一覧"))
            }
        
            Button(action: {
                isShowMemoAddView = true
            }, label: {
                Text("単語の追加")
            })
            .sheet(isPresented: $isShowMemoAddView) {
                MemoAddView()
            }
            
        }
        
    }
}

struct MemoShowVIew_Previews: PreviewProvider {
    static var previews: some View {
        MemoShowVIew()
    }
}

