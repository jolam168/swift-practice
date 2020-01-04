//
//  DetailViewController.swift
//  swift-test
//
//  Created by Yiu Cho Lam on 1/1/2020.
//  Copyright © 2020 Yiu Cho Lam. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var tableView :UITableView!
//	var imageView : UIImageView!
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		
		return cell
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		let image = UIImage.init(url: "https://puchi-kano.com/wp/wp-content/uploads/2019/06/1-7-240x320.jpg")
		let imageView = UIImageView()

		imageView.contentMode = .scaleAspectFill
		imageView.image = image
		
		let ratio = image.size.width / image.size.height
//		if imageView.frame.width > imageView.frame.height {
			let newHeight = UIScreen.main.bounds.size.width / ratio
			imageView.frame.size = CGSize(width:UIScreen.main.bounds.size.width, height: newHeight)
//		}else{
//			let newWidth = imageView.frame.height * ratio
//			imageView.frame.size = CGSize(width: newWidth, height: imageView.frame.height)
//		}
		
		self.tableView.tableHeaderView = imageView
		
    }
    
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
