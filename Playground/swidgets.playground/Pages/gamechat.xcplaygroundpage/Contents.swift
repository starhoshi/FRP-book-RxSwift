import Foundation
import RxSwift
import RxCocoa
import UIKit
import PlaygroundSupport

let disposeBag = DisposeBag()

let view = UIView()
view.backgroundColor = .white
view.frame = CGRect(x: 0, y: 0, width: 300, height: 500)

PlaygroundPage.current.liveView = view

let onegaiButton = UIButton()
onegaiButton.setTitleColor(.blue, for: .normal)
onegaiButton.setTitle("Onegai shimasu", for: .normal)
onegaiButton.frame = CGRect(x: 10, y: 10, width: 200, height: 30)

let thanksButton = UIButton()
thanksButton.setTitleColor(.blue, for: .normal)
thanksButton.setTitle("Thank you", for: .normal)
thanksButton.frame = CGRect(x: 10, y: 110, width: 200, height: 30)

let textField = UITextField()
textField.borderStyle = .roundedRect
textField.frame = CGRect(x: 10, y: 210, width: 100, height: 30)
textField.text = "Hello"

view.addSubview(onegaiButton)
view.addSubview(thanksButton)
view.addSubview(textField)

let sOnegai = onegaiButton.rx.tap.map { "Onegai Shimasu" }
let sThanks = thanksButton.rx.tap.map { "Thank You" }
let sCanned = Observable.of(sOnegai, sThanks).merge()
sCanned.bind(to: textField.rx.text)
    .disposed(by: disposeBag)



//import javax.swing.*;
//import java.awt.FlowLayout;
//import swidgets.*;
//import nz.sodium.*;
//
//public class gamechat {
//    public static void main(String[] args) {
//    JFrame frame = new JFrame("gamechat");
//    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//    frame.setLayout(new FlowLayout());
//    SButton onegai = new SButton("Onegai shimasu");
//    SButton thanks = new SButton("Thank you");
//    Stream<String> sOnegai = onegai.sClicked.map(u ->
//    "Onegai shimasu");
//    Stream<String> sThanks = thanks.sClicked.map(u -> "Thank you");
//    Stream<String> sCanned = sOnegai.orElse(sThanks);
//    STextField text = new STextField(sCanned, "");
//    frame.add(text);
//    frame.add(onegai);
//    frame.add(thanks);
//    frame.setSize(400, 160);
//    frame.setVisible(true);
//    }
//}

