//
//  NewCarViewController.swift
//  CarsApp
//
//  Created by Дарья Станкевич on 2/25/20.
//  Copyright © 2020 Sergey Mikovoz. All rights reserved.
//

import UIKit

class NewCarViewController: UITableViewController {
    
    var newCar: Car?
    var imageIsChanged = false
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carMark: UITextField!
    @IBOutlet weak var carLocation: UITextField!
    @IBOutlet weak var carDescription: UITextField!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        saveButton.isEnabled = false
        carMark.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged) // при редактировании поля name будет вызываться метод addTarget, который будет вызывать  textFieldChanged который следит за заполеностью поля
     }
    
// MARK: Table view delegat
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cameraIcon = #imageLiteral(resourceName: "camera")
        let photoIcon = #imageLiteral(resourceName: "photo")
        
        if indexPath.row == 0 {
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(source: .camera)
            }
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(source: .photoLibrary)
            }
            photo.setValue(photoIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")

            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
        } else {
            view.endEditing(true)
        }
    }
    func saveNewCar() {
        var image: UIImage?
        
        if imageIsChanged {
            image = carImage.image
        } else {
            image = #imageLiteral(resourceName: "defaultimageincell")
        }
        
        newCar = Car(mark: carMark.text!,
                     location: carLocation.text,
                     description: carDescription.text,
                     image:  image,
                     carImage: nil)
    }
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
  
// MARK: Text field delegate

extension NewCarViewController: UITextFieldDelegate {
    
    // Скрываем клавиатуру по нажатию done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanged() {
        if carMark.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}

// MARK: Work with image

extension NewCarViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
    
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        carImage.image = info[.editedImage] as? UIImage
        carImage.contentMode = .scaleAspectFill
        carImage.clipsToBounds = true
        
        imageIsChanged = true
        
        dismiss(animated: true)
    }
    
}
