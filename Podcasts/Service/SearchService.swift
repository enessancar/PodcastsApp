//
//  SearchService.swift
//  Podcasts
//
//  Created by Enes Sancar on 6.05.2023.
//

import Foundation
import Alamofire

struct SearchService {
    
    static func fetchData(searchText term: String,
                          completion: @escaping([Result]) -> Void) {
        
        let baseURL = "https://itunes.apple.com/search"
        let parameters = ["entity": "podcast", "term": term]
        
        AF.request(baseURL, method: .get, parameters: parameters).responseData { responseData in
            
            if let error = responseData.error {
                print(error.localizedDescription)
            }
            guard let data = responseData.data else {
                return
            }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
