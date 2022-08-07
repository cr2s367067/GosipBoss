//
//  ContentView.swift
//  GosipBoss
//
//  Created by Kuan on 2022/8/6.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appVM: AppViewModel
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(appVM.postSet) { post in
                    LazyVStack {
                        NavigationLink {
                            
                        } label: {
                            CustomUnit(
                                title: post.title,
                                texting: post.texting
                            )
                        }

                    }
                }
            }
            .modifier(InitViewModifier())
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(isActive: $appVM.showPostingView) {
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .foregroundColor(Color("buttonColor"))
                            .font(.title)
                    }
                }
            }
            .padding()
        }
        .task {
            do {
                try await appVM.fetchPost()
            } catch {
                print("error")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let appVM = AppViewModel()
        ContentView()
            .environmentObject(appVM)
    }
}

struct CustomUnit: View {
    
    var title: String
    var texting: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                Spacer()
            }
            HStack {
                Text(texting)
                Spacer()
            }
            HStack {
                Spacer()
                Text("From anyamouns")
            }
        }
        .padding()
        .frame(width: AppViewModel.uiScreenWith - 40, height: 120, alignment: .center)
        .background(alignment: .center) {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
        }
    }
}
