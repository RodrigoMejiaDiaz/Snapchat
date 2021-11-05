//
//  ViewController.swift
//  Snapchat
//
//  Created by RTodrigo Mejia on 11/1/21.
//  Copyright © 2021 Rodrigo Mejia. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import Firebase

class IniciarSesionViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var googleButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
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
        
    @IBAction func googleButtonAction(_ sender: Any) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let authentication = user?.authentication, let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { (authResult, error) in
                print("Intentado Iniciar Sesion")
                if error != nil{
                    print("Se presentó el siguiente error: \(error)")
                }else{
                    print("Inicio de sesion exitoso")
                }
            }
                }
            }
        }
        
        
    
    

    


