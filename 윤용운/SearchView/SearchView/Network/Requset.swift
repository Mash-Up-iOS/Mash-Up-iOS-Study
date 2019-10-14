//
//  Requset.swift
//  SearchView
//
//  Created by Cloud on 2019/10/14.
//  Copyright © 2019 Cloud. All rights reserved.
//

import Foundation

private let clientID: String = "jyaF51jR8E26gvay96bG"
private let clientSecret: String = "7YnUvuMukC"
let naverAPI: String = "https://openapi.naver.com/v1/search/image.json?query="

func requestURL(search: String, completionHandler: @escaping (_ : Item) -> Void) {
    
    let encode: String = encodingString(text: search)
    guard let url = URL(string: encode) else { return }
    
    let request: URLRequest = {
        var request: URLRequest = URLRequest(url: url)
        request.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        return request
    }()
    
    let session: URLSession = URLSession(configuration: .default)
    let dataTask: URLSessionDataTask = session.dataTask(with: request) { data, _, _ in
        guard let data = data else { return }
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            if let result = json["items"] as? [[String: Any]] {
                // 혹시 이 부분을 더 간결하게 만들 수 있을까요?
                for detail in result {
                    let item = Item(json: detail)
                    DispatchQueue.main.async {
                        completionHandler(item)
                    }
                 }
                // 포문을요.
            }
        }
    }
    dataTask.resume()
}

func encodingString(text: String) -> String {
    let addQuery: String = naverAPI + text
    let encoded: String? = addQuery.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
    guard let encode = encoded else { return ""}
    return encode
}
