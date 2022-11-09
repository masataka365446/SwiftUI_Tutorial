//
//  Landmark.swift
//  SwiftUI_Tutorial
//
//  Created by 福原雅隆 on 2022/11/08.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    //データから画像の名前を読み取るプロパティと、アセット カタログから画像を読み込む計算プロパティを追加します。
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    //JSONデータ構造のストレージを反映coordinatesするネストされた型を使用して、プロパティを構造に追加します。Coordinates
    private var coordinates: Coordinates
    
    //MapKit フレームワークとのやり取りに役立つプロパティを計算します。locationCoordinate
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

