//
//  MesageDetailViewController.swift
//  swift-test
//
//  Created by Yiu Cho Lam on 2/1/2020.
//  Copyright © 2020 Yiu Cho Lam. All rights reserved.
//

import UIKit
import MessageKit
import InputBarAccessoryView


extension MessageDetailViewController : InputBarAccessoryViewDelegate{
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
//		let message = MockMessage(text: text, user: currentSender(), messageId: UUID().uuidString, date: Date())
		
//		let attributedText = messageInputBar.inputTextView.attributedText!
//        let range = NSRange(location: 0, length: attributedText.length)
		
		
        messagesCollectionView.scrollToBottom(animated: true)
	}
}

struct MockUser: SenderType, Equatable {
    var senderId: String
    var displayName: String
}

struct MockMessage: MessageType {

	var messageId: String
	var sender: SenderType {
		return user
	}
	var sentDate: Date
	var kind: MessageKind

	var user: MockUser

	private init(kind: MessageKind, user: MockUser, messageId: String, date: Date) {
		self.kind = kind
		self.user = user
		self.messageId = messageId
		self.sentDate = date
	}
	
	init(text: String, user: MockUser, messageId: String, date: Date) {
        self.init(kind: .text(text), user: user, messageId: messageId, date: date)
    }

}
class MessageDetailViewController: MessagesViewController, MessagesDataSource {
	
	func currentSender() -> SenderType {
		let user = MockUser(senderId: "001",displayName: "Myname")
		return user
	}
	
	func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
		return messageList[indexPath.section]
	}
	
	func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
		return messageList.count
	}
	

	var messageList: [MockMessage] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		messagesCollectionView.messagesDataSource = self
//        messagesCollectionView.messageCellDelegate = self
//        messagesCollectionView.messagesLayoutDelegate = self
//        messagesCollectionView.messagesDisplayDelegate = self
//        messagesCollectionView.messageCellDelegate = self
		
        messageInputBar.delegate = self
        messageInputBar.sendButton.tintColor = UIColor.lightGray
		
		let user = MockUser(senderId: "001", displayName: "Name")
		let msg = MockMessage(text: "Hello", user: user, messageId: UUID().uuidString, date: Date())
		self.messageList.append(msg)
		self.messagesCollectionView.reloadData()
		self.messagesCollectionView.scrollToBottom()
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
