//
//  ViewController.swift
//  Camera and Cloud
//
//  Created by Rael Kenny on 2/1/17.
//  Copyright © 2017 Rael Kenny. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var takePhoto: UIButton!
    @IBOutlet weak var uploadPhoto: UIButton!

//    var imagePicker: UIImagePickerController = {
//    var picker = UIImagePickerController()
//    imagePicker.sourceType = .photoLibrary
//    picker.delegate = self
//    present(imagePicker, animated: true, completion: nil)
//    return picker
//    }
    
    
    /*
    
//    let storage = FIRStorage.storage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
         
        
        
//    let database = FIRDatabase.database().reference()
    let storage = FIRStorage.storage().reference()
    let tempImageRef = storage.child("tempDir/tempImage.jpg")
    
    let image = UIImage(named: "MU Logo.jpg")
    let metaData = FIRStorageMetadata()
    metaData.contentType = "image/jpeg"
    
    tempImageRef.put(UIImageJPEGRepresentation(image!, 0.8)!, metadata: metaData) { (data, error) in
        if error == nil {
            print("upload successful")
            let downloadURL = data!.downloadURL()
            
            // create photo objects with download url, empty likes, empty comments, write to database
            
        } else {
            print(error?.localizedDescription)
        }
    }
   
        
        
        
        
        
        
    }
    
    
    @IBAction func takePhotoButton(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable
        (UIImagePickerControllerSourceType.camera) {
            picker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        } else {
            print("No access to camera")
        }
    }
    
    
    @IBAction func uploadPhotoButton(_ sender: UIButton) {
        
    }
    
    
    func uploadImageToFirebaseStorage(data: NSData) {
        
        let storage = FIRStorage.storage()
        let data: NSData = myImageData
        let storageRef = storage.reference(forURL: "gs://raels-camera-and-cloud.appspot.com")
        

        let uploadTask = storageRef.put(data as Data, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                // Uh-oh, an error occurred!
                return
            }
            // Metadata contains file metadata such as size, content-type, and download URL.
            let downloadURL = metadata.downloadURL
            storeUserProfileInDB(downloadURL)
        }
        
       
        
        
        
//        let uploadMetaData = FIRStorageMetadata()
//        uploadMetaData.contentType = "image/jpeg"
//        
//        let uploadTask = storageRef.put(data as Data, metadata: uploadMetaData) { (metadata, error) in
//            if (error != nil) {
//                print("I received an error! \(error?.localizedDescription)")
//            } else {
//                print("Upload complete! Here's some metadata! \(metadata)")
//            }
//        }
//        

}
    
    
  
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancelled picker")
         dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //to get image out the picker:
        if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage,
            let imageData = UIImageJPEGRepresentation(originalImage, 0.8) {
//            uploadImageToFirebaseStorage(imageData)
            }
            print(info)
        
        }
        
        
    }
 */
    



}
