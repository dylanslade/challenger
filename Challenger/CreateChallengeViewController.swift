//
//  CreateChallengeViewController.swift
//  Challenger
//
//  Created by Dylan Slade on 4/5/16.
//  Copyright © 2016 Dylan Slade. All rights reserved.
//

import UIKit

class CreateChallengeViewController: UIViewController {
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var challengeTextView: UITextView!
    @IBOutlet var timeTextField: UITextField!
    @IBOutlet var timePicker: UIPickerView!
    
    @IBAction func doneButtonTapped(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func sendChallengeButtonTapped(sender: UIButton) {
       ChallengeController.sharedInstance.createChallenge("Brush your teeth", totalSeconds: 34, senderID: "1f5c88e5-0a94-46bc-918c-05b17b5687aa", receiverID: "d2c0f814-579c-4ec9-b47c-86dac5a3ef2e", status: ChallengeStatus.pending)
//        ChallengeController.sharedInstance.createChallenge("Do twenty pushups", totalSeconds: 20, senderID: "1f5c88e5-0a94-46bc-918c-05b17b5687aa", receiverID: "d2c0f814-579c-4ec9-b47c-86dac5a3ef2e", status: ChallengeStatus.pending)
//        ChallengeController.sharedInstance.createChallenge("text your mom/dad", totalSeconds: 5, senderID: "1f5c88e5-0a94-46bc-918c-05b17b5687aa", receiverID: "d2c0f814-579c-4ec9-b47c-86dac5a3ef2e", status: ChallengeStatus.pending)
//        ChallengeController.sharedInstance.createChallenge("Read the first chapter of Moby Dick", totalSeconds: 1000, senderID: "1f5c88e5-0a94-46bc-918c-05b17b5687aa", receiverID: "d2c0f814-579c-4ec9-b47c-86dac5a3ef2e", status: ChallengeStatus.pending)
//        ChallengeController.sharedInstance.createChallenge("delete four emails", totalSeconds: 120, senderID: "1f5c88e5-0a94-46bc-918c-05b17b5687aa", receiverID: "d2c0f814-579c-4ec9-b47c-86dac5a3ef2e", status: ChallengeStatus.pending)
//        ChallengeController.sharedInstance.createChallenge("Ask your crush out", totalSeconds: 360, senderID: "1f5c88e5-0a94-46bc-918c-05b17b5687aa", receiverID: "d2c0f814-579c-4ec9-b47c-86dac5a3ef2e", status: ChallengeStatus.pending)
//        ChallengeController.sharedInstance.createChallenge("Eat a vegetable", totalSeconds: 700, senderID: "1f5c88e5-0a94-46bc-918c-05b17b5687aa", receiverID: "d2c0f814-579c-4ec9-b47c-86dac5a3ef2e", status: ChallengeStatus.pending)
//        ChallengeController.sharedInstance.createChallenge("Think about what your next big move on life is going to be", totalSeconds: 1040, senderID: "1f5c88e5-0a94-46bc-918c-05b17b5687aa", receiverID: "d2c0f814-579c-4ec9-b47c-86dac5a3ef2e", status: ChallengeStatus.pending)
//        ChallengeController.sharedInstance.createChallenge("Rate this app", totalSeconds: 180, senderID: "1f5c88e5-0a94-46bc-918c-05b17b5687aa", receiverID: "d2c0f814-579c-4ec9-b47c-86dac5a3ef2e", status: ChallengeStatus.pending)
        
        guard let paggeViewController = self.presentingViewController?.childViewControllers[1].childViewControllers[0] as? ChallengePageViewController else { return }
        if let _ = UserController.sharedInstance.currentUser {
            if let firstVC = paggeViewController.viewControllerDataSource?.first { // Here is the culprit for that bug.
                paggeViewController.setViewControllers([firstVC], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
            } else {
                paggeViewController.setViewControllers([(storyboard?.instantiateViewControllerWithIdentifier("PVCNilCase"))!], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
                print("user has no challenges")
            }
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeTextField.inputView = timePicker
//        self.userNameTextField.becomeFirstResponder()
        
    }
    
}
