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

do {
//    let value = PublishSubject<Int>()
    let value = BehaviorSubject<Int>(value: 0)

    let label = UILabel()
    label.frame = CGRect(x: 10, y: 210, width: 100, height: 30)
    label.text = ""

    value
        .map { $0.description }
        .bind(to: label.rx.text)

    let plusButton = UIButton()
    plusButton.setTitleColor(.blue, for: .normal)
    plusButton.setTitle("+", for: .normal)
    plusButton.frame = CGRect(x: 10, y: 10, width: 200, height: 30)

    let minusButton = UIButton()
    minusButton.setTitleColor(.blue, for: .normal)
    minusButton.setTitle("-", for: .normal)
    minusButton.frame = CGRect(x: 10, y: 110, width: 200, height: 30)

    view.addSubview(label)
    view.addSubview(plusButton)
    view.addSubview(minusButton)

    let sPlusDelta = plusButton.rx.tap.map { 1 }
    let sMinusDelta = minusButton.rx.tap.map { -1 }
    let sDelta = Observable.merge(sPlusDelta, sMinusDelta)
    let sUpdate = sDelta.withLatestFrom(value) { d, v in
        return d + v
    }
    sUpdate.bind(to: value)
}

//let sRed = redButton.rx.tap.map { "Red" }
//let sGreen = greenButton.rx.tap.map { "Green" }
//let sColor = Observable.of(sRed, sGreen).merge()
//let color = BehaviorSubject(value: "")
//sColor.subscribe(color)
//color.bind(to: label.rx.text)


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

