//
//  ContentView.swift
//  Moonshot
//
//  Created by Yashavika Singh on 12.06.24.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
     
        
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns)  {
                    
                    
                    ForEach(missions)
                    { mission in NavigationLink {
                        Text("detail view")
                    }
                     label:  {
                        VStack{
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack{
                                Text("\(mission.displayName)").font(.headline).foregroundStyle(.white)
                                Text(mission.formattedLaunchDate).foregroundStyle(.white.opacity(0.6) )
                            }
                            .padding(.vertical )
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(.lightBackground )
                            .preferredColorScheme(.dark)
                        }
                       
                    }
                     .clipShape(RoundedRectangle(cornerRadius: 10))
                     .overlay(RoundedRectangle(cornerRadius: 10).stroke(.lightBackground))
                        
                }

                }
                .padding([.bottom, .horizontal])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground )
            
        }
    }
}

#Preview {
    ContentView()
}
