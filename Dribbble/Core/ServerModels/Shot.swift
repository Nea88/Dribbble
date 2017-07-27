//
//  Shot.swift
//  Dribbble
//
//  Created by Sorochinskiy Dmitriy on 26.07.17.
//  Copyright © 2017 Sorochinskiy Dmitriy. All rights reserved.
//

import Foundation
import RealmSwift
import DribbbleSwift

class Shot: Object {
    dynamic var id = 0
    dynamic var title : String!
    dynamic var shotDescription : String!
    var width: Int!
    var height: Int!
    dynamic var images: Images!
    var views_count : Int!
    var likes_count :  Int!
    var comments_count : Int!
    var attachments_count: Int!
    var rebounds_count: Int!
    var buckets_count: Int!
    dynamic var created_at: String!
    dynamic var updated_at: String!
    dynamic var html_url: String!
    dynamic var attachments_url: String!
    dynamic var buckets_url: String!
    dynamic var comments_url: String!
    dynamic var likes_url: String!
    dynamic var projects_url: String!
    dynamic var rebounds_url: String!
    var animated: Bool!
    var tags = List<StringObject>()
    dynamic var user: User!
    dynamic var team: Team!
    
    override static func primaryKey() -> String? {
        return "id"
    }

    required convenience init?(_ shot: ShotsDS) {
        self.init()
        id = shot.id
        title = shot.title
        shotDescription = shot.description
        width = shot.width
        height = shot.height
        images = Images(shot.images)
        views_count = shot.views_count
        likes_count = shot.likes_count
        comments_count = shot.comments_count
        attachments_count = shot.attachments_count
        rebounds_count = shot.rebounds_count
        buckets_count = shot.buckets_count
        created_at = shot.created_at
        updated_at = shot.updated_at
        html_url = shot.html_url
        attachments_url = shot.attachments_url
        buckets_url = shot.buckets_url
        comments_url = shot.comments_url
        likes_url = shot.likes_url
        projects_url = shot.projects_url
        rebounds_url = shot.rebounds_url
        animated = shot.animated
        shot.tags?.forEach() { option in
            let value = StringObject()
            value.value = option
            self.tags.append(value)
        }
        user = User(shot.user)
        team = shot.team != nil ? Team(shot.team!) : nil
    }
}
