//
//  MemoShowVIew.swift
//  speedmemoapp
//
//  Created by 當山寛人 on 2022/07/06.
//

import SwiftUI
import RealmSwift

struct MemoShowVIew: View {
    
    var memos : [String] = ["プルアップ抵抗","Adesivo","アセトン"]
    var body: some View {
        
        NavigationView {
            List{
                ForEach(memos,id:\.self){ memo in
                    HStack{
                        VStack(alignment: .leading){
                            Text(memo)
                                .font(.headline)
                            Text("未登録")
                        }
                        
                        Spacer()
                        Image(systemName: "questionmark.square.dashed")
                    }
                }
            }
            
            .listStyle(InsetListStyle())
            .navigationTitle(Text("単語一覧"))
        }
        
        
    }
}

struct MemoShowVIew_Previews: PreviewProvider {
    static var previews: some View {
        MemoShowVIew()
    }
}
