//
//  ProfileCollectionViewCell.swift
//  swift-test
//
//  Created by Yiu Cho Lam on 30/12/2019.
//  Copyright © 2019 Yiu Cho Lam. All rights reserved.
//

import UIKit

extension UIImage {
    public convenience init(url: String) {
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            self.init(data: data)!
            return
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        self.init()
    }
}

extension UIImageView {
    
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
}

class ProfileCollectionViewCell: UICollectionViewCell {
	override init(frame: CGRect) {
		super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
		let image = UIImageView()
		image.image = UIImage.init(url: "https://puchi-kano.com/wp/wp-content/uploads/2019/06/1-7-240x320.jpg")
		
		image.clipsToBounds = true
		image.contentMode = .scaleAspectFill
		image.translatesAutoresizingMaskIntoConstraints = true
		
		contentView.addSubview(image)
		
		let name = UILabel()
		name.text = "Name"
		
		contentView.addSubview(name)
		
	
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
