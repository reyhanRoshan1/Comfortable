//
//  ImagePickerManager.swift
//  ChitChatApp
//
//  Created by TechCenter on 15/01/21.
//  Copyright © 2021 Surinder. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


var isCameraOpen : Bool = false

class ImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var picker = UIImagePickerController();
    var alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
    var viewController: UIViewController?
    var pickImageCallback : ((UIImage,URL?,String) -> ())?;
    
    let videoCompressor = LightCompressor()
    
    override init(){
        super.init()
        let cameraAction = UIAlertAction(title: "Camera", style: .default){
            UIAlertAction in
            isCameraOpen = true
            self.openCamera()
        }
        let galleryAction = UIAlertAction(title: "Images", style: .default){
            UIAlertAction in
            isCameraOpen = false
            self.openGallery(.photoLibrary)
        }
        
        let videoAction = UIAlertAction(title: "Videos", style: .default){
            UIAlertAction in
            isCameraOpen = false
            self.openGallery(.savedPhotosAlbum)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){
            UIAlertAction in
        }

        // Add the actions
        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(videoAction)
        alert.addAction(cancelAction)
    }

    func pickImage(_ viewController: UIViewController, _ callback: @escaping ((UIImage,URL?,String) -> ())) {
        pickImageCallback = callback;
        self.viewController = viewController;

        alert.popoverPresentationController?.sourceView = self.viewController!.view

        viewController.present(alert, animated: true, completion: nil)
    }
    func openCamera(){
        alert.dismiss(animated: true, completion: nil)
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            self.viewController!.present(picker, animated: true, completion: nil)
        } else {
            let alertWarning = UIAlertView(title:"Warning", message: "You don't have camera", delegate:nil, cancelButtonTitle:"OK", otherButtonTitles:"")
            alertWarning.show()
        }
    }
    func openGallery(_ type : UIImagePickerController.SourceType){
        alert.dismiss(animated: true, completion: nil)
        if type == .photoLibrary{
          picker.sourceType = .photoLibrary
        }else{
            picker.sourceType = .savedPhotosAlbum
            picker.mediaTypes = ["public.movie"]
        }
        self.viewController!.present(picker, animated: true, completion: nil)
    }

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    //for swift below 4.2
    //func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    //    picker.dismiss(animated: true, completion: nil)
    //    let image = info[UIImagePickerControllerOriginalImage] as! UIImage
    //    pickImageCallback?(image)
    //}
    
    // For Swift 4.2+
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
//        guard let image = info[.originalImage] as? UIImage else {
//            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
//        }
        
        isCameraOpen = false
        
        if let image = info[.originalImage] as? UIImage {
            pickImageCallback?(image, nil, "img")
        }
        
        if let videoUrl = info[.mediaURL] as? URL{
            print("video Url", videoUrl)
            
            if videoUrl != nil{
                do {
                    let imageData = try Data(contentsOf: videoUrl as URL)
                    getThumbnailImageFromVideoUrl(url: videoUrl) { (image) in
                        print(image)
                        if let img = image{
                            self.pickImageCallback?(img, videoUrl, "mov")
                        }
                    }
                   // profileImageView.image = UIImage(data: imageData)
                } catch {
                    print("Unable to load data: \(error)")
                }
            }
            
        }
    }
    
    
    func getThumbnailImageFromVideoUrl(url: URL, completion: @escaping ((_ image: UIImage?)->Void)) {
        DispatchQueue.global().async { //1
            let asset = AVAsset(url: url) //2
            let avAssetImageGenerator = AVAssetImageGenerator(asset: asset) //3
            avAssetImageGenerator.appliesPreferredTrackTransform = true //4
            let thumnailTime = CMTimeMake(value: 0, timescale: 1) //5
            do {
                let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumnailTime, actualTime: nil) //6
                let thumbImage = UIImage(cgImage: cgThumbImage) //7
                DispatchQueue.main.async { //8
                    completion(thumbImage) //9
                }
            } catch {
                print(error.localizedDescription) //10
                DispatchQueue.main.async {
                    completion(nil) //11
                }
            }
        }
    }
    
     func createVideoThumbnail(from url: URL) -> UIImage? {

        let asset = AVAsset(url: url)
        let assetImgGenerate = AVAssetImageGenerator(asset: asset)
        assetImgGenerate.appliesPreferredTrackTransform = true
       // assetImgGenerate.maximumSize = CGSize(width: frame.width, height: frame.height)

        let time = CMTimeMakeWithSeconds(0.0, preferredTimescale: 600)
        do {
            let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
            let thumbnail = UIImage(cgImage: img)
            return thumbnail
        }
        catch {
          print(error.localizedDescription)
          return nil
        }

    }



    @objc func imagePickerController(_ picker: UIImagePickerController, pickedImage: UIImage?) {
    }

    
    func compres(videoUrl : URL){
        let destinationPath = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("compressed.mp4")
        let compression : Compression = videoCompressor.compressVideo(
                                       source: videoUrl,
                                       destination: destinationPath as URL,
                                       quality: .medium,
                                       isMinBitRateEnabled: true,
                                       keepOriginalResolution: false,
                                       progressQueue: .main,
                                       progressHandler: { progress in
                                           // progress
                                       },
                                       completion: {[weak self] result in
                                           guard let `self` = self else { return }
                                                    
                                           switch result {
                                           case .onSuccess(let path):
                                            
                                            print(path)
                                            
                                            
                                            break
                                               // success
                                                        
                                           case .onStart: break
                                               // when compression starts
                                                        
                                           case .onFailure(let error): break
                                               // failure error
                                                        
                                           case .onCancelled: break
                                               // if cancelled
                                           }
                                       }
        )
        
        
    }
    
}
