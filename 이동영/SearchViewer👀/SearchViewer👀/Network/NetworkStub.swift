//
//  ImageSearchService.swift
//  SearchViewer👀
//
//  Created by 이동영 on 28/09/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import Foundation
import UIKit

class NetworkStub: NetworkType {
    
    // MARK: Properties
    static let shared = {
        return NetworkStub()
    }
    
    // MARK: Methods
    func request(query: String = "", completion: @escaping (Result<Data, Error>) -> Void) {
        completion(.success(Dummy.data))
    }
    
    func fetchImage(url: URL = URL(string: "www.naver.com")!, completion: @escaping (Result<UIImage, Error>) -> Void) {
        DispatchQueue.global().async {
            sleep(UInt32(Int.random(in: 0...5)))
            DispatchQueue.main.async {
                completion(.success(Dummy.image))
            }
        }
        
    }
    
}

// MARK: - Dummy
struct Dummy {
    static let image = UIImage(named: "dummy")!
    static let data = """
    {
    "lastBuildDate": "Sat, 28 Sep 2019 03:53:29 +0900",
    "total": 2046648,
    "start": 1,
    "display": 10,
    "items": [
    {
    "title": "고양이가 할퀸 상처로 박테리아 감염 될 수 있다",
    "link": "http://post.phinf.naver.net/MjAxODExMjBfMSAg/MDAxNTQyNjc4Mjk4NTAz.9BKZngt0hN06AuQOxoBSFlkuRhdT5MRFw5xjf3K0veog.T4ne-2gSMqKmWzqvXrFAfXzQRNkR3_t23ohTywgEgpwg.JPEG/IhkxM0h1R_pD5_w_fQnKZ7hxf3ak.jpg",
    "thumbnail": "https://search.pstatic.net/common/?src=http://post.phinf.naver.net/MjAxODExMjBfMSAg/MDAxNTQyNjc4Mjk4NTAz.9BKZngt0hN06AuQOxoBSFlkuRhdT5MRFw5xjf3K0veog.T4ne-2gSMqKmWzqvXrFAfXzQRNkR3_t23ohTywgEgpwg.JPEG/IhkxM0h1R_pD5_w_fQnKZ7hxf3ak.jpg&type=b150",
    "sizeheight": "600",
    "sizewidth": "800"

    },
    {
    "title": "무라카미 하루키의 에세이, 무라카미 라디오",
    "link": "http://imgnews.naver.net/image/5585/2019/04/16/0000019325_004_20190416171424294.jpg",
    "thumbnail": "https://search.pstatic.net/common/?src=http://imgnews.naver.net/image/5585/2019/04/16/0000019325_004_20190416171424294.jpg&type=b150",
    "sizeheight": "553",
    "sizewidth": "750"

    },
    {
    "title": "고양이 품종이야기 열일곱번째 노르웨이 숲",
    "link": "http://post.phinf.naver.net/20160808_256/1470636912902VWqg7_JPEG/IfFJl8op5nAtjrdAXvRCsRrdQSXI.jpg",
    "thumbnail": "https://search.pstatic.net/common/?src=http://post.phinf.naver.net/20160808_256/1470636912902VWqg7_JPEG/IfFJl8op5nAtjrdAXvRCsRrdQSXI.jpg&type=b150",
    "sizeheight": "444",
    "sizewidth": "640"

    },
    {
    "title": "우리가 생각하는 고양이 VS 실제 고양이",
    "link": "http://imgnews.naver.net/image/5407/2016/07/07/0000002325_001_20170707211650039.jpg",
    "thumbnail": "https://search.pstatic.net/common/?src=http://imgnews.naver.net/image/5407/2016/07/07/0000002325_001_20170707211650039.jpg&type=b150",
    "sizeheight": "384",
    "sizewidth": "540"

    },
    {
    "title": "왜 고양이는 쌀쌀맞을까요?",
    "link": "http://imgnews.naver.net/image/5407/2016/05/01/0000001801_002_20180504183834060.jpg",
    "thumbnail": "https://search.pstatic.net/common/?src=http://imgnews.naver.net/image/5407/2016/05/01/0000001801_002_20180504183834060.jpg&type=b150",
    "sizeheight": "674",
    "sizewidth": "540"

    },
    {
    "title": "왜 거의 모든 포유동물들은 예쁘게 생긴걸까요??(특히, 아가때)",
    "link": "http://kinimage.naver.net/20120411_53/1334141109594tSwaJ_JPEG/%BB%F5%B3%A2%B0%AD%BE%C6%C1%F66.jpg",
    "thumbnail": "https://search.pstatic.net/common/?src=http://kinimage.naver.net/20120411_53/1334141109594tSwaJ_JPEG/%BB%F5%B3%A2%B0%AD%BE%C6%C1%F66.jpg&type=b150",
    "sizeheight": "404",
    "sizewidth": "546"

    },
    {
    "title": "장기동동물병원 | 고양이 출산 후 주의사항은?",
    "link": "http://post.phinf.naver.net/MjAxODA3MDRfMTE3/MDAxNTMwNjc4Mzc4MjU0.JYIsL-QzPjWB8k_sqBe-A09n6d5Q2Ab_aKmfOOJZwq0g.U5-HOtPSGkZY0WvU3iI8P2v8O0QzRORKjjNCLtbUimcg.JPEG/IG9Jmvlgi7KacHyFkDAeLuFF0Hss.jpg",
    "thumbnail": "https://search.pstatic.net/common/?src=http://post.phinf.naver.net/MjAxODA3MDRfMTE3/MDAxNTMwNjc4Mzc4MjU0.JYIsL-QzPjWB8k_sqBe-A09n6d5Q2Ab_aKmfOOJZwq0g.U5-HOtPSGkZY0WvU3iI8P2v8O0QzRORKjjNCLtbUimcg.JPEG/IG9Jmvlgi7KacHyFkDAeLuFF0Hss.jpg&type=b150",
    "sizeheight": "800",
    "sizewidth": "1280"

    },
    {
    "title": "요괴취급 받던 냥이가 헬로키티가 되기까지",
    "link": "http://post.phinf.naver.net/MjAxODA4MTdfMTY2/MDAxNTM0NDY2ODA2ODkw.HLx75xAWq4I4Ix-sfB7lRMEgzogaIFi94JUVhjLPz7Eg.p-nkgLR83k5eTTjhINJEf5znDE-DM96MOgdk2hU20kEg.JPEG/IRJNpIoZKM2E0gN-qxlau6SFMK3M.jpg",
    "thumbnail": "https://search.pstatic.net/common/?src=http://post.phinf.naver.net/MjAxODA4MTdfMTY2/MDAxNTM0NDY2ODA2ODkw.HLx75xAWq4I4Ix-sfB7lRMEgzogaIFi94JUVhjLPz7Eg.p-nkgLR83k5eTTjhINJEf5znDE-DM96MOgdk2hU20kEg.JPEG/IRJNpIoZKM2E0gN-qxlau6SFMK3M.jpg&type=b150",
    "sizeheight": "960",
    "sizewidth": "1280"

    },
    {
    "title": "GOOD GOOD…영화 '구구는 고양이다'",
    "link": "http://imgnews.naver.net/image/5222/2016/07/25/22304_69163_654_99_20160725172406.jpg",
    "thumbnail": "https://search.pstatic.net/common/?src=http://imgnews.naver.net/image/5222/2016/07/25/22304_69163_654_99_20160725172406.jpg&type=b150",
    "sizeheight": "400",
    "sizewidth": "600"

    },
    {
    "title": "고양이 감기 증상 및 대처방법",
    "link": "http://post.phinf.naver.net/MjAxOTA5MjZfMTAy/MDAxNTY5NDg0MjE4NjQ1.iRkf9LQh4tkz9MOTUkHThpy4h-vfl_5XQ35C8UeRwJ4g.q1_KFzhhTo66Zowbfm6u7rWvB4Pm1qzwpgAnZ_b30Vog.JPEG/IShew3Q73GbAU8bx_ZCApJgulXX8.jpg",
    "thumbnail": "https://search.pstatic.net/common/?src=http://post.phinf.naver.net/MjAxOTA5MjZfMTAy/MDAxNTY5NDg0MjE4NjQ1.iRkf9LQh4tkz9MOTUkHThpy4h-vfl_5XQ35C8UeRwJ4g.q1_KFzhhTo66Zowbfm6u7rWvB4Pm1qzwpgAnZ_b30Vog.JPEG/IShew3Q73GbAU8bx_ZCApJgulXX8.jpg&type=b150",
    "sizeheight": "540",
    "sizewidth": "960"

    }
    ]
    }
    """.data(using: .utf8)!
}
