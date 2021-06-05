//
//  LaunchViewController.swift
//  Pali-N-Drom
//
//  Created by Анастасия Ларина on 05.06.2021.
//

import UIKit

class LaunchViewController: UIViewController {

    // MARK: - Outlet
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var launchImage: UIImageView!
    
    // MARK: - Life cicles
    
    override func viewDidLoad() {
        super.viewDidLoad()
       launchImage.loadGif(name: "gif")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    // MARK: - Animation func
   
    private func animate() {
        let duration = 0.75
        label.transform = CGAffineTransform(scaleX: 1, y: 0)
        UIView.animate(
            withDuration: duration * 3.2,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0,
            options: [],
            animations: {
                self.label.transform = .init()
            },
            completion: { finished in
                guard finished else { return }
                self.home()

            })
    }
    
    // MARK: - Segues
    
    private func home() {
        performSegue(withIdentifier: "Home", sender: nil)
    }
    
  
}
