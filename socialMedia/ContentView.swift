//
//  ContentView.swift
//  socialMedia
//
//  Created by Macbook Pro on 10/24/20.
//

import SwiftUI

struct Post {
    let id: Int
    let username, text, imageName, contentImage: String
}
struct Tranding {
    let id: Int
    let username, imageName: String
}
struct ContentView: View {
    let posts: [Post] = [
        .init(id: 0, username: "Charles Angel", text: "Sleep well and i think that will be most beautiful life ", imageName: "pexels-1", contentImage: "pexels-7"),
        .init(id: 1, username: "Zidane Prikitiw", text: "Walking evening these day make me so happy with my couple together hope will be like this forever", imageName: "pexels-2", contentImage: "pexels-5"),
        .init(id: 2, username: "Champ Hamilton", text: "Sleep well and i think that will be most beautiful life asdas dasdsad", imageName: "pexels-3", contentImage: "pexels-6")
    ]
    let trandings: [Tranding] = [
        .init(id: 2, username: "Mama Mia Lezatos", imageName: "pexels-3"),
        .init(id: 1, username: "Zidane Prikitiw", imageName: "pexels-2"),
        .init(id: 0, username: "Charles Angel", imageName: "pexels-1"),
        .init(id: 4, username: "Zidane Prikitiw", imageName: "pexels-4"),
        .init(id: 3, username: "Mama Mia Lezatos", imageName: "pexels-5"),
        .init(id: 5, username: "Charles Angel", imageName: "pexels-6")
        
    ]
    var body: some View {
        NavigationView{
            List{
                VStack(alignment: .leading){
                    Text("Trending")
                    ScrollView(.horizontal){
                        HStack(spacing:10){
                            ForEach(trandings, id: \.id){ tranding in
                                NavigationLink(destination: TrandingDetailView(tranding: tranding)){
                                    TrandingView(tranding: tranding)
                                }
                            }
                        }.padding(.bottom, 10)
                    }.frame(height: 180)
                }
                
                ForEach(posts, id: \.id) { post in
                    PostView(post: post)
                }
            }.navigationTitle(Text("Layout"))
        }
    }
}

struct TrandingDetailView: View {
    let tranding : Tranding
    var body: some View {
        TrandingView(tranding: tranding)
            .navigationTitle("Detail Tranding")
    }
}

struct TrandingView: View {
    let tranding: Tranding
    var body: some View {
        VStack{
            Image(tranding.imageName)
                .resizable()
                .cornerRadius(10)
                .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .clipped()
            Spacer()
            Text(tranding.username)
                .lineLimit(nil)
                .font(.headline)
                .foregroundColor(.primary)
                .frame(width:100)
        }.frame(width:120, height:160)
    }
}

struct PostView : View {
    let post: Post
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            HStack{
                Image(post.imageName)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width:70, height: 70)
                    .clipped()
                VStack(alignment:.leading, spacing: 4){
                    Text(post.username).font(.headline)
                    Text("Posted 8 hrs ago").font(.subheadline)
                }.padding(.leading, 8 )
            }
            .padding(.leading, 16)
            .padding(.top, 16)
            Text(post.text)
                .lineLimit(nil)
                .padding(.leading, 10)
                .padding(.trailing, 32)
                .frame(width: UIScreen.main.bounds.width)
             
                
            Image(post.contentImage)
                .resizable()
                .scaledToFill()
                .frame(height:300)
        }.padding(.leading, -20)
        .padding(.bottom, -8)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
