//
//  AddContactViewController.swift
//  Contacts-App
//
//  Created by Juan Ceballos on 2/26/21.
//

import UIKit

public enum ContactState {
    case newContact
    case editContact
}

class AddContactViewController: UIViewController {
    
    let contactState: ContactState
    let contact: Contact?
    
    init(contactState: ContactState, contact: Contact? = nil) {
        self.contactState = contactState
        self.contact = contact
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
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
        
        switch contactState {
        case .newContact:
            createNewContact(firstName: firstNameEntry, lastName: lastNameEntry, email: emailTextFieldEntry, poNumber: poNumberTextFieldEntry, address: streetTextFieldEntry)
        case .editContact:
            editExistingContact(contactId: contact?.contactId ?? UUID(), firstName: firstNameEntry, lastName: lastNameEntry, poNumber: poNumberTextFieldEntry, address: streetTextFieldEntry, email: emailTextFieldEntry)
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    private func createNewContact(firstName: String, lastName: String, email: String, poNumber: String, address: String) {
        let newContact = CoreDataManager.shared.createContact(firstName: firstName, lastName: lastName, email: email, poNumber: poNumber, address: address)
        print(newContact.contactId?.uuidString ?? "No Id here")
        self.navigationController?.popViewController(animated: true)
    }
    
    private func editExistingContact(contactId: UUID, firstName: String, lastName: String, poNumber: String, address: String, email: String) {
        CoreDataManager.shared.updateContact(contactId: contactId, firstName: firstName, lastName: lastName, poNumber: poNumber, address: address, email: email)

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
