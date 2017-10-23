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

let redButton = UIButton()
redButton.setTitleColor(.blue, for: .normal)
redButton.setTitle("red", for: .normal)
redButton.frame = CGRect(x: 10, y: 10, width: 200, height: 30)

let greenButton = UIButton()
greenButton.setTitleColor(.blue, for: .normal)
greenButton.setTitle("green", for: .normal)
greenButton.frame = CGRect(x: 10, y: 110, width: 200, height: 30)

let label = UILabel()
label.frame = CGRect(x: 10, y: 210, width: 100, height: 30)
label.text = "Hello"

view.addSubview(redButton)
view.addSubview(greenButton)
view.addSubview(label)

let sRed = redButton.rx.tap.map { "Red" }
let sGreen = greenButton.rx.tap.map { "Green" }
let sColor = Observable.of(sRed, sGreen).merge()
let color = BehaviorSubject(value: "")
sColor.subscribe(color)
color.bind(to: label.rx.text)



//import javax.swing.*;
//import java.awt.FlowLayout;
//import swidgets.*;
//import nz.sodium.*;
//
//public class redgreen {
//    public static void main(String[] args) {
//    JFrame frame = new JFrame("redgreen");
//    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//    frame.setLayout(new FlowLayout());
//    SButton red = new SButton("red");
//    SButton green = new SButton("green");
//    Stream<String> sRed = red.sClicked.map(u -> "red");
//    Stream<String> sGreen = green.sClicked.map(u -> "green");
//    Stream<String> sColor = sRed.orElse(sGreen);
//    Cell<String> color = sColor.hold("");
//    SLabel lbl = new SLabel(color);
//    frame.add(red);
//    frame.add(green);
//    frame.add(lbl);
//    frame.setSize(400, 160);
//    frame.setVisible(true);
//    }
//}

