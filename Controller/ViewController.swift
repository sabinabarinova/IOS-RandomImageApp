
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var contentImage: UIImageView!
    
    var manager = MediaManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
    }

    @IBAction func buttonPressed(_ sender:UIButton) {
        if sender.tag == 1 {
            manager.getImage(for: true)
        }
        else if sender.tag == 2 {
            manager.getImage(for: false)
        }
    }

}

extension ViewController: MediaManagerDelegate {
    
    func updateContent(_ image: UIImage) {
        
        DispatchQueue.main.async {
            self.contentImage.image = image
        }
    }
    
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

