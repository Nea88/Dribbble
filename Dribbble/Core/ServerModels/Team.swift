//
//  Team.swift
//  Dribbble
//
//  Created by Sorochinskiy Dmitriy on 26.07.17.
//  Copyright © 2017 Sorochinskiy Dmitriy. All rights reserved.
//

import Foundation
import RealmSwift
import DribbbleSwift

class Team: UserAndTeamRealmModel {
    var members_count: Int!
    dynamic var members_url: String!
    dynamic var team_shots_url: String!
    let shot = LinkingObjects(fromType: Shot.self, property: "team")
    
    required convenience init?(_ team: TeamDS) {
        self.init()
        if team.id == nil { return }
        id = team.id
        name = team.name
        username = team.username
        html_url = team.html_url
        avatar_url = team.avatar_url
        bio = team.bio
        location = team.location
        links = team.links
        buckets_count = team.buckets_count
        comments_received_count = team.comments_received_count
        followers_count = team.followers_count
        followings_count = team.followings_count
        likes_count = team.likes_count
        likes_received_count = team.likes_received_count
        projects_count = team.projects_count
        rebounds_received_count = team.rebounds_received_count
        shots_count = team.shots_count
        can_upload_shot = team.can_upload_shot
        type = team.type
        pro = team.pro
        buckets_url = team.buckets_url
        followers_url = team.followers_url
        following_url = team.following_url
        likes_url = team.likes_url
        projects_url = team.projects_url
        shots_url = team.shots_url
        teams_url = team.teams_url
        created_at = team.created_at
        updated_at = team.updated_at
        teams_count = team.teams_count
        members_count = team.teams_count
        members_url = team.members_url
        team_shots_url = team.team_shots_url
    }
}
