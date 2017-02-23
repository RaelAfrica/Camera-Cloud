//
//  DAO.swift
//  Camera and Cloud
//
//  Created by Rael Kenny on 2/10/17.
//  Copyright © 2017 Rael Kenny. All rights reserved.
//

import UIKit
import Firebase
import Alamofire


class DAO: NSObject {

    static let sharedInstance = DAO()
    var photos = [Photo]()
    
    //firebase database
    var searchURL = "https://raels-camera-and-cloud.firebaseio.com/photos.json"
//    let parameters = ["Alamofire":"Post Worked"]
    let parameters = ["photoElements": ["Likes":0, "Comments":[""], "DownloadURL":" "]]
    
    func createReference() {
        let storage = FIRStorage.storage()
        let storageRef = storage.reference(forURL: "gs://raels-camera-and-cloud.appspot.com") //firebase storage (of actual photos)
    }
    
    
    func uploadImageToFirebaseStorage(data: Data) {
        let storage = FIRStorage.storage()
//        let data: NSData = imageRef
        let storageRef = storage.reference(forURL: "gs://raels-camera-and-cloud.appspot.com")
        let uuid = UUID().uuidString
        let imageRef = storageRef.child(uuid)
        
        
        let uploadTask = imageRef.put(data as Data, metadata: nil)
        { (metadata, error) in
//            guard let metadata = metadata else {
            
                // Uh-oh, an error occurred!
            if(error == nil) {
            let downloadURL = metadata!.downloadURL()
                print(downloadURL)
                print(metadata?.name)
                //create new Photo object
                //assign the download url
                let downloadURLString = downloadURL?.absoluteString
                let emptyCommentArray = [String]()
                let newPhoto = Photo(comments: emptyCommentArray, downloadURL: downloadURLString!, likes: 0)
                newPhoto.name = metadata?.name
                
                //add to DAO photo array (similar to company array in nvactrl)
                self.photos.append(newPhoto)
                
                //writephoto to FBDatabase
                self.writePhotoToDatabase(photoToWrite: newPhoto)
             
//                return
        } else {
            print("Error in downloading image")
        }
            // Metadata contains file metadata such as size, content-type, and download URL.
//            let downloadURL = metadata.downloadURL
//            storeUserProfileInDB(downloadURL)
        }
    }

    func writePhotoToDatabase(photoToWrite: Photo) {
        //use alamofire to write to the database (put, post, patch)
        //before you send the photo object, try to write a simple string to the database
        
        let testDict = ["DownloadURL":photoToWrite.downloadURL, "Likes": 0, "Comments": [""]] as [String : Any]
        
        let pictData = [photoToWrite.name : testDict]
        
        Alamofire.request(searchURL, method: .patch, parameters: pictData, encoding: JSONEncoding.default).response { (response) in
            
            if let error = response.error {
                print("There was a error: \(error)")
            }
            print("ALAMO")
//            DefaultDataResponse.error
        }
            
            
            
        }
                         

//    func readPhotosFromDatabase(){
        
//        Alamofire.request(
//        //alamofire get request
//        //PARSE JSON WE GET BACK INTO PHOTO OBJECTS
//        //ADD EVERY PHOTO OBJECT TO SELF.PHOTOS
//        //LET THE DELEGATE(MOMENTSVC) KNOW IT HAS TO RELOAD ITS DATA
//        
//    }
//        
        
    
    
    
    
    
//        Alamofire.request(photoToWrite as! URLRequestConvertible).responseJSON(completionHandler: {
//            response in //holds data coming from responseJSON
//            
//            self.parseData(JSONData: response.data!)

        
    
//    func parseData(JSONData: Data){
//        do {
//            //serialize the data coming in
//            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! [String: AnyObject]
//            print(readableJSON)
//        }
//        catch {
//            print(error)
//        }
//    }

    
}

