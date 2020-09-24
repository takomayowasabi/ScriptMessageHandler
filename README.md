# ScriptMessageHandler
하이브리드 앱을 만드는 당신의 필수 아이템.


### WKScriptMessageHandler
  
    !! 주 의 사 항 !!
    
    자바스크립트 message의 리턴 포멧은 지켜주세요 
          리턴 메세지 포멧 : {NAME : String, NAME2 : String2}
          
     window.webkit.messageHandlers.getText.postMessage(message);의
     getText가 아이디 값이고, 그 아이디 값은 WKuserContentController()에서
     .add(_:, name:)의 name 인풋에 동일하게 입력해야합니다.
