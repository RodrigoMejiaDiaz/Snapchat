//
//  ViewController.swift
//  Snapchat
//
//  Created by RTodrigo Mejia on 11/1/21.
//  Copyright © 2021 Rodrigo Mejia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class IniciarSesionViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func IniciarSessionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            print("Intentado Iniciar Sesion")
            if error != nil{
                print("Se presentó el siguiente error: \(error)")
            }else{
                print("Inicio de sesion exitoso")
            }
        }
    }


}

