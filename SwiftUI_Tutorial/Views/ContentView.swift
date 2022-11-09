//
//  ContentView.swift
//  SwiftUI_Tutorial
//
//  Created by 福原雅隆 on 2022/11/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //プレビューを更新して、モデル オブジェクトを環境に追加
            .environmentObject(ModelData())
    }
}
