//
//  Coffee.swift
//  Coffee
//
//  Created by Anastasia Loginova on 16.03.17.
//  Copyright © 2017 Anastasia Loginova. All rights reserved.
//

import Foundation
import UIKit

class Coffee {
    var name: String
    var text: String
    var image: String
    var video: String
    
    init(name: String, text: String, image: String, video: String) {
        self.name = name
        self.text = text
        self.image = image
        self.video = video
    }
    
    static func createSampleData() -> [Coffee] {
        return [ Coffee(name: "Latte",
                           text: "An espresso topped with steamed milk, including 1cm of microfoam.\n\n1 part coffee\n3 parts steamed milk \n\nMeaning “coffee and milk” in Italian, a caffè latte is a very milky coffee with less foam than a cappuccino (see below). It is usually made with a double shot of espresso and is most commonly served in a glass with a handle.It is argued that the latte is Californian in origin, created in the 1950s by Lino Meiorin, one of the owners of the famous Caffe Mediterraneum in Berkeley. It was then made popular in the early 1980s by the Seattle Coffee Company (that we know today as Starbucaks). As the company’s power base spread in the 1990s, so did the popularity of the latte. The drink tends to be favoured by women, but men are also allowed to partake!",
                           image: "http://cdn.jamieoliver.com/news-and-features/features/wp-content/uploads/sites/2/2016/04/Latte.jpg",
                           video: "UAvsOpyyle4"),
                 Coffee(name: "Cappuccino",
                        text: "An espresso topped with steamed milk and a dense layer of microfoam 15mm thick. Garnished with a sprinkle of cocoa.\n\n1 part coffee\n1 part steamed milk\n1 part microfoam\n\nCappuccino literally means “little cap” or “little hood” in Italian. It may be an old wives’ tale, but it is said that the Capuchin Friars Minor, an order of monks in the Catholic church, were the inspiration for the drink’s name (their shaved heads and hooded cowls were said to resemble the caramel coffee ring and white foam).The cappuccino embodied the second wave coffee scene that dominated UK high streets from the 1990s onwards, thanks to the likes of Starbucks, Costa Coffee and Caffè Nero. A cappuccino contains less milk than a latte, made up of roughly one-third coffee, one-third silky, creamy milk, and one-third quite foamy milk. Made with single or double shots of coffee, and traditionally served in ceramics, a proper cappuccino also has a sprinkle of chocolate on top.",
                        image: "http://cdn.jamieoliver.com/news-and-features/features/wp-content/uploads/sites/2/2016/04/Cappuccino.jpg",
                        video: "WETHrYIB98s"),
                 Coffee(name: "Americano",
                        text: "Two-thirds hot water with a double ristretto (a strong, small espresso) poured over the top.\n\n1 part coffee (preferably a double espresso)\n2 parts water\n\nAn Americano can be either a filter coffee or a double espresso diluted with hot water. The term “caffè Americano” is simply Italian for “American coffee”. Traditionally in the States, a mug of coffee from a coffee filter pot is the common beverage, as opposed to the smaller cups enjoyed by Europeans.\nThe best way to make a large black coffee from an espresso is to dilute it with hot water, which is what, it is believed, American GIs did in Italy during the Second World War – hence the name Americano. The drink is popular in the US and with people who enjoy coffee from a filter machine or percolator. In New Zealand and Australia, it is known as a long black.",
                        image: "http://cdn.jamieoliver.com/news-and-features/features/wp-content/uploads/sites/2/2016/04/Americano.jpg",
                        video: "NxrL-XxsUIw"),
                 Coffee(name: "Macchiato",
                        text: "An espresso with a dash of microfoam.\n\n15ml single shot of espresso\na little microfoam on top\n\nSome people like a little milk with their espresso to calm the harshness of the powerful coffee hit. Macchiato, my favourite coffee, is an espresso marked with a small amount of milk (“macchiato” is the Italian word for “stained” or “spotted”). The Italian macchiato would seem to me to be identical to the Spanish cortado, however, I’m sure you’ll be able to find a number of Italians who will testify that they are very different, and vice versa.\nPopular in Italy, a macchiato doesn’t necessarily have to be on the menu, as it’s part of every good coffee shop. It is served in a glass or ceramics, as either a single or double, depending on strength preference.",
                        image: "http://cdn.jamieoliver.com/news-and-features/features/wp-content/uploads/sites/2/2016/04/Macchiato.jpg",
                        video: "byiTHxc4Gz4"),
                 Coffee(name: "Mocha",
                        text: "Chocolate powder added to an espresso, topped with steamed milk and garnished with a sprinkle of cocoa.\n\n1 teaspoon drinking chocolate\n1 part coffee\n1 part steamed milk\n1 part microfoam\n\nThe mocha is an American invention, inspired by the Turin coffee beverage bicerin, which is espresso, drinking chocolate and whole milk served layered. In Italy or France, it is referred to as a mocha latte, not caffé mocha, as we’re more used to. A mocha is quite sweet, yet still strong in caffeine – it is basically a latte with chocolate, and traditionally served in a glass.",
                        image: "http://cdn.jamieoliver.com/news-and-features/features/wp-content/uploads/sites/2/2016/04/Mocha.jpg",
                        video: "bGlly9PaMuM")
        ]
    }
}

extension UIImageView {
    func downloadedFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url)
    }
}
