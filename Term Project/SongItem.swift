//
//  SongItem.swift
//  Term Project
//
//  Created by Yatin Singla on 5/7/20.
//  Copyright © 2020 Washington State University. All rights reserved.
//

import Foundation

class SongItem {
    var Title: String!
    var ArtistName: String!
    var Album: String!
    
    init(Title: String, Artist: String, Album: String) {
        self.Title = Title
        self.ArtistName = Artist
        self.Album = Album
    }
}
