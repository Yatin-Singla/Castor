//
//  TableViewController.swift
//  Term Project
//
//  Created by Yatin Singla on 5/7/20.
//  Copyright © 2020 Washington State University. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UIGestureRecognizerDelegate {

    var Songs: [SongItem]! = []
    var MusixMatchApiKey = "e8d4803ab4dfe4ca52b34095a92773e0"
    var MusixMatchSearchURL: String!
    var page: Int! = 1
    
    @IBOutlet weak var NavItem: UINavigationItem!
    
    @IBAction func RefreshTapped(_ sender: UIBarButtonItem) {
        print("refresh tapped")
        self.page += 1
        Songs.removeAll()
        updateSearchURL()
        getSongs()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        updateSearchURL()
        getSongs()
        let refreshBarButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(RefreshTapped))
        navigationController?.navigationBar.topItem?.title = "Song Recommendations"
        navigationController?.navigationBar.topItem?.rightBarButtonItem = refreshBarButton
        
    }
    
    func updateSearchURL() {
        MusixMatchSearchURL = "https://api.musixmatch.com/ws/1.1/track.search?format=json&f_music_genre_id=1127&apikey=\(MusixMatchApiKey)&page=\(page!)&page_size=10"
    }
    
    func getSongs() {
        if let urlStr = MusixMatchSearchURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            if let url = URL(string: urlStr) {
                let dataTask = URLSession.shared.dataTask(with: url, completionHandler: handleSongResponse)
                dataTask.resume()
            }
        }
    }
    
    func handleSongResponse(data: Data?, response: URLResponse?, error: Error?) {
        // 1. Check for error in request (e.g., no network connection)
        if let err = error {
            print("error: \(err.localizedDescription)")
            return
        }
        // 2. Check for improperly-formatted response
        guard let apiResponse = response as? HTTPURLResponse else {
            print("error: improperly-formatted response")
            return
        }
        let statusCode = apiResponse.statusCode
        // 3. Check for HTTP error
        guard statusCode == 200 else {
            let msg = HTTPURLResponse.localizedString(forStatusCode: statusCode)
            print("HTTP \(statusCode) error: \(msg)")
            return
        }
        // 4. Check for no data
        guard let somedata = data else {
            print("error: no data")
            return
        }
        // 5. Check for properly-formatted JSON data
        guard let jsonObj = try? JSONSerialization.jsonObject(with: somedata),
            let jsonDict1 = jsonObj as? [String: Any],
            let message = jsonDict1["message"] as? [String:Any],
            let body = message["body"] as? [String:Any],
            let track_list = body["track_list"] as? [Dictionary<String, Any>],
            track_list.count > 0
            else {
                print("error: invalid JSON data")
                return
        }
        
        for multipleSongs in track_list{
            //print("multipleSongs = \(multipleSongs)")
            guard let track = multipleSongs["track"] as? [String:Any],
                //print("============track = \(track)\n--------------------")
                let track_name = track["track_name"] as? String,
                //print("track_name = \(track_name)")
                let artist_name = track["artist_name"] as? String,
                //print("artist_name = \(artist_name)")
                let album_name = track["album_name"] as? String
                else {
                    print("error: invalid JSON data")
                    return
            }
            Songs.append(SongItem(Title: track_name, Artist: artist_name, Album: album_name))
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Songs!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! TableViewCell
        let row = indexPath.row
        let Song = Songs![row]
        cell.TrackLabel.text = Song.Title
        cell.ArtistName.text = Song.ArtistName
        cell.Album.text = Song.Album

        return cell
    }
    
    @IBAction func HandleSwipe(_ sender: UISwipeGestureRecognizer)
    {
            self.tabBarController?.selectedIndex -= 1
    }
    

//    override func viewWillAppear(_ animated: Bool) {
//      super.viewWillAppear(animated)
//      self.navigationController?.setNavigationBarHidden(true, animated: false)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(false, animated: false)
//    }

}
