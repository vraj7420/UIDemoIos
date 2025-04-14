//
//  PostRow.swift
//  UIDemo
//
//  Created by Vraj on 11/04/25.
//

import SwiftUI

struct PostRow: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // User Info
            HStack(spacing: 12) {
                Image(post.user.avatarUrl)
                    .resizable()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                
                Text(post.user.username)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            
            // Song Card Section
            HStack(spacing: 12) {
                AsyncImage(url: post.song.coverImageUrl) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 60, height: 60)
                .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(post.song.title)
                        .font(.headline)
                        .lineLimit(1)
                    Text(post.song.artist)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            
            // Post Text
            Text(post.content)
                .font(.body)
                .lineLimit(3)
            
            // Stats Section
            HStack(spacing: 24) {
                Label("\(post.likesCount)", systemImage: "heart.fill")
                    .foregroundColor(.red)
                Label("\(post.listensCount)", systemImage: "headphones")
                Label("\(post.commentsCount)", systemImage: "bubble.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}
