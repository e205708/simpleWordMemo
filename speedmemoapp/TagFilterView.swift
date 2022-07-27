//
//  TagFilterView.swift
//  speedmemoapp
//
//  Created by 當山寛人 on 2022/07/27.
//

import SwiftUI
import RealmSwift



struct TagFilterView: View {
    
    @State private var selectedTag: String = "All"
    @ObservedResults(QWord.self) var qwords
    var body: some View {
        
        
        
        
        VStack{
            
            Picker(selection: $selectedTag, label: Text("tag")){
                Image(systemName: "tag").tag("All")
                
                let haveDistinctValueQwords = qwords.distinct(by: ["tagName"])
                
                ForEach(haveDistinctValueQwords){ fQword in
                    Text("\(fQword.tagName)").tag(fQword.tagName)
                }
                
                
            }
            .padding(10)
            
            List{
                if selectedTag != "All"{
                    let selectedQwords = qwords.filter(NSPredicate(format: "tagName == %@", selectedTag))
                    ForEach(selectedQwords){ qword in
                        VStack(alignment: .leading){
                            Text(qword.wordName)
                                .font(.headline)
                            Text(qword.meaning)
                        }
                    }
                }
                else {
                    ForEach(qwords){ qword in
                        VStack(alignment: .leading){
                            Text(qword.wordName)
                                .font(.headline)
                            Text(qword.meaning)
                        }
                    }
                }
                
            }
            .listStyle(InsetListStyle())
            
            
            
            
        }
        //.onAppear{haveDistinctValueQwords = try! Realm().objects(QWord.self).distinct(by: ["tagName"])}
        
    }
    
}

struct TagFilterView_Previews: PreviewProvider {
    static var previews: some View {
        TagFilterView()
    }
}
