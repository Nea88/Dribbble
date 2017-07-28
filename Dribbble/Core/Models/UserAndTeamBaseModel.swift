//
//  UserAndTeamBaseModel.swift
//  Dribbble
//
//  Created by Sorochinskiy Dmitriy on 26.07.17.
//  Copyright © 2017 Sorochinskiy Dmitriy. All rights reserved.
//

import Foundation
import RealmSwift
import DribbbleSwift

class UserAndTeamRealmModel: DribbbleObject {
    dynamic var name: String!
    dynamic var username: String!
    dynamic var html_url: String!
    dynamic var avatar_url: String!
    dynamic var bio: String!
    dynamic var location: String!
    var links: (web: String?, twitter: String?)
    var buckets_count: Int!
    var comments_received_count: Int!
    var followers_count: Int!
    var followings_count: Int!
    var likes_count: Int!
    var likes_received_count: Int!
    var projects_count: Int!
    var rebounds_received_count: Int!
    var shots_count: Int!
    var can_upload_shot: Bool!
    dynamic var type: String!
    var pro: Bool!
    dynamic var buckets_url: String!
    dynamic var followers_url: String!
    dynamic var following_url: String!
    dynamic var likes_url: String!
    dynamic var projects_url: String!
    dynamic var shots_url: String!
    dynamic var teams_url: String!
    dynamic var created_at: String!
    dynamic var updated_at: String!
    var teams_count: Int!
}
