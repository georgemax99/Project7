//
//  CreateItemViewController.swift
//  RentalApp
//
//  Created by George Young on 4/11/22.
//

import Foundation
import UIKit

class CreateItemViewController : UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var createItemView : CreateItemView!
    var user : User!
    var parentVC : ItemListViewController!
    
    var imagePicker = UIImagePickerController()
    
    var imageName : String!
    var image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        imagePicker.delegate = self
    }
    
    func initUI() {
        createItemView = CreateItemView()
        createItemView.submitButton.addTarget(self, action: #selector(submitAction), for: .touchUpInside)
        createItemView.backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        createItemView.imageButton.addTarget(self, action: #selector(imagePickerAction), for: .touchUpInside)
        view.addSubview(createItemView)
        createItemView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        createItemView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        createItemView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createItemView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    @objc func imagePickerAction() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: false, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) { //Tutorial source: https://www.hackingwithswift.com/read/10/4/importing-photos-with-uiimagepickercontroller
        print("IMAGE PICK YES")
        if let imgUrl = info[.imageURL] as? URL{
            print("IMAGE PICKERRRRR")
            let imgName = imgUrl.lastPathComponent
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
            let localPath = documentDirectory?.appending(imgName)

            var image = info[.originalImage] as! UIImage
            image = ImageUtil().resizedImage(image: image, scale: 0.4)!
            let data = image.pngData()! as NSData
            data.write(toFile: localPath!, atomically: true)
            //let imageData = NSData(contentsOfFile: localPath!)!
            let photoURL = URL.init(fileURLWithPath: localPath!)//NSURL(fileURLWithPath: localPath!)
            print(photoURL)
            //AWSS3Manager.shared.upload(fileUrl: photoURL, progress: nil, completion: nil)
            imageName = AWSS3Manager.shared.getUniqueFileName()
            AWSS3Manager.shared.uploadImage(image: image, progress: nil, completion: nil, fileName: imageName)
            //createItemView.imageButton.setImage(image, for: .normal)
            createItemView.imageButton.setTitle("Image has been set", for: .normal)

        }
        
        dismiss(animated: false, completion: nil)
    }
    
    @objc func submitAction() {
        if let title = createItemView.titleTextField.text, let description = createItemView.descriptionTextField.text,
           let price = createItemView.priceTextField.text, let imageName = imageName {
            
            let params : [String : Any] = [
                "title" : title,
                "description" : description,
                "price" : price,
                "userId" : String(user.id),
                "imgUrl" : imageName
            ]
            
            ApiRequest.getInstance().sendPost(url: "create-item", parameters: params, finished: {(result) -> Void in
                if result == "Success" {
                    let alert = UIAlertController(title: "Success!", message: "Your item was listed successfully!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {_ in
                        DispatchQueue.main.async {
                            self.backAction()
                        }
                    }))
                    DispatchQueue.main.async {
                        self.present(alert, animated: false, completion: nil)
                    }
                } else {
                    let alert = UIAlertController(title: "Error!", message: "There was a problem listing your item. Please try again later.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {_ in
                        DispatchQueue.main.async {
                            self.backAction()
                        }
                    }))
                    DispatchQueue.main.async {
                        self.present(alert, animated: false, completion: nil)
                    }
                }
            })
        }
    }
    
    @objc func backAction() {
        parentVC.reloadData()
        self.dismiss(animated: false, completion: nil)
    }
}
