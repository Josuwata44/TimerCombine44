//
//  SecondViewModel.swift
//  TimerCombine
//
//  Created by cmStudent on 2022/07/09.
//

import Foundation
import Combine


final class SecondViewModel: ObservableObject {
    @Published var count = 0
    @Published var name = "侵入者"
    @Published var show2 = "taino"
    @Published var nnn = "M子という友人の話。............................."
    @Published var name2 = "彼女はひとり暮らしをしていたのですが、バイトから帰って部屋に入ると部屋が荒らされていて"
    @Published var name3 = "何者かに侵入された形跡があったそう。,,,,,,,,,,,"
    @Published var name4 = "当然、怖いのでM子はすぐに警察へ連絡。駆けつけた警察の調査がすぐに始まりました。"
    @Published var isTimerRunning = false
    
    
    
    private var cancellable: AnyCancellable?
    
    func startCounting() {
        isTimerRunning = true
        
        cancellable = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.count += 1
             
                if(self.count == 6) {
                    self.nnn  = "取られたものはなかったものの、奇妙なことがあったそう。"
                    self.name2 = "それは、何ひとつ「指紋」が見つからなかったこと。"
                    self.name3 = "いやいや犯人が手袋してただけでしょと思ったそうですが、そうではないそう。"
                    self.name4 = "犯人だけではなく、M子自身の指紋も見つからないそうだ。"
                    
                }
              
                if(self.count == 12) {
                    self.nnn  = "帰ってきてから通報するまでに触った部分以外、指紋がないらしい。"
                    self.name2 = "今もその理由は分からず、犯人も見つかっていない。"
                    self.name3 = "M子はその部屋をすぐに出て実家に帰ったようだが、引っ越す時に荷物の整理をしていると"
                    self.name4 = "見たこともない、マグカップが１つ紛れていたそう。"
                 
                }
               
                if(self.count == 18) {
                    self.nnn  = "その理由ももちろん、分からない。"
                    self.name2 = ""
                    self.name3 = ""
                    self.name4 = ""
                    
                }
                
                if(self.count == 24) {
                    self.show2 = "soto"
                    self.name = "終わり"
                    self.nnn  = ""
                    self.name2 = ""
                    self.name3 = ""
                    self.name4 = ""
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
        self.count = 0
        self.show2 = "最初から"
        
        if(self.count == 0) {
            self.name = "侵入者"
            self.nnn  = "M子という友人の話。............................."
            self.name2 = "彼女はひとり暮らしをしていたのですが、バイトから帰って部屋に入ると部屋が荒らされていて"
            self.name3 = "何者かに侵入された形跡があったそう。,,,,,,,,,,,"
            self.name4 = "当然、怖いのでM子はすぐに警察へ連絡。駆けつけた警察の調査がすぐに始まりました。"
        }
        
        if(self.count == 6) {
            self.nnn  = "取られたものはなかったものの、奇妙なことがあったそう。"
            self.name2 = "それは、何ひとつ「指紋」が見つからなかったこと。"
            self.name3 = "いやいや犯人が手袋してただけでしょと思ったそうですが、そうではないそう。"
            self.name4 = "犯人だけではなく、M子自身の指紋も見つからないそうだ。"
            
        }
      
        if(self.count == 12) {
            self.nnn  = "帰ってきてから通報するまでに触った部分以外、指紋がないらしい。"
            self.name2 = "今もその理由は分からず、犯人も見つかっていない。"
            self.name3 = "M子はその部屋をすぐに出て実家に帰ったようだが、引っ越す時に荷物の整理をしていると"
            self.name4 = "見たこともない、マグカップが１つ紛れていたそう。"
         
        }
       
        if(self.count == 18) {
            self.nnn  = "その理由ももちろん、分からない。"
            
            
        }
        
        if(self.count == 24) {
            self.show2 = "soto"
            self.name = "終わり"
            self.nnn  = ""
            self.name2 = ""
            self.name3 = ""
            self.name4 = ""
        }
        return
       
    }
}
