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
//public class spinner {
//    public static void main(String[] args) {
//    JFrame view = new JFrame("spinner");
//    view.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//    view.setLayout(new FlowLayout());
//    Transaction.runVoid(() -> {
//    CellLoop<Integer> value = new CellLoop<>();
//    SLabel lblValue = new SLabel(
//    value.map(i -> Integer.toString(i)));
//    SButton plus = new SButton("+");
//    SButton minus = new SButton("-");
//    view.add(lblValue);
//    view.add(plus);
//    view.add(minus);
//    Stream<Integer> sPlusDelta = plus.sClicked.map(u -> 1);
//    Stream<Integer> sMinusDelta = minus.sClicked.map(u -> -1);
//    Stream<Integer> sDelta = sPlusDelta.orElse(sMinusDelta);
//    Stream<Integer> sUpdate = sDelta.snapshot(value,
//    (delta, value_) -> delta + value_
//    );
//    value.loop(sUpdate.hold(0));
//    });
//    view.setSize(400, 160);
//    view.setVisible(true);
//    }
//}

