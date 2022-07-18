//
//  ViewController.swift
//  Sample1
//
//  Created by 홍길동 on 2022/07/11.
//

import SwiftUI

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnPre: UIButton!
    @IBOutlet weak var btnAfter: UIButton!

    
    var imgeNM = ["01.png","02.png","03.png","04.png","05.png","06.png"]
    var iNM = 0
    
    override func viewDidLoad() {

        imgView.image = UIImage(named: imgeNM[iNM])
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func chIMG(){
        
        if(iNM == -1){
            iNM = 5
        }
        else if(iNM == 6){
            iNM = 0
        }
        print(iNM)
        imgView.image = UIImage(named: imgeNM[iNM])
    }

    @IBAction func btnCkPre(_ sender: UIButton) {
        
        iNM = iNM - 1
        chIMG()
    }
    
    @IBAction func btnCkAfter(_ sender: UIButton) {

        iNM = iNM + 1
        chIMG()
    }
    
}
