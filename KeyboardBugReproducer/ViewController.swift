//
//  ViewController.swift
//  KeyboardBugReproducer
//
//  Created by Zack Sheppard on 11/29/17.
//  Copyright © 2017 Zack Sheppard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var secondsSinceLabel: UILabel?

    var lastNotificationTimestamp: Date?

    var updateTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillChangeFrame,
                                               object: nil, queue: nil) { [weak self](notif) in
                                                self?.didReceiveNotification()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        if (updateTimer == nil) {
            updateTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(1), repeats: true, block: { [weak self](timer) in
                self?.timerTick()
            })
        }
    }

    func timerTick() {
        guard let lastTime = self.lastNotificationTimestamp else {
            self.secondsSinceLabel?.text = "Not yet fired"
            return
        }

        let secondsAgo = Int(lastTime.timeIntervalSinceNow) * -1
        self.secondsSinceLabel?.text = String(secondsAgo)
    }

    func didReceiveNotification() {
        self.lastNotificationTimestamp = Date()
        self.timerTick()
    }
}

