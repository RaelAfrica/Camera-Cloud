//
//  ChoosePhotoVC.swift
//  Camera and Cloud
//
//  Created by Rael Kenny on 2/7/17.
//  Copyright © 2017 Rael Kenny. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import MobileCoreServices



class ChoosePhotoVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
//    @IBOutlet weak var takePhoto: UIButton!
//    @IBOutlet weak var uploadPhoto: UIButton!
    
    //properties:
    
    
    let imagePicker = UIImagePickerController()
    let datamanager = DAO.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    @IBAction func takePhotoButton(_ sender: UIButton) {
        imagePicker.sourceType = .camera
        imagePicker.mediaTypes = [kUTTypeImage as String]
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func uploadPhotoButton(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as String]
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //to get image out the picker:
        if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            let imageData = UIImageJPEGRepresentation(originalImage, 0.8)
            datamanager.uploadImageToFirebaseStorage(data: imageData!)
        } else{
            print("Something went wrong")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancelled picker")
        dismiss(animated: true, completion: nil)
    }
    
 
    
    //    let storage = FIRStorage.storage()
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        //    let database = FIRDatabase.database().reference()
//        let storage = FIRStorage.storage().reference()
//        let tempImageRef = storage.child("tempDir/tempImage.jpg")
//        
//        let image = UIImage(named: "MU Logo.jpg")
//        let metaData = FIRStorageMetadata()
//        metaData.contentType = "image/jpeg"
//        
//        tempImageRef.put(UIImageJPEGRepresentation(image!, 0.8)!, metadata: metaData) { (data, error) in
//            if error == nil {
//                print("upload successful")
//                let downloadURL = data!.downloadURL()
//                
//                // create photo objects with download url, empty likes, empty comments, write to database
//                
//            } else {
//                print(error?.localizedDescription)
//            }
//        }
//        
//   
//    }
//    


    
 
}


     
     


    
    
    
    

