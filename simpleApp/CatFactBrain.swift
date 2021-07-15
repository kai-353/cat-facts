//
//  CatFactBrain.swift
//  simpleApp
//
//  Created by Alec Deumers on 15/07/2021.
//

import Foundation

class CatFactBrain {
    
    static func getFact(_ handler: @escaping (String?) -> Void) {
        let url = URL(string: "https://catfact.ninja/fact")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
                return
            }
            if let httpresponse = response as? HTTPURLResponse {
                if httpresponse.statusCode == 200 {
                    handler(decodeCatFact(data!))
                } else {
                    print(httpresponse.statusCode)
                }
            }
        }.resume()
    }
    
    private static func decodeCatFact(_ data: Data) -> String? {
        do {
            let decoder = JSONDecoder()
            let catFact = try decoder.decode(CatFact.self, from: data)
            return catFact.fact
        } catch {
            print(error)
            return nil
        }
    }
}
