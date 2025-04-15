//
//  PostModel.swift
//  UIDemo
//
//  Created by Vraj on 11/04/25.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let username: String
    let avatarUrl: String
    let lastSeen : String?
}

struct Song: Identifiable, Codable {
    let id: String
    let title: String
    let artist: String
    let coverImageUrl: String
    let spotifyUrl: URL
    let type: SongType
}

enum SongType: String, Codable {
    case single = "Single"
    case album = "Album"
    case ep = "EP"
}

struct Comment: Identifiable, Codable {
    let id: String
    let user: User
    let content: String
    let createdAt: Date
}

struct Post: Identifiable, Codable {
    let id: String
    let user: User
    let content: String
    let song: Song
    let createdAt: Date
    let likesCount: Int
    let listensCount: Int
    let commentsCount: Int
    let comments: [Comment]
}

let exampleUser = User(
    id: "user_001",
    username: "johndoe31",
    avatarUrl:  "avatar",
    lastSeen: "2d ago"
)

let exampleSong = Song(
    id: "song_001",
    title: "Rearrange Us",
    artist: "Mt. Joy",
    coverImageUrl: "coverImage",
    spotifyUrl: URL(string: "https://open.spotify.com/track/example")!,
    type: .single
)

let exampleComment = Comment(
    id: "comment_001",
    user: User(
        id: "user_002",
        username: "Bentheredonethat",
        avatarUrl:"avatar",
        lastSeen: "2d ago"
    ),
    content: "I totally forgot this song existed. Thanks for the reminder. Commence repeat and sing...",
    createdAt: Date()
)

let examplePost = Post(
    id: "post_001",
    user: exampleUser,
    content: """
    Smooth electric keyboard-driven rhythm that has me tapping my foot until the end. A dazzling blend of indie-rock.

    The way Mt. Joy writes music has inspired me to start writing again...
    """,
    song: exampleSong,
    createdAt: Date(),
    likesCount: 38,
    listensCount: 110,
    commentsCount: 7,
    comments: [exampleComment]
)


let postList: [Post] = [
    examplePost,
    Post(
        id: "post_002",
        user: User(
            id: "user_003",
            username: "musiclover91",
            avatarUrl:"avatar",
            lastSeen: "2d ago"

        ),
        content: "This track hits different at night. 🌓✨",
        song: Song(
            id: "song_002",
            title: "Night Owl",
            artist: "Jungle",
            coverImageUrl: "coverImage",
            spotifyUrl: URL(string: "https://open.spotify.com/track/nightowl")!,
            type: .album
        ),
        createdAt: Date(),
        likesCount: 22,
        listensCount: 85,
        commentsCount: 2,
        comments: []
    ),
    Post(
        id: "post_003",
        user: User(
            id: "user_004",
            username: "vibequeen",
            avatarUrl:"avatar",
            lastSeen: "2d ago"
        ),
        content: "An underrated gem. Can't stop vibing to the bassline 🎶",
        song: Song(
            id: "song_003",
            title: "Golden Hour",
            artist: "Kacey Musgraves",
            coverImageUrl: "coverImage",
            spotifyUrl: URL(string: "https://open.spotify.com/track/goldenhour")!,
            type: .album
        ),
        createdAt: Date(),
        likesCount: 56,
        listensCount: 200,
        commentsCount: 5,
        comments: []
    ),
    
    Post(
        id: "post_004",
        user: User(
            id: "user_005",
            username: "throwbackjamz",
            avatarUrl:"avatar",
            lastSeen: "2d ago"
        ),
        content: "Instant nostalgia. Takes me straight back to summer 2015 ☀️",
        song: Song(
            id: "song_004",
            title: "Electric Feel",
            artist: "MGMT",
            coverImageUrl: "coverImage",
            spotifyUrl: URL(string: "https://open.spotify.com/track/electricfeel")!,
            type: .single
        ),
        createdAt: Date(),
        likesCount: 71,
        listensCount: 430,
        commentsCount: 3,
        comments: []
    ),
    Post(
        id: "post_005",
        user: User(
            id: "user_006",
            username: "rhythmjunkie",
            avatarUrl:"avatar",
            lastSeen: "2d ago"
        ),
        content: "🔥🔥🔥 Drum groove on point. Cranked this one in the car all morning.",
        song: Song(
            id: "song_005",
            title: "Tadow",
            artist: "Masego & FKJ",
            coverImageUrl: "coverImage",
            spotifyUrl: URL(string: "https://open.spotify.com/track/tadow")!,
            type: .single
        ),
        createdAt: Date(),
        likesCount: 120,
        listensCount: 500,
        commentsCount: 10,
        comments: []
    ),
    Post(
        id: "post_006",
        user: User(
            id: "user_007",
            username: "groovelover",
            avatarUrl:"avatar",
            lastSeen: "2d ago"
        ),
        content: "This song lives rent-free in my head. Can't stop humming it 🎧",
        song: Song(
            id: "song_006",
            title: "Redbone",
            artist: "Childish Gambino",
            coverImageUrl: "coverImage",
            spotifyUrl: URL(string: "https://open.spotify.com/track/redbone")!,
            type: .album
        ),
        createdAt: Date(),
        likesCount: 89,
        listensCount: 390,
        commentsCount: 4,
        comments: []
    )
] 
