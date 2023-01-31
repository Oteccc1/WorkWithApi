//
//  ContentView.swift
//  postsApi
//
//  Created by MacOS on 22.10.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = viewModel()
    var body: some View {
        ScrollView{
            
            ForEach(model.MainPost, id: \.self){ index in
                VStack(alignment: .leading, spacing: 5){
                    Text("Id: \(index.id)")
                        .lineLimit(1)
                    Text("Title: \(index.title)")
                        .lineLimit(1)
                    Text("Text of post: \(index.body)")
                        .lineLimit(2)
                    
                    
                    
                }.padding(20)
            }
        }
    }
    init(){
        model.getData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
