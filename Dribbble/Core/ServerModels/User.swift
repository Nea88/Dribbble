//
//  User.swift
//  Dribbble
//
//  Created by Sorochinskiy Dmitriy on 26.07.17.
//  Copyright © 2017 Sorochinskiy Dmitriy. All rights reserved.
//

import Foundation
import RealmSwift
import DribbbleSwift

class User: UserAndTeamRealmModel {
    dynamic var team: Team!
    let shot = LinkingObjects(fromType: Shot.self, property: "user")
    
    required convenience init?(_ user: UserDS) {
        self.init()
        
        id = user.id
        name = user.name
        username = user.username
        html_url = user.html_url
        avatar_url = user.avatar_url
        bio = user.bio
        location = user.location
        links = user.links
        buckets_count = user.buckets_count
        comments_received_count = user.comments_received_count
        followers_count = user.followers_count
        followings_count = user.followings_count
        likes_count = user.likes_count
        likes_received_count = user.likes_received_count
        projects_count = user.projects_count
        rebounds_received_count = user.rebounds_received_count
        shots_count = user.shots_count
        can_upload_shot = user.can_upload_shot
        type = user.type
        pro = user.pro
        buckets_url = user.buckets_url
        followers_url = user.followers_url
        following_url = user.following_url
        likes_url = user.likes_url
        projects_url = user.projects_url
        shots_url = user.shots_url
        teams_url = user.teams_url
        created_at = user.created_at
        updated_at = user.updated_at
        teams_count = user.teams_count
        team = user.team != nil ? Team(user.team!) : nil
    }
}
