//
//  MessageListViewController.swift
//  swift-test
//
//  Created by Yiu Cho Lam on 1/1/2020.
//  Copyright © 2020 Yiu Cho Lam. All rights reserved.
//

import UIKit

class MessageListViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{
	
	@IBOutlet weak var tableView: UITableView!
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		
		let imageView = cell.contentView.viewWithTag(1) as! UIImageView
		
		let image = UIImage.init(url: "https://puchi-kano.com/wp/wp-content/uploads/2019/06/1-7-240x320.jpg")
		imageView.contentMode = .scaleAspectFill
		imageView.image = image
		
		imageView.layer.cornerRadius = imageView.frame.size.width / 2
		imageView.clipsToBounds = true
		
		return cell
	}
	
	

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.rowHeight = 90
		
		self.tableView.separatorStyle = .none
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
