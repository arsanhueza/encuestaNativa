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
    var arrayLabels = [UILabel]()
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
        arrayOpcionesPregunta = [["a)  Primera alternativa","b)  Segunda alternativa","c)  Tercera alternativa", "d)  Cuarta alternativa"],["a)  Primera alternativa","b)  Segunda alternativa","c)  Tercera alternativa","d)  Cuarta alternativa"],["a)  Primera alternativa","b)  Segunda alternativa","c)  Tercera alternativa", "d)  Cuarta alternativa"], ["a)  Primera alternativa","b)  Segunda alternativa","c)  Tercera alternativa", "d)  Cuarta alternativa"],["a)  Primera alternativa","b)  Segunda alternativa","c)  Tercera alternativa", "d)  Cuarta alternativa"]]

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
    let labelTextoAlternativa = UILabel(frame: CGRect(x: 20.0, y: factorDinamicoDePosicion + 200.0, width: 200.0, height: 40.0))
    labelTextoAlternativa.font = UIFont(name: "HelveticaNeue", size:14.0)
    labelTextoAlternativa.text = object
    button.frame = CGRect(x: 28.0, y: factorDinamicoDePosicion + 205.0, width: 200.0, height: 40.0)
    
    button.tintColor = UIColor.lightGray
    button.setImage((UIImage(named: "rectangulo.png")), for: .normal)
    button.addTarget(self, action: #selector(seleccionarBotonAlternativa), for: .touchUpInside)
    arrayBotones.append(button)
    arrayLabels.append(labelTextoAlternativa)
    self.view.addSubview(button)
    self.view.addSubview(labelTextoAlternativa)
        
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
        
        for label in arrayLabels{
            
            label.removeFromSuperview()
        }

    }
    
    func seleccionTextoIndicadorPregunta(){
        
        
        let textoContadorPreguntas = String("número pregunta" +  String(indicadorPregunta + 1) + "/" + String(arrayPreguntas.count))
        labelContadorPreguntas.text = textoContadorPreguntas
        
    }
    
    func progresoBarra(){
        
        let progresoFloat = Float(indicadorPregunta + 1)/Float(arrayPreguntas.count)
        
        print(progresoFloat)
        
        self.barraDeProgreso.setProgress(progresoFloat, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

