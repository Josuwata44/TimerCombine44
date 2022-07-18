//
//  FourView.swift
//  TimerCombine
//
//  Created by cmStudent on 2022/07/09.
//

import SwiftUI

struct FourView: View {
    @ObservedObject private var viewModel: FourViewModel
    let sound = SoundPlayer()
    @State private var show3Alert = false

    init(viewModel: FourViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            Image(viewModel.show2)
                .frame(width: 100, height:100)
           
        VStack(alignment: .leading) {
            Blur3View(text: viewModel.name, textSize: 50, startTime: 0.41)

                .frame(maxWidth: .infinity, alignment: .center)
           
            Spacer()
                .frame(height:40)
             
             Text(viewModel.nnn)
                  .font(.custom("Times-Roman", size: 24))

            Spacer()
                .frame(height:40)


             Text(viewModel.name2)
                  .font(.custom("Times-Roman", size: 24))


            Spacer()
                .frame(height:40)
             
             Text(viewModel.name3)
                  .font(.custom("Times-Roman", size: 24))
             
             Text(viewModel.name4)
                  .font(.custom("Times-Roman", size: 24))


            HStack {

                Spacer()
                    .frame(height:40)


                Button(action: {
                    self.show3Alert.toggle()
                          }){
                            Image(systemName:"play.circle.fill")
                          }
                          .font(.system(size: 50))
                          .disabled(viewModel.isTimerRunning)
                          .alert(isPresented: $show3Alert) {
                                           Alert(title: Text("警告"), message: Text("本当に読みますか？？"), primaryButton: .default(Text("はい"), action: {
                                                self.sound.amahaPlay()
                                                self.viewModel.startCounting()
                                           }), secondaryButton: .default(Text("いいえ")))
                                       }



                Button(action: {
                    sound.stop2()
                    viewModel.stopCounting()
                          }){
                            Image(systemName:"stop.circle.fill")

                          }
                          .font(.system(size: 50))
                          .disabled(!viewModel.isTimerRunning)
                          .padding()


                Button(action: {
                    viewModel.resetCount()
                    sound.reset()
                          }){
                            Image(systemName:"repeat.circle.fill")

                          }
                          .disabled(!viewModel.isTimerRunning)
                          .font(.system(size: 50))
                Spacer(minLength: 100)
            }
        }
    }
    }
}






struct Blur3View: View {
    let characters: Array<String.Element>
    let baseTime: Double
    let textSize: Double
    @State var blurValue: Double = 10
    @State var opacity: Double = 0

    init(text:String, textSize
         : Double, startTime: Double) {
        characters = Array(text)
        self.textSize = textSize
        baseTime = startTime
    }

    var body: some View {
        HStack(spacing: 1){
            ForEach(0..<characters.count) { num in
                Text(String(self.characters[num]))
                    .font(.custom("HiraMinProN-W3", fixedSize: textSize))
                    .foregroundColor(Color.red)
                    .blur(radius: blurValue)
                    .opacity(opacity)
                    .animation(.easeInOut.delay( Double(num) * 0.15 ), value: blurValue)
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + baseTime) {
                if blurValue == 0{
                    blurValue = 10
                    opacity = 0.01
                } else {
                    blurValue = 0
                    opacity = 1
                }
            }
        }
    }
}

struct FourView_Previews: PreviewProvider {
    static var previews: some View {
        FourView(viewModel: FourViewModel())
    }
}
