//
//  ViewController.swift
//  aa
//
//  Created by tamires.p.silva on 01/07/20.
//  Copyright © 2020 Tamires. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swCaptitalLetters: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!

    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func change(_ sender: Any) {
        if !swLetters.isOn && !swNumbers.isOn && !swCaptitalLetters.isOn && !swSpecialCharacters.isOn{
            btn.isEnabled = false
            btn.backgroundColor = UIColor.lightGray
        } else {
            btn.isEnabled = true
        }
    }
    
    @IBAction func alertValues(_ sender: Any) {
        let total:Int? = Int(tfTotalPasswords.text!)
        let numbers:Int? = Int(tfNumberOfCharacters.text!)
        
        if total != nil {
            if total == 0 ||  total! > 99 {
                alert(text: "Valores não aceitáveis para a opção Quantidade de senhas: zero ou maior que 99")
            }
        }
        
        if numbers != nil {
             if numbers == 0 || numbers! > 16 {
                alert(text: "Valores não aceitáveis para a opção Total de caracteres: zero ou maior que 16")
            }
        }
    }
    
    func alert(text: String){
        let alert = UIAlertController(title:"Atenção", message: text, preferredStyle:UIAlertController.Style.alert )

        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: {
                _ in print("FOO ")
        }))

        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordViewController
        
        // forma mais segura (usar if let)
        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            // se conseguir obter o valor do campo e converter para inteiro
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        if let numberOfCharacters = Int(tfNumberOfCharacters.text!) {
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCaptitalLetters.isOn
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
        
        // forcar encerrar o modo de edicao // remove o foco e libera teclado
        view.endEditing(true)
    }

}

