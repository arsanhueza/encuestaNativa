//
//  ViewController.swift
//  encuestaNativa
//
//  Created by Arturo Sanhueza on 21-06-18.
//  Copyright © 2018 Arturo Sanhueza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var indicadorPregunta = Int()
    var arrayBotones = [UIButton]()
    var arrayPreguntas = [String]()
    var arrayOpcionesPregunta = [Array<String>]()
    @IBOutlet weak var labelEncabezado:UILabel!
    @IBOutlet weak var labelPregunta:UILabel!
    @IBOutlet weak var labelContadorPreguntas:UILabel!
    @IBOutlet weak var contenidoTexto:UITextView!
    @IBOutlet weak var barraDeProgreso:UIProgressView!
    @IBOutlet weak var botonAvanzar:UIButton!
    @IBOutlet weak var botonRetroceder:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    indicadorPregunta = 0
    arrayPreguntas = ["Pregunta 1","Pregunta 2","Pregunta 3","Pregunta 4","Pregunta 5"]
    arrayOpcionesPregunta = [["a) primera alternativa","b) segunda alternativa","c) tercera alternativa"],[" P2 primera alternativa","segunda alternativa","tercera alternativa"],["P3 primera alternativa","segunda alternativa","tercera alternativa"], ["P4 primera alternativa","segunda alternativa","tercera alternativa"],["P5 primera alternativa","segunda alternativa","tercera alternativa"]]

        contenidoTexto.removeFromSuperview()
        seleccionarOpciones()
        
        botonAvanzar.addTarget(self, action: #selector(irSiguientePregunta), for: .touchUpInside)
        botonRetroceder.addTarget(self, action: #selector(irPreguntaAnterior), for: .touchUpInside)
    }

    func seleccionarOpciones(){
        
        let opciones = arrayOpcionesPregunta[indicadorPregunta]
        progresoBarra()
    for object in opciones {

    let index = opciones.index(of: object) as! Int
    let factorDinamicoDePosicion = CGFloat(index * 40)
    let button = UIButton(type: .system)
    button.frame = CGRect(x: 20.0, y: factorDinamicoDePosicion + 200.0, width: 200.0, height: 40.0)
    button.setTitle(object, for: .normal)
    button.setTitleColor(UIColor.blue, for: .normal)
    button.addTarget(self, action: #selector(seleccionarBotonAlternativa), for: .touchUpInside)
    arrayBotones.append(button)
    self.view.addSubview(button)
        }
    }
    
    @objc func seleccionarBotonAlternativa() {
        
        /// acá se desencadenan los eventos visuales de seleccionar una alternativa
    }


    @objc func irSiguientePregunta(){

        if(indicadorPregunta < arrayPreguntas.count - 1){

        indicadorPregunta = indicadorPregunta + 1
        labelPregunta.text = arrayPreguntas[indicadorPregunta]
        eliminarAternativas()
            seleccionTextoIndicadorPregunta()
            seleccionarOpciones()
            progresoBarra()
        }
    }
    
    @objc func irPreguntaAnterior(){
        
        if(indicadorPregunta > 0){
        indicadorPregunta = indicadorPregunta - 1
        eliminarAternativas()
        seleccionarOpciones()
        labelPregunta.text = arrayPreguntas[indicadorPregunta]
            seleccionTextoIndicadorPregunta()
            progresoBarra()
        }
    }
    
    func eliminarAternativas(){
        
        for boton in arrayBotones{
            
            boton.removeFromSuperview()
        }

    }
    
    func seleccionTextoIndicadorPregunta(){
        
        
        let textoContadorPreguntas = String("número pregunta" +  String(indicadorPregunta + 1) + "/" + String(arrayPreguntas.count))
        labelContadorPreguntas.text = textoContadorPreguntas
        
    }
    
    func progresoBarra(){
        
        
        self.barraDeProgreso.setProgress(Float(indicadorPregunta/self.arrayPreguntas.count), animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

