//
//  MainViewController.swift
//  AppUseMobile
//
//  Created by Fran Martins on 31/05/22.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties
    let viewModel = HomeViewModel()
    
    // MARK: Outlet
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageUse: UIImageView!
    @IBOutlet weak var textFieldCPF: UITextField!
    @IBOutlet weak var buttonBuscar: UIButton!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        bindEvents()
        setupUI()
        textFieldCPF.delegate = self
}
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationItem.title = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: Actions
    @IBAction func handlerButtonSearch(_ sender: Any) {
        guard textFieldCPF.text?.count == 8 else {
           return showAlerts(alertTitle: "Erro", alertMessage: "Digite um CEP válido")
        }
        activityIndicator.startAnimating()
        viewModel.getAddress(with: textFieldCPF.text ?? "60000000")
    }
    
    // MARK: BindEvents
    private func bindEvents() {
        viewModel.goToAddress = { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.goToAddress()
        }
    }
    
    // MARK: Methods
    private func setupUI() {
        buttonBuscar.layer.cornerRadius = 6
        textFieldCPF.placeholder = "Digite o CEP"
        imageUse.image = UIImage(named: "hor-grad")
        activityIndicator.hidesWhenStopped = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textFieldCPF.resignFirstResponder() {
        }
        return true
    }
    
    private func showAlerts(alertTitle: String?, alertMessage: String?) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func goToAddress() {
        guard let address = viewModel.address else {return}
        let addressViewController = SecondViewController(address: address)
        navigationController?.pushViewController(addressViewController, animated: true)
    }
}
