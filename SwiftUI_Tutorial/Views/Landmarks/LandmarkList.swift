//
//  LandmarkList.swift
//  SwiftUI_Tutorial
//
//  Created by 福原雅隆 on 2022/11/08.
//

import SwiftUI

struct LandmarkList: View {
    
    //プロパティ宣言を追加し、プレビューに修飾子を追加します。
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavoritesOnly = false
    
    //プロパティと各値をチェックして、ランドマーク リストのフィルター処理されたバージョンを計算します。
    var filteredLandmarks: [Landmark] {
        //ランドマークをフィルタリングする際のデータとして使用。
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
   LandmarkList()
            .environmentObject(ModelData())
    }
}
