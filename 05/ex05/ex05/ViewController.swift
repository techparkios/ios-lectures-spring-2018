//
//  ViewController.swift
//  ex05
//
//  Created by Gennady Evstratov on 3/21/18.
//  Copyright © 2018 TechPark. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate {

    let authorizedKey = "authorized"

    let bView = BezierView(frame: CGRect(x: 10, y: 300, width: 60, height: 60))
    let innerView = UIView(frame: CGRect(x: 30, y:30, width: 60, height: 60))
    let testView = UIControl(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
    var isLoggedIn: Bool {
        return UserDefaults.standard.bool(forKey: authorizedKey)
    }

    var initialCorner = CGPoint.zero


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        testView.backgroundColor = .magenta
        view.addSubview(testView)

        innerView.backgroundColor = .blue
        bView.addSubview(innerView)

        bView.backgroundColor = .red
        bView.clipsToBounds = true
        view.addSubview(bView)

        testView.layer.cornerRadius = 10.0
        testView.layer.borderColor = UIColor.blue.cgColor
        testView.layer.borderWidth = 5.0

        if isLoggedIn {
            doTheDance()
        }

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(recognizerAction(recognizer:)))
        testView.addGestureRecognizer(tapRecognizer)

        let panRecognizer  = UIPanGestureRecognizer(target: self, action: #selector(panRecognizerAction(recognizer:)))
        testView.addGestureRecognizer(panRecognizer)
    }

    @objc
    func recognizerAction(recognizer: UIGestureRecognizer) {
        switch recognizer.state {
        case .ended:
            let alert = UIAlertController(title: "hey", message: "View tapped!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: { _ in

            }))

            present(alert, animated: true, completion: nil)

        default:
            break
        }
    }

    @objc
    func panRecognizerAction(recognizer: UIGestureRecognizer) {
        switch recognizer.state {
        case .began:
            view.insertSubview(testView, aboveSubview: bView)
            initialCorner = testView.frame.origin

        case .changed:
            let pr = recognizer as! UIPanGestureRecognizer
            let t = pr.translation(in: view)
            var f = testView.frame
            f.origin = CGPoint(x: initialCorner.x + t.x, y: initialCorner.y + t.y)
            testView.frame = f

        case .ended:
            initialCorner = CGPoint.zero
            view.insertSubview(bView, aboveSubview: testView)

        default:
            break
        }
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if !isLoggedIn {
            let alert = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondcontroller") as! SecondViewController
            alert.delegate = self
            present(alert, animated: false, completion: nil)
        }
    }

    func passwordAccepted() {
        UserDefaults.standard.set(true, forKey: authorizedKey)

        dismiss(animated: true) {
            self.doTheDance()
        }
    }

    @objc
    func didTap(_ sender: Any?) {
        let alert = UIAlertController(title: "hey", message: "View tapped!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: { _ in

        }))

        present(alert, animated: true, completion: nil)
    }

    func doTheDance() {
        testView.isHidden = false

        UIView.animate(withDuration: 1.0, animations: {
            self.testView.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
            self.testView.alpha = 0.0
        }) { _ in
            UIView.animate(withDuration: 1.0) {
                self.testView.alpha = 1.0
                self.testView.transform = CGAffineTransform.init(rotationAngle: .pi/2)
            }
        }
    }

}

