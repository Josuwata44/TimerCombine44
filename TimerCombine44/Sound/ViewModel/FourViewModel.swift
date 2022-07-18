//
//  FourViewModel.swift
//  TimerCombine
//
//  Created by cmStudent on 2022/07/09.
//

import Foundation
import Combine

final class FourViewModel: ObservableObject {
    @Published var count = 0
    @Published var name = "B子"
    @Published var show2 = "taino"
    @Published var nnn = "とある小学校に、A子とB子というとても仲の良い女の子がいました。"
    @Published var name2 = "2人は、学校ではもちろんのこと、放課後も毎日一緒に遊んでいました。"
    @Published var name3 = "その日も2人は遊ぶ約束をしていたので、、、、、、、、、、、、、、、、、、"
    @Published var name4 = "お互いにいったん荷物をおきに家に帰りました。................."
    @Published var isTimerRunning = false
    
    
    
    private var cancellable: AnyCancellable?
    
    func startCounting() {
        isTimerRunning = true
        
        cancellable = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.count += 1
             
                if(self.count == 6) {
                    self.nnn  = "A子の両親は共働きで兄弟もいないので、いつも家に帰っても一人。"
                    self.name2 = "そんな時いつも一緒にいてくれるB子はとてもありがたい存在でした。"
                    self.name3 = "家に帰ってすぐに部屋に荷物をおき、家を出ようとすると家の電話が鳴りました。"
                    self.name4 = ""
                    
                }
              
                if(self.count == 12) {
                    self.nnn  = "電話に出ると、相手はB子でした。"
                    self.name2 = "「もしもし」"
                    self.name3 = "「・・・・」"
                    self.name4 = "「もしもし？」"
                 
                }
               
                if(self.count == 18) {
                    self.nnn  = "「・・・わたし、B子。今日は用事が出来て遊べなくなったの。ごめんね、また遊んでね。」"
                    self.name2 = "B子との約束がなくなり、がっかりするA子。"
                    self.name3 = "すると、いつもよりも仕事がはやく終わったという母親が帰ってきました。"
                    self.name4 = "なんだか、いつもと様子が違う母親が気になってA子が訪ねると"
                    
                    
                }
                
                if(self.count == 24) {
                    self.nnn  = "どうやら母親は、帰り道に近くの通りで交通事故の現場を見てしまったそうです。"
                    self.name2 = "その交通事故は、酷いもので被害者は大型トラックに引きずられて亡くなったそう。"
                    self.name3 = "次の日学校で、その事故の被害者がB子だったということをA子は知ります。"
                    self.name4 = "1ヶ月経っても、A子は立ち直れませんでした。"
                }
                
                
                if(self.count == 30) {
                    self.nnn  = "あんなに元気だったA子は、ほとんど喋らなくなり学校も休むようになりました。"
                    self.name2 = "その日もA子は、学校を休んでひとりで家で寝ていました。"
                    self.name3 = "お昼の13時頃、インターホンが鳴りA子は起きました。"
                    self.name4 = "親もいないので家にはA子1人、誰とも話したくないので無視していましたが、"
                }
                
                if(self.count == 36) {
                    self.nnn  = "しつこくインターホンは鳴り続けます。"
                    self.name2 = "仕方なくリビングにあるモニターを見てみると、"
                    self.name3 = "映っていたのは赤いフードをかぶった子供のようで、しかも異常に痩せ細っていました。"
                    self.name4 = "A子は「だれ？」と尋ねましたが返事はありません。"
                }
                
                if(self.count == 42) {
                    self.nnn  = "マイクから聞こえてくるのは、まるで喉に痰が絡んだような息の音だけ。"
                    self.name2 = "さすがに気味が悪かったので、警察に連絡しようと思ったその時、"
                    self.name3 = "気付いてしまったのです。"
                    self.name4 = ""
                }
                
                if(self.count == 48) {
                    self.nnn  = "その子供には両腕がありませんでした。"
                    self.name2 = "そしてフードだと思っていたものは、顎から上がひしゃげた頭だったのです。"
                    self.name3 = "どうしていいか分からずパニックになったA子はその場にうずくまり"
                    self.name4 = "そのまま気がついた時には床に倒れていました。"
                }
                
                if(self.count == 54) {
                    self.nnn  = "意識を失っていたのでしょうか。"
                    self.name2 = "部屋の中やモニターを見回しましたが、もうソレはいませんでした。"
                    self.name3 = "その時になって、A子は気づきました。"
                    self.name4 = "あの子供が着ていた服が、事故当日のB子とまったく同じだったことを。"
                }
                
                if(self.count == 56) {
                    self.show2 = "soto"
                    self.name = "終了"
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
        count = 0
        self.name = "最初から"
        
        
        if(self.count == 0) {
            self.name = "B子"
            self.nnn  = "とある小学校に、A子とB子というとても仲の良い女の子がいました。"
            self.name2 = "2人は、学校ではもちろんのこと、放課後も毎日一緒に遊んでいました。"
            self.name3 = "その日も2人は遊ぶ約束をしていたので"
            self.name4 = "お互いにいったん荷物をおきに家に帰りました。"
        }
        
        if(self.count == 6) {
            self.nnn  = "A子の両親は共働きで兄弟もいないので、いつも家に帰っても一人。"
            self.name2 = "そんな時いつも一緒にいてくれるB子はとてもありがたい存在でした。"
            self.name3 = "家に帰ってすぐに部屋に荷物をおき、家を出ようとすると家の電話が鳴りました。"
            self.name4 = ""
            
        }
      
        if(self.count == 12) {
            self.nnn  = "電話に出ると、相手はB子でした。"
            self.name2 = "「もしもし」"
            self.name3 = "「・・・・」"
            self.name4 = "「もしもし？」"
         
        }
       
        if(self.count == 18) {
            self.nnn  = "「・・・わたし、B子。今日は用事が出来て遊べなくなったの。ごめんね、また遊んでね。」"
            self.name2 = "B子との約束がなくなり、がっかりするA子。"
            self.name3 = "すると、いつもよりも仕事がはやく終わったという母親が帰ってきました。"
            self.name4 = "なんだか、いつもと様子が違う母親が気になってA子が訪ねると"
            
        }
        
        if(self.count == 24) {
            self.nnn  = "どうやら母親は、帰り道に近くの通りで交通事故の現場を見てしまったそうです。"
            self.name2 = "その交通事故は、酷いもので被害者は大型トラックに引きずられて亡くなったそう。"
            self.name3 = "次の日学校で、その事故の被害者がB子だったということをA子は知ります。"
            self.name4 = "1ヶ月経っても、A子は立ち直れませんでした。"
        }
        
        if(self.count == 30) {
            self.nnn  = "あんなに元気だったA子は、ほとんど喋らなくなり学校も休むようになりました。"
            self.name2 = "その日もA子は、学校を休んでひとりで家で寝ていました。"
            self.name3 = "お昼の13時頃、インターホンが鳴りA子は起きました。"
            self.name4 = "親もいないので家にはA子1人、誰とも話したくないので無視していましたが、"
        }
        
        if(self.count == 36) {
            self.nnn  = "しつこくインターホンは鳴り続けます。"
            self.name2 = "仕方なくリビングにあるモニターを見てみると、"
            self.name3 = "映っていたのは赤いフードをかぶった子供のようで、しかも異常に痩せ細っていました。"
            self.name4 = "A子は「だれ？」と尋ねましたが返事はありません。"
        }
        
        if(self.count == 42) {
            self.nnn  = "マイクから聞こえてくるのは、まるで喉に痰が絡んだような息の音だけ。"
            self.name2 = "さすがに気味が悪かったので、警察に連絡しようと思ったその時、"
            self.name3 = "気付いてしまったのです。"
            self.name4 = ""
        }
        
        if(self.count == 48) {
            self.nnn  = "その子供には両腕がありませんでした。"
            self.name2 = "そしてフードだと思っていたものは、顎から上がひしゃげた頭だったのです。"
            self.name3 = "どうしていいか分からずパニックになったA子はその場にうずくまり"
            self.name4 = "そのまま気がついた時には床に倒れていました。"
        }
        
        if(self.count == 54) {
            self.nnn  = "意識を失っていたのでしょうか。"
            self.name2 = "部屋の中やモニターを見回しましたが、もうソレはいませんでした。"
            self.name3 = "その時になって、A子は気づきました。"
            self.name4 = "あの子供が着ていた服が、事故当日のB子とまったく同じだったことを。"
        }
        
        if(self.count == 56) {
            self.nnn  = ""
            self.name2 = ""
            self.name3 = ""
            self.name4 = ""
            self.show2 = "soto"
            self.name = "終了"
        }
        return
      
    }
}







