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

let textField = UITextField()
textField.borderStyle = .roundedRect
textField.frame = CGRect(x: 10, y: 10, width: 100, height: 30)
textField.text = ""

let translateButton = UIButton()
translateButton.setTitleColor(.blue, for: .normal)
translateButton.setTitle("translate", for: .normal)
translateButton.frame = CGRect(x: 10, y: 210, width: 100, height: 30)

let label = UILabel()
label.frame = CGRect(x: 10, y: 410, width: 400, height: 30)

view.addSubview(textField)
view.addSubview(translateButton)
view.addSubview(label)

// この書き方じゃダメっぽい
let sLatin = Observable.combineLatest(translateButton.rx.tap, textField.rx.text.asObservable())
    .map { $0.1 }
    .filter { $0 != nil}
    .map { $0!}
    .map { $0.split(separator: " ") }
    .map { $0.joined(separator: "us ") + "us" }

let latin = BehaviorSubject(value: "")
sLatin.subscribe(latin)
latin.bind(to: label.rx.text)


//import javax.swing.*;
//import java.awt.*;
//import java.awt.event.*;
//import swidgets.*;
//import nz.sodium.*;
//
//public class translate {
//    public static void main(String[] args) {
//    JFrame view = new JFrame("Translate");
//    view.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//    view.setLayout(new FlowLayout());
//    STextField english = new STextField("I like FRP");
//    SButton translate = new SButton("Translate");
//    Stream<String> sLatin =
//    translate.sClicked.snapshot(english.text, (u, txt) ->
//    txt.trim().replaceAll(" |$", "us ").trim()
//    );
//    Cell<String> latin = sLatin.hold("");
//    SLabel lblLatin = new SLabel(latin);
//    view.add(english);
//    view.add(translate);
//    view.add(lblLatin);
//    view.setSize(400, 160);
//    view.setVisible(true);
//    }
//}

