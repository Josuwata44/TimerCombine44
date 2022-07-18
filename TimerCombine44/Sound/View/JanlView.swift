import SwiftUI

struct JanlView: View {
    @State var page: Int? = 0
   
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    Image("kiken")
                        .resizable()
                        .frame(width: 50.0, height: 50.0, alignment: .leading)
                Text("怖い話集")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                }
                HStack {
                    Button(action: {
                        self.page = 1
                    }, label: {
                        Text("B子")
                            .bold()
                            .padding()
                            .frame(width: 150, height: 150)
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .clipShape(Circle())
                    })
                        
                }
                
                HStack {
                    Button(action: {
                        self.page = 2
                        
                    }, label: {
                        Text("洗濯物")
                            .bold()
                            .padding()
                            .frame(width: 150, height: 150)
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .clipShape(Circle())
                        
                    })
                    
                    
                    Button(action: {
                        self.page = 3
                        
                    }, label: {
                        Text("侵入者")
                            .bold()
                            .padding()
                            .frame(width: 150, height: 150)
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .clipShape(Circle())
                        
                    })
                    
                    
                    NavigationLink(destination: TimerView(viewModel: ContentViewModel()), tag: 2, selection: $page) {
                        EmptyView()
                    }
                    
                    NavigationLink(destination: SecondView(viewModel: SecondViewModel()), tag: 3, selection: $page) {
                        EmptyView()
                    }
                    
                    
                    NavigationLink(destination: FourView(viewModel: FourViewModel()), tag: 1, selection: $page) {
                        EmptyView()
                    }
                    
                }
                
            }
            
        }
    }
}

struct JanlView_Previews: PreviewProvider {
    static var previews: some View {
        JanlView()
    }
}
