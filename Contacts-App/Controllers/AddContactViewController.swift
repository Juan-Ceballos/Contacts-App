//
//  AddContactViewController.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 2/26/21.
//

import UIKit

class AddContactViewController: UIViewController {
    
    let addContactView = AddContactView()
    
    override func loadView() {
        view = addContactView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTextField()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset: UIEdgeInsets = addContactView.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        addContactView.scrollView.contentInset = contentInset
        print(keyboardFrame.size.height)
    }
    
    @objc func keyboardWillHide(notifcation: NSNotification) {
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        addContactView.scrollView.contentInset = contentInset
    }
    
    func addSaveButtonOnKeyboard() {
        let saveToolBar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        saveToolBar.barStyle = .default
        
        let flexspace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancel: UIBarButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelButtonPressed))
        
        let save: UIBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(saveButtonPressed))
        
        var items = [UIBarButtonItem]()
        items.append(flexspace)
        items.append(save)
        items.append(cancel)
        
        saveToolBar.items = items
        saveToolBar.sizeToFit()
        
        addContactView.firstNameTextField.inputAccessoryView = saveToolBar
        addContactView.lastNameTextField.inputAccessoryView = saveToolBar
        addContactView.zipTextField.inputAccessoryView = saveToolBar
        addContactView.stateTextField.inputAccessoryView = saveToolBar
        addContactView.cityTextField.inputAccessoryView = saveToolBar
        addContactView.poNumberTextField.inputAccessoryView = saveToolBar
        addContactView.streetTextField.inputAccessoryView = saveToolBar
        addContactView.aptTextField.inputAccessoryView = saveToolBar
        addContactView.emailTextField.inputAccessoryView = saveToolBar
    }
    
    @objc func saveButtonPressed() {
        print("Save button pressed")
        //let arr = CoreDataManager.shared.fetchContact()
        //print(arr[0].fullName ?? "No Name")
        guard let firstNameEntry = addContactView.firstNameTextField.text, !firstNameEntry.isEmpty,
              let lastNameEntry = addContactView.lastNameTextField.text, !lastNameEntry.isEmpty,
              let zipTextFieldEntry = addContactView.zipTextField.text, !zipTextFieldEntry.isEmpty,
              let stateTextFieldEntry = addContactView.stateTextField.text, !stateTextFieldEntry.isEmpty,
              let cityTextFieldEntry = addContactView.cityTextField.text, !cityTextFieldEntry.isEmpty,
              let poNumberTextFieldEntry = addContactView.poNumberTextField.text, !poNumberTextFieldEntry.isEmpty,
              let streetTextFieldEntry = addContactView.streetTextField.text, !streetTextFieldEntry.isEmpty,
              let aptTextFieldEntry = addContactView.aptTextField.text, !aptTextFieldEntry.isEmpty,
              let emailTextFieldEntry = addContactView.emailTextField.text, !emailTextFieldEntry.isEmpty else {
            self.showAlert(title: "Error", message: "Missing Fields")
            return
        }
        
        let newContact = CoreDataManager.shared.createContact(firstName: firstNameEntry, lastName: lastNameEntry, email: emailTextFieldEntry, poNumber: poNumberTextFieldEntry, address: streetTextFieldEntry)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @objc func cancelButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupTextField() {
        self.addSaveButtonOnKeyboard()
        addContactView.firstNameTextField.becomeFirstResponder()
        addContactView.firstNameTextField.delegate = self
        addContactView.lastNameTextField.delegate = self
        addContactView.zipTextField.delegate = self
        addContactView.stateTextField.delegate = self
        addContactView.cityTextField.delegate = self
        addContactView.poNumberTextField.delegate = self
        addContactView.streetTextField.delegate = self
        addContactView.aptTextField.delegate = self
        addContactView.emailTextField.delegate = self
    }
    
}

extension AddContactViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case addContactView.firstNameTextField:
            addContactView.lastNameTextField.becomeFirstResponder()
        case addContactView.lastNameTextField:
            addContactView.poNumberTextField.becomeFirstResponder()
        case addContactView.poNumberTextField:
            print("no return key")
        case addContactView.emailTextField:
            addContactView.streetTextField.becomeFirstResponder()
        case addContactView.streetTextField:
            addContactView.aptTextField.becomeFirstResponder()
        case addContactView.aptTextField:
            addContactView.cityTextField.becomeFirstResponder()
        case addContactView.cityTextField:
            addContactView.stateTextField.becomeFirstResponder()
        case addContactView.stateTextField:
            addContactView.zipTextField.becomeFirstResponder()
        case addContactView.zipTextField:
            print("Last textfield")
        default:
            print("error on should return textfields")
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField != addContactView.zipTextField {
            addContactView.scrollView.contentInset = UIEdgeInsets.zero
        }
        
    }
    
}

class ScrollView: UIScrollView {
  override func touchesShouldCancel(in view: UIView) -> Bool {
    if type(of: view) == UITextField.self || type(of: view) == UITextView.self {
      return true
    }
    return super.touchesShouldCancel(in: view)
  }
    
}
