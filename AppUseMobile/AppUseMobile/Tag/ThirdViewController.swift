//
//  ThirdViewController.swift
//  AppUseMobile
//
//  Created by Fran Martins on 01/06/22.
//

import UIKit

class ThirdViewController: UIViewController {
    
    // MARK: Properties
    var fullAddress: String?
    
    init(fullAddress: String) {
        super.init(nibName: nil, bundle: nil)
        self.fullAddress = fullAddress
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Outlets
    @IBOutlet weak var labelFullAddress: UILabel!
    @IBOutlet weak var labelEtiqueta: UILabel!
    @IBOutlet weak var viewTag: UIView!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationItem.title = "TAG"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: Methods
    private func setupUI() {
        viewTag.layer.cornerRadius = 6
        labelFullAddress.text = fullAddress
    }
}
