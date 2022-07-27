//
//  ContentView.swift
//  speedmemoapp
//
//  Created by 當山寛人 on 2022/07/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            
            MemoShowVIew()
                .tabItem{
                    Image(systemName: "books.vertical")
                }
            
            TagFilterView()
                .tabItem {
                    Image(systemName: "tag")
                }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
