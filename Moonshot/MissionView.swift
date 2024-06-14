//
//  MissionView.swift
//  Moonshot
//
//  Created by Yashavika Singh on 13.06.24.
//

import SwiftUI

struct MissionView:  View{
    
    struct CrewMember{
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew : [CrewMember]
    
    
    var body: some View
    {
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame( .horizontal ){
                        width, axis in width*0.6
                    }
                
              
                
                VStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(.lightBackground)
                        .frame(height: 2)
                        .padding(.vertical)
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    Text(mission.description)
                    
                    Rectangle()
                        .foregroundColor(.lightBackground)
                        .frame(height: 2)
                        .padding(.vertical)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                }
                
                
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack
                     {
                        ForEach(crew, id: \.role)
                        { crewMember in
                            NavigationLink{
                                Text("Astronaut Details" )
                            } label:
                            {
                                HStack{
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 104, height: 72)
                                        .clipShape(.capsule)
                                        .overlay(Capsule().strokeBorder( .white, lineWidth: 1))
                                    
                                    VStack{
                                        Text(crewMember.astronaut.name)
                                            .foregroundStyle(.white)
                                        Text(crewMember.role)
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                        }
                    }
                    
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission,  astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew =  mission.crew.map{
            member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)}
                else{
                    fatalError("missing \(member.name)")
                }
            }
        
    }
}


  #Preview{
      let missions: [Mission] = Bundle.main.decode("missions.json")
      let astronauts : [String: Astronaut] = Bundle.main.decode("astronauts.json")
      return MissionView(mission: missions[0], astronauts: astronauts).preferredColorScheme(.dark)
      
}
