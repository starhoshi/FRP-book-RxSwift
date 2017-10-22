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

let bTextField = UITextField()
bTextField.borderStyle = .roundedRect
bTextField.frame = CGRect(x: 10, y: 110, width: 100, height: 30)
bTextField.text = "10"

let sumLabel = UILabel()
sumLabel.frame = CGRect(x: 10, y: 210, width: 100, height: 30)

view.addSubview(aTextField)
view.addSubview(bTextField)
view.addSubview(sumLabel)

let aCell = aTextField.rx.text.orEmpty
    .asObservable()
    .map { Int($0) }
    .map { $0 ?? 0}

let bCell = bTextField.rx.text.orEmpty
    .asObservable()
    .map { Int($0) }
    .map { $0 ?? 0}

Observable.combineLatest(aCell, bCell)
    .map { $0.0 + $0.1}
    .map { $0.description }
    .bind(to: sumLabel.rx.text)
    .disposed(by: disposeBag)




//import javax.swing.*;
//import java.awt.FlowLayout;
//import swidgets.*;
//import nz.sodium.*;
//
//public class add {
//    public static void main(String[] args) {
//    JFrame frame = new JFrame("add");
//    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//    frame.setLayout(new FlowLayout());
//    STextField txtA = new STextField("5");
//    STextField txtB = new STextField("10");
//    Cell<Integer> a = txtA.text.map(t -> parseInt(t));
//    Cell<Integer> b = txtB.text.map(t -> parseInt(t));
//    Cell<Integer> sum = a.lift(b, (a_, b_) -> a_ + b_);
//    SLabel lblSum = new SLabel(sum.map(i -> Integer.toString(i)));
//    frame.add(txtA);
//    frame.add(txtB);
//    frame.add(lblSum);
//    frame.setSize(400, 160);
//    frame.setVisible(true);
//    }
//    private static Integer parseInt(String t) {
//    try {
//    return Integer.parseInt(t);
//    } catch (NumberFormatException e) {
//    return 0;
//    }
//    }
//}

