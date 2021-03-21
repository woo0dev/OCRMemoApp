//
//  OCRViewController.swift
//  MemoApp
//
//  Created by Woo0 on 2021/03/17.
//

import UIKit
import RealmSwift
import TesseractOCR


class OCRViewController: UIViewController, G8TesseractDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    let imagePickerController = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePickerController.delegate = self

    }
    
    @IBAction func conversionBtn(_ sender: Any) {
        if let tesseract = G8Tesseract(language: "eng", engineMode: .tesseractOnly) {
            tesseract.delegate = self
            tesseract.image = imageView.image!
            tesseract.recognize()
            textView.text = tesseract.recognizedText
        }
    }
    
    func progressImageRecognition(for tesseract: G8Tesseract) {
        print("Recongnition Progress \(tesseract.progress) %")
    }
    
    @IBAction func cameraBtn(_ sender: Any) {
        self.imagePickerController.sourceType = .camera
        self.present(self.imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func albumBtn(_ sender: Any) {
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
}

extension OCRViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
}
