//
//  ViewController.swift
//  ScriptMessageHandler
//
//  Created by Jakob Tak on 2020. 09. 24..
//

import UIKit
import WebKit

class ViewController: UIViewController, WKScriptMessageHandler {
    
    var webView : WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setWebView()
        loadPage()
    }
}

//함수 모음.
extension ViewController{
    //-------------------------------------------------------------------------------------------
    //                                   스토리 보드 사용시 삭제.
    func setWebView() {//<-----------------------------------------------------------------------
        self.webView = WKWebView(frame: self.view.bounds, configuration: self.getWKWebViewConfiguration())
        self.view.addSubview(self.webView)
    }
    
    //-------------------------------------------------------------------------------------------
    //                                  웹뷰 원하시는 곳으로 쏘세요.
    func loadPage() {//<-------------------------------------------------------------------------
        if let url = Bundle.main.url(forResource: "getText", withExtension: "html") {
            self.webView.load(URLRequest(url: url))
        }
    }
    
    func getWKWebViewConfiguration() -> WKWebViewConfiguration {
        let receiver = WKUserContentController()
        //---------------------------------------------------------------------------------------
        //                                               자바스크립트함수에서 지정한 이름 입력해야 합니다.
        receiver.add(self, name: "getText")//<<--------------------------------------------------
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = receiver
        return configuration
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if let data = message.body as? [String : String], let text = data["text"]{
            //-----------------------------------------------------------------------------------
            //                                                리턴된 String 값으로 처리할 함수 호출.
            showText(text: text)//<--------------------------------------------------------------
        }
    }
    
   func showText(text: String) {
        let alertController = UIAlertController(title: "ShowText", message: text, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }

}

