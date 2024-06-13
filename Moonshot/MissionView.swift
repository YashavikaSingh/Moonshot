//
//  MissionView.swift
//  Moonshot
//
//  Created by Yashavika Singh on 13.06.24.
//

import SwiftUI

struct MissionView:  View{
    let mission: Mission
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
                    Text(mission.description)
                }
                
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}


  #Preview{
      let missions: [Mission] = Bundle.main.decode("missions.json")
      return MissionView(mission: missions[0]).preferredColorScheme(.dark)
      
}
