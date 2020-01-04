//
//  ViewController.swift
//  swift-test
//
//  Created by Yiu Cho Lam on 29/12/2019.
//  Copyright © 2019 Yiu Cho Lam. All rights reserved.
//

import UIKit
import Alamofire

struct Profile : Codable {
	let user_gender : String
	let user_birth : String
	let user_profile_pic : String
	let user_info : String
}

struct Image : Codable  {
	let url : String
}

class ViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
	@IBOutlet weak var collectionView: UICollectionView!
	
	private let spacing:CGFloat = 16.0
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 18
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) 

		let imageView = cell.contentView.viewWithTag(1) as! UIImageView
		
		let image = UIImage.init(url: "https://puchi-kano.com/wp/wp-content/uploads/2019/06/1-7-240x320.jpg")
		imageView.contentMode = .scaleAspectFill
		imageView.image = image
		cell.layer.borderColor = UIColor.red.cgColor
		cell.layer.borderWidth = 2.0
        return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		performSegue(withIdentifier: "toDetail", sender: nil)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 16
        
	
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        if let collection = self.collectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
			return CGSize(width: width, height: 277 )
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
	
	func requeset() -> Void {
		let url: String = "https://tutorial-mysiteapp.herokuapp.com/api/profile"
		Alamofire.request(url).response { response in
			
				guard response.data != nil else {
					return
				}
				let decoder = JSONDecoder()
				
				do {
					let result : [Profile] = try decoder.decode([Profile].self, from: response.data!)
					print(result.count)
							
				} catch  {
					print(error)
				}
			
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionView?.collectionViewLayout = layout
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
		   if (segue.identifier == "toDetail") {
			   let vc: DetailViewController = (segue.destination as? DetailViewController)!
				//vc.modalPresentationStyle = .fullScreen
//			   subVC.selectedImg = selectedImage
		   }
	   }

}

