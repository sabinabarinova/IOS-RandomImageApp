
protocol MediaManagerDelegate {
    func updateContent(_ image: UIImage)
    func didFailWithError(error: Error)
}

import Foundation
import UIKit

struct MediaManager {
    
    let people = "https://api.unsplash.com/photos/random?query=people&client_id=BGjIvUMtZCjZ58ENrmd61xCZrtZxkID-8rpY_1ft8cc"
    let  animals = "https://api.unsplash.com/photos/random?query=animals&client_id=BGjIvUMtZCjZ58ENrmd61xCZrtZxkID-8rpY_1ft8cc"
    
    var delegate:MediaManagerDelegate?
    

    func getImage(for isImage: Bool) {
        
        if isImage {
            guard let url = URL(string: people) else {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let output = try JSONDecoder().decode(ImageModel.self, from: data)
                    configureURL(with: output.urls.small)
                }
                catch {
                    print(error)
                }
            }
            
            task.resume()
        }
        else {
            guard let url = URL(string: animals) else {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let output = try JSONDecoder().decode(ImageModel.self, from: data)
                    configureURL(with: output.urls.small)
                }
                catch {
                    print(error)
                }
            }
            
            task.resume()
        }
        
        
        
        func configureURL(with url: String) {
            guard let urlString = URL(string: url) else {
                return
            }
            
            let task = URLSession.shared.dataTask(with: urlString) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                let image = UIImage(data: data)
                self.delegate?.updateContent(image!)
            }
            
            task.resume()
        }
    }
}

