//
//  User.swift
//  Challenger
//
//  Created by Dylan Slade on 3/23/16.
//  Copyright © 2016 Dylan Slade. All rights reserved.
//

import UIKit

class User {
    let uniqueID: String
    var username: String
    var profilePic: UIImage?
    var followers: [String] = []
    var following: [String] = []
    var friends: [String] {
        var friends: [String] = []
        for follower in self.following {
            for following in self.following {
                if follower == following {
                    friends.append(follower)
                    break // if the match is found break out to the first for loop. Short cicruit basically.
                }
            }
        }
        return friends
    }
    var sentChallenges: [String] = []
    var receivedChallenges: [String] = []
    var pendingChallenges: [String] {
        let pending = ChallengeController.sharedInstance.allChallengesForCurrentUser.filter({$0.status.rawValue == 1})
        var pendingIDs: [String] = []
        for challenge in pending {
            pendingIDs.append(challenge.uniqueID)
        }
        return pendingIDs
    }
    // Here we need to make sure we istantiate our ChallengeController before we use this computed property.
    var declinedChallenges: [String] {
        let declinedChallenges = ChallengeController.sharedInstance.allChallengesForCurrentUser.filter({$0.status.rawValue == 2})
        var declinedUniqueIds: [String] = []
        for challenge in declinedChallenges {
            declinedUniqueIds.append(challenge.uniqueID)
        }
        return declinedUniqueIds
    }
    var acceptedChallenges: [String] {
        let acceptedChallenges = ChallengeController.sharedInstance.allChallengesForCurrentUser.filter({$0.status.rawValue == 3})
        var acceptedChallengeIDs: [String] = []
        for challenge in acceptedChallenges {
            acceptedChallengeIDs.append(challenge.uniqueID)
        }
        return acceptedChallengeIDs
    }
    var failedChallenges: [String] {
        let failedChallenges = ChallengeController.sharedInstance.allChallengesForCurrentUser.filter({$0.status.rawValue == 4})
        var failedChallengeIDs: [String] = []
        for challange in failedChallenges {
            failedChallengeIDs.append(challange.uniqueID)
        }
        return failedChallengeIDs
    }
    var completedChallenges: [String] {
        let completedChallenges = ChallengeController.sharedInstance.allChallengesForCurrentUser.filter({$0.status.rawValue == 5})
        var completedChallengeIDs: [String] = []
        for challenge in completedChallenges {
            completedChallengeIDs.append(challenge.uniqueID)
        }
        return completedChallengeIDs
    }
    
    init(uniqueID: String, username: String, profilePic: UIImage?) {
        self.uniqueID = uniqueID
        self.username = username
        if let profilePic = profilePic {
            self.profilePic = profilePic
        }
    }
    
}