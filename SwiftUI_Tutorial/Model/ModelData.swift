//
//  ModelData.swift
//  SwiftUI_Tutorial
//
//  Created by 福原雅隆 on 2022/11/08.
//

import Foundation

//から初期化するランドマークの配列を作成します。landmarkData.json
var landmarks: [Landmark] = load("landmarkData.json")

//load(_:)アプリのメイン バンドルから特定の名前の JSON データをフェッチするメソッドを作成します。
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
