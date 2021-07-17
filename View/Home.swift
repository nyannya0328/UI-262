//
//  Home.swift
//  UI-262
//
//  Created by nyannyan0328 on 2021/07/17.
//

import SwiftUI

struct Home: View {
    @State var columns : Int = 2
    @State var posts : [Post] = []
    @Namespace var animation
    
    var body: some View {
        
        
        
        NavigationView{
            
            
            StaggedGridView(columns: columns, list: posts, content: { post in
                
                PostCardView(post: post)
                    .matchedGeometryEffect(id: post.id, in: animation)
            })
                .padding(.horizontal)
                .navigationBarTitle("Stagged Gird")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        Button {
                            
                         
                                
                                columns += 1
                            
                            
                        } label: {
                            Image(systemName: "plus")
                        }

                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        Button {
                            
                            withAnimation{
                                
                                columns = max(columns-1, 1)
                            }
                            
                        } label: {
                            Image(systemName: "minus")
                        }

                    }
                }
                .animation(.easeInOut, value: columns)
                
        }
        
        .onAppear {
            
            for index in 1...10{
                
                
                posts.append(Post(imageURL: "p\(index)"))
            }
            
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct PostCardView : View{
    
    var post : Post
    
    var body: some View{
        
        
        Image(post.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
    }
}
