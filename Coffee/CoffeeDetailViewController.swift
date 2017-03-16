//
//  CoffeeDetailViewController.swift
//  Coffee
//
//  Created by Anastasia Loginova on 16.03.17.
//  Copyright © 2017 Anastasia Loginova. All rights reserved.
//

import UIKit

class CoffeeDetailViewController: UIViewController {

    @IBOutlet weak var coffeImage: UIImageView!
    @IBOutlet weak var coffeDescription: UITextView!
    @IBOutlet weak var coffeVideo: UIWebView!
    
    var coffee: Coffee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        title = coffee?.name
        coffeDescription.text = coffee?.text
        coffeImage.downloadedFrom(link: (coffee?.image)!)
        loadYoutube(videoID: (coffee?.video)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadYoutube(videoID: String) {
        guard
            let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
            else { return }
        coffeVideo.loadRequest( URLRequest(url: youtubeURL) )
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

