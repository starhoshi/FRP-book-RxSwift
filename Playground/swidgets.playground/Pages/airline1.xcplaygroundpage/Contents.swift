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

let depDatePicker = UIDatePicker()
depDatePicker.frame = CGRect(x: 0, y: 0, width: 300, height: 200)

let retDatePicker = UIDatePicker()
retDatePicker.date = depDatePicker.date
retDatePicker.frame = CGRect(x: 0, y: 210, width: 300, height: 200)

let okButton = UIButton()
okButton.setTitleColor(.blue, for: .normal)
okButton.setTitle("OK", for: .normal)
okButton.frame = CGRect(x: 10, y: 410, width: 100, height: 30)

view.addSubview(depDatePicker)
view.addSubview(retDatePicker)
view.addSubview(okButton)

var d = depDatePicker.rx.date.asObservable()

Observable.combineLatest(depDatePicker.rx.date.asObservable(),retDatePicker.rx.date.asObservable())
                        .map { $0.0 < $0.1 }
                        .subscribe(onNext: { valid in
                            okButton.isEnabled = valid
                            okButton.alpha = valid ? 1.0 : 0.5
                        })
                        .disposed(by: disposeBag)


//import javax.swing.*;
//import java.awt.*;
//import java.util.Calendar;
//import swidgets.*;
//import nz.sodium.*;
//
//public class airline1 {
//    public static void main(String[] args) {
//    JFrame view = new JFrame("airline1");
//    view.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//
//    SDateField dep = new SDateField();
//    SDateField ret = new SDateField();
//    Cell<Boolean> valid = dep.date.lift(ret.date,
//    (d, r) -> d.compareTo(r) <= 0);
//    SButton ok = new SButton("OK", valid);
//
//    GridBagLayout gridbag = new GridBagLayout();
//    view.setLayout(gridbag);
//    GridBagConstraints c = new GridBagConstraints();
//    c.fill = GridBagConstraints.HORIZONTAL;
//    c.gridwidth = 1;
//    c.gridheight = 1;
//    c.gridx = 0;
//    c.gridy = 0;
//    c.weightx = 0.0;
//    view.add(new JLabel("departure"), c);
//    c.gridx = 1;
//    c.gridy = 0;
//    c.weightx = 1.0;
//    view.add(dep, c);
//    c.gridwidth = 1;
//    c.gridheight = 1;
//    c.gridx = 0;
//    c.gridy = 1;
//    c.weightx = 0.0;
//    view.add(new JLabel("return"), c);
//    c.gridx = 1;
//    c.gridy = 1;
//    c.weightx = 1.0;
//    view.add(ret, c);
//    c.fill = GridBagConstraints.NONE;
//    c.gridwidth = 2;
//    c.gridx = 0;
//    c.gridy = 2;
//    c.weightx = 1.0;
//    view.add(ok, c);
//    view.setSize(380, 140);
//    view.setVisible(true);
//    }
//}

