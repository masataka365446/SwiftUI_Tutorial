//
//  LandmarkDetail.swift
//  SwiftUI_Tutorial
//
//  Created by 福原雅隆 on 2022/11/08.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    var body: some View {
        ScrollView{
            VStack {
                MapView(coordinate: landmark.locationCoordinate)
                //マップコンテンツを画面の上端まで拡張
                    .frame(height: 300)
                    .ignoresSafeArea(edges: .top)
                
                CircleImage(image: landmark.image)
                //垂直方向に-130
                    .offset(y: -130)
                //viewの下部から-130のパディングを指定
                    .padding(.bottom, -130)
                VStack (alignment: .leading){
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.black)
                    HStack {
                        Text(landmark.park)
                            .font(.subheadline)
                        Spacer()
                        Text(landmark.state)
                            .font(.subheadline)
                    }
                    //区切り線
                    Divider()
                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
                }.padding()
                //外側の下部にスペーサーを追加してVstack、コンテンツを画面の上部に押し込む
                Spacer()
            }
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
