//
//  Request.swift
//  SearchViewr
//
//  Created by Cloud on 30/09/2019.
//  Copyright © 2019 Cloud. All rights reserved.
//

import Foundation

private let clientID: String = "jyaF51jR8E26gvay96bG"
private let clientSecret: String = "7YnUvuMukC"
let naverAPI: String = "https://openapi.naver.com/v1/search/image.json?query="

let decoder: JSONDecoder = JSONDecoder()

func requestURL(search: String, completionHandler: @escaping (_: Image) -> Void) {
    
    let encode: String = encodingString(text: search)
    guard let url = URL(string: encode) else { return }
    
    let request: URLRequest = {
        var request: URLRequest = URLRequest(url: url)
        request.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        return request
    }()

    let session: URLSession = URLSession(configuration: .default)
    let dataTask: URLSessionDataTask = session.dataTask(with: request) { data, response, error in
        if let error = error {
            print(error.localizedDescription)
        }
        
        guard let data = data else { return }
        do {
            let apiResponse = try decoder.decode(Image.self, from: data)
            DispatchQueue.main.async {
                completionHandler(apiResponse)
            }
        } catch let decodeError {
            print(decodeError.localizedDescription)
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
