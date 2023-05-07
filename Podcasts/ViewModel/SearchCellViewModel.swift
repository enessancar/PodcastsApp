//
//  SearchCellViewModel.swift
//  Podcasts
//
//  Created by Enes Sancar on 6.05.2023.
//

import Foundation

struct SearchCellViewModel {
    let result: Result
    
    init(result: Result) {
        self.result = result
    }
    
    var trackName: String? {
        return result.trackName
    }
    
    var artistName: String? {
        return result.artistName
    }
    
    var podcastImage: URL? {
        return URL(string: result.artworkUrl100)
    }
}
