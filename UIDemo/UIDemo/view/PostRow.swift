//
//  PostRow.swift
//  UIDemo
//
//  Created by Vraj on 11/04/25.
//

import SwiftUI

struct PostRow: View {
    let post: Post
    @State var commentText:String = ""
    var moreMenuSelected:()->Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // User Info
            HStack(alignment: .center){
                HStack(alignment: .center,spacing: 12) {
                    Image(post.user.avatarUrl)
                        .resizable()
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                    VStack(alignment: .leading,spacing: 2){
                        Text(post.user.username)
                            .fontWeight(.semibold)
                        if let lastSeen = post.user.lastSeen {
                            Text(lastSeen)
                                .font(.system(size: 12))
                                .fontWeight(.light)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                Spacer()
                Button{
                    moreMenuSelected()
                }label: {
                    Image(ImageConstants.menuIcon)
                }
            }
            Text(post.content)
                .font(.body)
                .lineLimit(3)
            songCardView
                .frame(height: 140)
            HStack (alignment: .center){
                Spacer()
                LableButton(image:ImageConstants.addIconBlack, title: StringConsatnts.addButtonTitle){
                    
                }
                Spacer()
                LableButton(image:ImageConstants.spotifyIconBlack, title: StringConsatnts.spotifyButtonTitle){
                    
                }
                Spacer()
                LableButton(image:ImageConstants.sendIcon, title: StringConsatnts.shareButtonTitle){
                    
                }
                Spacer()
                LableButton(image:ImageConstants.likeIcon, title: StringConsatnts.likeButtonTitle){
                    
                }
                Spacer()
            }.frame(maxWidth: .infinity,alignment: .center)
                .padding(.vertical)
            Divider()
                .background(Color.gray.opacity(0.2))
                .frame(height: 2)
            HStack (spacing: 16){
                Text("\(post.likesCount) \(StringConsatnts.likeButtonTitle)")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                Text("\(post.listensCount)  \(StringConsatnts.listensLable)")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                Text("\(post.commentsCount)  \(StringConsatnts.commentsLable)")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
            }.padding(.vertical)
            if !post.comments.isEmpty {
                let comment = post.comments[0]
                
                (
                    Text(comment.user.username + " ")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                    +
                    Text(comment.content)
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                )
            }
            HStack {
                Image(post.user.avatarUrl)
                                    .resizable()
                                    .frame(width: 36, height: 36)
                                    .clipShape(Circle())
                TextField(StringConsatnts.addCommentPlaceHolder,text: $commentText)
                    .textFieldStyle(PlainTextFieldStyle())
            }
            
        }
        .padding()
        .padding(.horizontal,10)
        .background(Color(.white))
        .overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(Color.gray.opacity(0.1), lineWidth: 2)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
    
    var songCardView: some View {
        // Song Card Section
        HStack(alignment: .top, spacing: 12) {
            Image(post.song.coverImageUrl)
                .resizable()
                .frame(width: 160, height: 140)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 4) {
                Text(post.song.title)
                    .font(.headline)
                    .lineLimit(1)
                Text(post.song.artist)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(post.song.type.rawValue)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                HStack {
                    Image(ImageConstants.spotifyGray)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .cornerRadius(8)
                    Spacer()
                    HStack(spacing: 8){
                        Image(ImageConstants.playingIcon)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .cornerRadius(8)
                        Button(action: {
                            // Your action here
                        }) {
                            Image(ImageConstants.playIcon)
                                .resizable()
                                .frame(width: 30, height: 30)
                                .cornerRadius(8)
                        }
                        
                    }
                    
                }
                
            }
            .padding(10)
            .padding(.trailing, 16)
        }
        .padding(2)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        
        
    }
}
