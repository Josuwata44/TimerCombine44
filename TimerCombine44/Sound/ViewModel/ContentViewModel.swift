//
//  ContentViewModel.swift
//  TimerCombine
//
//  Created by cmStudent on 2022/07/03.
//

import Foundation
import Combine

final class ContentViewModel: ObservableObject {
    @Published var count = 0
    @Published var name = "洗濯物"
    @Published var show2 = "taino"
    @Published var nnn = "母校の中学校の近くに、結構築年数の経ってそうなボロアパートがあったんだけど、"
    @Published var name2 = "俺が実家を出て、上京している間になにがあったのか廃墟になっていた。....................."
    @Published var name3 = "どうやら誰も住んでいないらしいんだけど、、、、、、、、、、、"
    @Published var name4 = "帰省中にふと廃墟アパートのベランダに洗濯物が干してあるのに気づいた。"
    @Published var isTimerRunning = false
    
    private var cancellable: AnyCancellable?
    
    func startCounting() {
        isTimerRunning = true
        
        cancellable = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.count += 1
             
                if(self.count == 6) {
                
                    self.nnn  = "家に帰って、そのことを家族に話したんだけど、反応はあんまなかったから"
                    self.name2 = "自分で、誰か住んでるんじゃないかとアパートの所有者に連絡したんだ、おせっかいだけど。"
                    self.name3 = "そしたら今から見に行くってことになって、同行した。"
                    self.name4 = "所有者のおじさんと、俺と地元の友人３人でその部屋に入った。"
                    
                }
              
                if(self.count == 12) {
                    self.nnn  = "幸い鍵は閉まってなく、部屋の中には誰もいなかった。誰かが住んでいたような感じもしない。"
                    self.name2 = "ベランダには黄色いバスタオルと白い靴下が干されていて"
                    self.name3 = "「なんだよイタズラか？」と笑いながらバスタオルを取り込むと"
                    self.name4 = "友人が「うわぁあああ」と大声を出した。"
                 
                }
               
                if(self.count == 18) {
                    self.nnn  = "タオルを見ると、裏側にびっしりと焦げ茶色の何かがついていた。"
                    self.name2 = "それはよく見れば赤黒く、血だった。ずいぶん時間が経っているような。"
                    self.name3 = "３人とも何も言わず黙り込んだ。"
                    self.name4 = "本当に全身鳥肌が止まらなかった。"
                    
                }
            
                
                if(self.count == 24) {
                    self.nnn  = ""
                    self.name2 = ""
                    self.name3 = ""
                    self.name4 = ""
                    self.name = "終わり"
                    self.show2 = "soto"
                }
                return
            }
    }
    
    func stopCounting() {
        isTimerRunning = false
        cancellable?.cancel()
        self.show2 = "終了"
    }
    
    
    func resetCount() {
        count = 0
        self.show2 = "最初から"
        
        if(self.count == 0) {
            self.name = "洗濯物"
            self.nnn  = "母校の中学校の近くに、結構築年数の経ってそうなボロアパートがあったんだけど、"
            self.name2 = "俺が実家を出て、上京している間になにがあったのか廃墟になっていた。....................."
            self.name3 = "どうやら誰も住んでいないらしいんだけど、、、、、、、、、、、"
            self.name4 = "帰省中にふと廃墟アパートのベランダに洗濯物が干してあるのに気づいた。"
        }
        
        
        if(self.count == 6) {
            self.nnn  = "家に帰って、そのことを家族に話したんだけど、反応はあんまなかったから"
            self.name2 = "自分で、誰か住んでるんじゃないかとアパートの所有者に連絡したんだ、おせっかいだけど。"
            self.name3 = "そしたら今から見に行くってことになって、同行した。"
            self.name4 = "所有者のおじさんと、俺と地元の友人３人でその部屋に入った。"
            
        }
      
        if(self.count == 12) {
            self.nnn  = "幸い鍵は閉まってなく、部屋の中には誰もいなかった。誰かが住んでいたような感じもしない。"
            self.name2 = "ベランダには黄色いバスタオルと白い靴下が干されていて"
            self.name3 = "「なんだよイタズラか？」と笑いながらバスタオルを取り込むと"
            self.name4 = "友人が「うわぁあああ」と大声を出した。"
         
        }
       
        
        if(self.count == 18) {
            self.nnn  = "タオルを見ると、裏側にびっしりと焦げ茶色の何かがついていた。"
            self.name2 = "それはよく見れば赤黒く、血だった。ずいぶん時間が経っているような。"
            self.name3 = "３人とも何も言わず黙り込んだ。"
            self.name4 = "本当に全身鳥肌が止まらなかった。"
            
        }
        
        if(self.count == 24) {
            self.nnn  = ""
            self.name2 = ""
            self.name3 = ""
            self.name4 = ""
            self.name = "終わり"
            self.show2 = "soto"
        }
        return
       
    }
}






