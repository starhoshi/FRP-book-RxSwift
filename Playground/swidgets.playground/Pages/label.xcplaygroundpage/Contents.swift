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

let aTextField = UITextField()
aTextField.borderStyle = .roundedRect
aTextField.frame = CGRect(x: 10, y: 10, width: 100, height: 30)
aTextField.text = "5"

let label = UILabel()
label.frame = CGRect(x: 10, y: 210, width: 100, height: 30)

view.addSubview(aTextField)
view.addSubview(label)

aTextField.rx.text.asObservable()
    .bind(to: label.rx.text)
    .disposed(by: disposeBag)

//import javax.swing.*;
//import java.awt.FlowLayout;
//import swidgets.*;
//import nz.sodium.*;
//
//public class label {
//    public static void main(String[] args) {
//    JFrame frame = new JFrame("label");
//    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//    frame.setLayout(new FlowLayout());
//    STextField msg = new STextField("Hello");
//    SLabel lbl = new SLabel(msg.text);
//    frame.add(msg);
//    frame.add(lbl);
//    frame.setSize(400, 160);
//    frame.setVisible(true);
//    }
//}

