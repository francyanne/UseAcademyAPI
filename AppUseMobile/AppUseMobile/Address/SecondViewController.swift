//
//  SecondViewController.swift
//  AppUseAcademy
//
//  Created by Fran Martins on 12/06/22.
//

import UIKit

class SecondViewController: UIViewController {
    // MARK: Properties
    let viewModel: SecondViewModel
    var address: Address
    var fullAddress: String?
    
    init(address: Address, viewModel: SecondViewModel = .init()) {
        self.address = address
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Outlets
    @IBOutlet weak var textFieldRecipient: UITextField!
    @IBOutlet weak var textFieldZipCode: UITextField!
    @IBOutlet weak var textFieldStreet: UITextField!
    @IBOutlet weak var textFieldNumber: UITextField!
    @IBOutlet weak var textFieldComplement: UITextField!
    @IBOutlet weak var textFieldNeighborhood: UITextField!
    @IBOutlet weak var textFieldCity: UITextField!
    @IBOutlet weak var textFieldState: UITextField!
    @IBOutlet weak var buttonEtiqueta: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fillTextField()
        setTextFieldDelegate()
    }
    
    override func viewWillAppear( _ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "ADDRESS"
    }
    
    override func viewWillDisappear( _ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = ""
    }
    
    // MARK: Actions
    @IBAction func handlerGerarEtiqueta(_ sender: Any) {
        address.destinatario = textFieldRecipient.text
        address.numero = textFieldNumber.text
        address.complemento = textFieldComplement.text
        fullAddress = viewModel.createFullAddress(address: address)
        goToTag()
    }
    
    // MARK: Methods
    private func setupUI() {
        buttonEtiqueta.layer.cornerRadius = 10
    }
    
    private func fillTextField() {
        textFieldZipCode.text = address.cep
        textFieldCity.text = address.localidade
        textFieldState.text = address.uf
        textFieldNeighborhood.text = address.bairro
        textFieldComplement.text = address.complemento
        textFieldStreet.text = address.logradouro
    }
    
    private func setTextFieldDelegate() {
        textFieldCity.delegate = self
        textFieldState.delegate = self
        textFieldStreet.delegate = self
        textFieldNumber.delegate = self
        textFieldZipCode.delegate = self
        textFieldRecipient.delegate = self
        textFieldComplement.delegate = self
        textFieldNeighborhood.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
    }
    
    private func goToTag() {
        guard let fullAddress = fullAddress else { return }
        let thirdViewController = ThirdViewController(fullAddress: fullAddress)
        navigationController?.pushViewController(thirdViewController, animated: true)
    }
}

extension String {
    func testIfIsEmpty() -> String? {
        if self == "" {
            return nil
        }
        return self
    }
}

extension SecondViewController: UIGestureRecognizerDelegate, UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.resignFirstResponder() {
        }
        return true
    }
}
