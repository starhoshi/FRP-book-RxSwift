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
textField.text = "Hello"

let clearButton = UIButton()
clearButton.setTitleColor(.blue, for: .normal)
clearButton.setTitle("clear", for: .normal)
clearButton.frame = CGRect(x: 10, y: 210, width: 100, height: 30)

view.addSubview(textField)
view.addSubview(clearButton)

clearButton.rx.tap
    .subscribe(onNext: {
        textField.text = ""
    })
    .disposed(by: disposeBag)


//import javax.swing.*;
//import java.awt.FlowLayout;
//import swidgets.*;
//import nz.sodium.*;
//
//public class clearfield {
//    public static void main(String[] args) {
//    JFrame frame = new JFrame("clearfield");
//    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//    frame.setLayout(new FlowLayout());
//    SButton clear = new SButton("Clear");
//    Stream<String> sClearIt = clear.sClicked.map(u -> "");
//    STextField text = new STextField(sClearIt, "Hello");
//    frame.add(text);
//    frame.add(clear);
//    frame.setSize(400, 160);
//    frame.setVisible(true);
//    }
//}

