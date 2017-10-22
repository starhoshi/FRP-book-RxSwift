import Foundation
import RxSwift
import RxCocoa
import UIKit
import PlaygroundSupport

let disposeBag = DisposeBag()

let view = UIView()
view.backgroundColor = .white
view.frame = CGRect(x: 0, y: 0, width: 300, height: 500)

PlaygroundPage.current.needsIndefiniteExecution = true
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

func unluckey(date: Date) -> Bool {
    return Int(date.timeIntervalSince1970) % 4 == 0
}

class Rule {
    typealias F = (Date, Date) -> Bool
    let f: F
    init(_ f: @escaping F) {
        self.f = f
    }

    func rerify(dep: Observable<Date>, ret: Observable<Date>) -> Observable<Bool> {
        return Observable.combineLatest(depDatePicker.rx.date.asObservable(),retDatePicker.rx.date.asObservable())
            .map { $0.0 < $0.1 }
    }

//    func and(other: Rule) {
//
//    }
}

//import javax.swing.*;
//import java.awt.*;
//import java.util.Calendar;
//import swidgets.*;
//import nz.sodium.*;
//
//class Rule {
//    public Rule(Lambda2<Calendar, Calendar, Boolean> f) {
//    this.f = f;
//    }
//    public final Lambda2<Calendar, Calendar, Boolean> f;
//    public Cell<Boolean> reify(Cell<Calendar> dep, Cell<Calendar> ret) {
//    return dep.lift(ret, f);
//    }
//    public Rule and(Rule other) {
//    return new Rule(
//    (d, r) -> this.f.apply(d, r) && other.f.apply(d, r)
//    );
//    }
//}
//
//public class airline2 {
//    private static boolean unlucky(Calendar dt) {
//    int day = dt.get(Calendar.DAY_OF_MONTH);
//    return day == 4 || day == 14 || day == 24;
//    }
//    public static void main(String[] args) {
//    JFrame view = new JFrame("airline2");
//    view.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//
//    SDateField dep = new SDateField();
//    SDateField ret = new SDateField();
//    Rule r1 = new Rule((d, r) -> d.compareTo(r) <= 0);
//    Rule r2 = new Rule((d, r) -> !unlucky(d) && !unlucky(r));
//    Rule r = r1.and(r2);
//    Cell<Boolean> valid = r.reify(dep.date, ret.date);
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

