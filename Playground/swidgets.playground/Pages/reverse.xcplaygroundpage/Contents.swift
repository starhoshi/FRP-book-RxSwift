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
textField.frame = CGRect(x: 10, y: 110, width: 100, height: 30)
textField.text = "10"

let label = UILabel()
label.frame = CGRect(x: 10, y: 210, width: 100, height: 30)

view.addSubview(textField)
view.addSubview(label)

let reversed = textField.rx.text.orEmpty
    .map { String($0.characters.reversed()) }
    .asObservable()

reversed
    .bind(to: label.rx.text)
    .disposed(by: disposeBag)

//import javax.swing.*;
//import java.awt.FlowLayout;
//import swidgets.*;
//import nz.sodium.*;
//
//public class reverse {
//    public static void main(String[] args) {
//    JFrame frame = new JFrame("reverse");
//    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//    frame.setLayout(new FlowLayout());
//    STextField msg = new STextField("Hello");
//    Cell<String> reversed = msg.text.map(t ->
//    new StringBuilder(t).reverse().toString());
//    SLabel lbl = new SLabel(reversed);
//    frame.add(msg);
//    frame.add(lbl);
//    frame.setSize(400, 160);
//    frame.setVisible(true);
//    }
//}

