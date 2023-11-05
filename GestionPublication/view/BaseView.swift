//
//  BaseView.swift
//  GestionPublication
//
//  Created by MacOS on 4/11/2023.
//

import SwiftUI


struct BaseView: View {
    @State var showMenu:Bool=false
    init() {
        UITabBar.appearance().isHidden = true
    }
    @State var currentTab = "Home"
    var body: some View {
        let sideBarwidth = getRect().width - 90
        NavigationView{
            
            HStack(spacing:0 ){
                
                SideMenu(showMenu: $showMenu)
                
                VStack(spacing : 0){
                    TabView(selection: $currentTab){
                        Text("Home")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Home")
                        
                        Text("Search")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Search")
                        
                        Text("Notifications")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("Notifications")
                        
                        Text("messages")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("messages")
                        
                        
                    }
                    VStack(spacing:0){
                        
                        
                 Divider()
                    
                    
                    HStack(spacing:0){
                        TabButton(image: "Home")
                        TabButton(image: "Search")
                        TabButton(image: "Notifications")
                        TabButton(image: "messages")
                    }
                    .padding([.top],15)
                    }
                }
                .frame(width: getRect().width)
            }
            .frame(width: getRect().width + sideBarwidth)
            .offset(x: -sideBarwidth / 2)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
    }
    @ViewBuilder
    func TabButton( image:String) -> some  View {
        Button{
            withAnimation{currentTab = image}
        } label: {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 23 , height:22)
                .foregroundColor(currentTab == image ? .primary: .gray)
                .frame(maxWidth: .infinity)
        }
}

    
    
    struct BaseView_Previews: PreviewProvider {
        static var previews: some View {
            BaseView()
        }
    }
}
