//
//  UIImageView+Extensions.swift
//  rickAndMortyTestApp
//
//  Created by Aline on 02/05/2020.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImageFromURL(url: String) {
        let url = URL(string: url)
        guard let unwrappedURL = url else { return }
        let request = URLRequest(url: unwrappedURL)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = image
                self.setNeedsDisplay()
            }
        }
        task.resume()
    }
}
