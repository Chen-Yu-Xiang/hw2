//
//  ViewController.swift
//  hw2
//
//  Created by User21 on 2018/12/1.
//  Copyright © 2018 User21. All rights reserved.
//

import UIKit
struct questionstruct{
    var question:String
    var choose:[String]
    var answer:String
    var reason:String
}
var questionArray:[questionstruct]=[]
var count=0
var score=0
var check=0
func set_questionArray(){
    questionArray.append(questionstruct(question:"哪個英文字母最酷？", choose:["A","B","C","D"], answer: "C",reason:"答案是C，因為西裝褲(C裝酷)"))
    questionArray.append(questionstruct(question:"醫生給了你三顆藥丸要你每半個小時吃一顆請問吃完需要多長時間？", choose:["半小時","一小時","一個半小時","兩小時"], answer:"一小時",reason:"答案是一小時，因為第一顆藥丸不用等"))
    questionArray.append(questionstruct(question:"神的交通工具是什麼？", choose:["寶貝","飛機","玩偶","人類"], answer: "寶貝",reason:"答案是寶貝，因為神奇（騎）寶貝"))
    questionArray.append(questionstruct(question:"鴨子坐計程車(猜一個蔬菜)？", choose:["小黃瓜","香瓜","絲瓜","木瓜"], answer: "小黃瓜",reason:"0"))
    questionArray.append(questionstruct(question:"遠看像水桶 近看破個洞 (猜一個東西)？", choose:["破水桶","衣服","電視","桌子"], answer: "破水桶",reason:"0"))
    questionArray.append(questionstruct(question:"大老二(猜一個國家)？", choose:["台灣","南韓","英國","美國"], answer: "南韓",reason:"答案是南韓，因為南韓(難含)"))
    questionArray.append(questionstruct(question:"第十一本書,猜一成語？", choose:["不卑不亢","不可思議","不出所料","不得而知"], answer: "不可思議",reason:"答案是不可思議，不可思議(book 11)"))
    questionArray.append(questionstruct(question:"一隻狗，兩個口；誰遇牠，誰發愁(猜一字)", choose:["哭","狂","呼","器"], answer: "哭",reason:"0"))
    questionArray.append(questionstruct(question:"樹上有100隻鳥 打了2隻剩幾隻?", choose:["98隻","0隻","100隻","102隻"], answer: "0隻",reason:"答案是0隻，因為都飛走了"))
    questionArray.append(questionstruct(question:"互吻(猜一字)", choose:["互","吻","呂","問"], answer: "呂",reason:"0"))
    questionArray.append(questionstruct(question:"七十二小時(猜一字)", choose:["晶","天","日","時"], answer: "晶",reason:"0"))
    questionArray.append(questionstruct(question:"請問哪一位古人最容易 Gameover?", choose:["木蘭","武則天","西施","李清照"], answer: "木蘭",reason:"答案是木蘭，因為木蘭詩第一句：唧唧復唧唧 >> GG 復 GG"))
    questionArray.append(questionstruct(question:"全球死亡率最高的是哪裡?", choose:["地板","中國","美國","床上"], answer: "床上",reason:"0"))
    questionArray.append(questionstruct(question:"雨後春筍(猜地名)", choose:["新竹","台北","彰化","嘉義"], answer: "新竹",reason:"0"))
    questionArray.append(questionstruct(question:"飲水思源(猜地名)", choose:["知本","北投","新營","新莊"], answer: "知本",reason:"0"))
    questionArray.append(questionstruct(question:"玉皇太后(猜地名)", choose:["天母","永和","學甲","新店"], answer: "天母",reason:"0"))
    questionArray.append(questionstruct(question:"轉怒為喜(猜古人)", choose:["顏回","孔子","子路","子貢"], answer: "顏回",reason:"0"))
    questionArray.append(questionstruct(question:"一隻會自己洗澡的豬。(猜古人)", choose:["朱齡石","朱熹","朱元璋","朱自清"], answer: "朱自清",reason:"答案是朱自清，因為朱〈豬〉自〈自己〉清〈清潔〉"))
    questionArray.append(questionstruct(question:"請問哪個表情符號是適合鼓勵人的？", choose:["p(^口^)q","┌○(—３—)○┐","^_*~","^o^d"], answer: "p(^口^)q",reason:"┌○(—３—)○┐ 不想聽,^_*~ 打暗號,^o^d 讚喔!!"))
    questionArray.append(questionstruct(question:"請問哪個表情符號是適合用來懷疑人的？", choose:["—。—～～→","⊙口⊙","3.3","((((((^_^)/"], answer: "—。—～～→",reason:"⊙口⊙ 不會吧!!,3.3 沒戴眼鏡的人,((((((^_^)/ 走人了"))
    questionArray.append(questionstruct(question:"請問哪個表情符號是沒辦法的意思？", choose:["︵(︶︵︶)︵","(¯ ▽ ¯；)","˙o˙!","(>__@)"], answer: "︵(︶︵︶)︵",reason:"(¯ ▽ ¯；) 被發現ㄌ,˙o˙! 嚇一跳,(>__@) 迷糊"))
}
class ViewController: UIViewController {
    @IBOutlet var selecteButton: [UIButton]!
    @IBOutlet weak var Question: UILabel!
    @IBOutlet weak var QuestionNumber: UILabel!
    @IBOutlet weak var Score: UILabel!
     @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previous: UIButton!
    func set(){
        QuestionNumber.text="第"+String(count+1)+"題"
        Question.text=questionArray[count].question
        questionArray[count].choose.shuffle()
        selecteButton[0].setTitle(questionArray[count].choose[0], for:UIControl.State.normal)
        selecteButton[1].setTitle(questionArray[count].choose[1], for:UIControl.State.normal)
        selecteButton[2].setTitle(questionArray[count].choose[2], for:UIControl.State.normal)
        selecteButton[3].setTitle(questionArray[count].choose[3], for:UIControl.State.normal)
        Score.text="分數："+String(score)
       /* selecteButton[1].backgroundColor = UIColor.black
        selecteButton[2].backgroundColor = UIColor.black
        selecteButton[3].backgroundColor = UIColor.black
        selecteButton[0].backgroundColor = UIColor.black*/
    }
    @IBAction func previous(_ sender: UIButton) {
        if(count>0){
            count=count-1
            set()
            
        }
    }
    @IBAction func nextButtonPressed(_ sender: UIButton) {
      nextButton.setTitle("next", for:UIControl.State.normal)
      QuestionNumber.isHidden=false
      next()
    }
  
    func next(){
        if check==1{
            count=count-1
            check=0
        }
        if count == 9{
            warning()
        }
        else{
            count=count+1
            Question.isHidden = false
            Question.text = questionArray[count].question
            set()
            selecteButton[0].isHidden = false
            selecteButton[1].isHidden = false
            selecteButton[2].isHidden = false
            selecteButton[3].isHidden = false
        }
    }
    @IBAction func selectedButton1(_ sender: UIButton) {
     //   selecteButton[0].backgroundColor = UIColor.red
        if  questionArray[count].choose[0]==questionArray[count].answer {
            score += 10
        
            selecteButton[1].isHidden = true
            selecteButton[2].isHidden = true
            selecteButton[3].isHidden = true
            if(questionArray[count].reason=="0"){
            }else{
                Question.text=questionArray[count].reason
            }
        }else{
            score -= 10
        }
        if count == 9{
            warning()
        }
    }
    @IBAction func selectedButton2(_ sender: UIButton) {
      //selecteButton[1].backgroundColor = UIColor.red
        if  questionArray[count].choose[1]==questionArray[count].answer {
            score += 10
            selecteButton[0].isHidden = true
            selecteButton[3].isHidden = true
            selecteButton[2].isHidden = true
            if(questionArray[count].reason=="0"){
            }else{
                Question.text=questionArray[count].reason
            }
        }else{
            score -= 10
        }
        if count == 9{
            warning()
        }
    }
    @IBAction func selectedButton3(_ sender: UIButton) {
      //  selecteButton[2].backgroundColor = UIColor.red
        if  questionArray[count].choose[2]==questionArray[count].answer {
            score += 10
            selecteButton[1].isHidden = true
            selecteButton[0].isHidden = true
            selecteButton[3].isHidden = true
            if(questionArray[count].reason=="0"){
            }else{
                Question.text=questionArray[count].reason
            }
        }else{
            score -= 10
        }
        if count == 9{
            warning()
        }
        
    }
    @IBAction func selectedButton4(_ sender: UIButton) {
        //selecteButton[3].backgroundColor = UIColor.red
        if  questionArray[count].choose[3]==questionArray[count].answer {
            score += 10
            selecteButton[1].isHidden = true
            selecteButton[2].isHidden = true
            selecteButton[0].isHidden = true
            if(questionArray[count].reason=="0"){
            }else{
                Question.text=questionArray[count].reason
            }
        }else{
            score -= 10
        }
        if count == 9{
            warning()
        }
    }
    func restart(){
        
        Question.isHidden = true
        QuestionNumber.isHidden = true
        selecteButton[0].isHidden = true
        selecteButton[1].isHidden = true
        selecteButton[2].isHidden = true
        selecteButton[3].isHidden = true
        Score.text = "分數：---"
        count=0
        score=0
        nextButton.setTitle("Restart", for:UIControl.State.normal)
    }
    func warning () {
        var S = ""
        if  score <= 60{
            S = "不及格"
        }else if score == 100 {
            S = "很棒"
        }else if score <= 90 && score > 60 {
            S = "及格"
        }
        let alert =  UIAlertController(title: S, message: "\(score)分", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "重新開始", style: .default, handler:{ UIAlertAction in  self.restart()})
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        check=1
        questionArray.shuffle()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        set_questionArray()
        questionArray.shuffle()
        set()
        selecteButton[0].layer.shadowOpacity = 0.5
        selecteButton[0].layer.cornerRadius = 15
        selecteButton[0].clipsToBounds = true
        selecteButton[0].layer.cornerRadius = 15
        
        selecteButton[1].layer.shadowOpacity = 0.5
        selecteButton[1].layer.cornerRadius = 15
        selecteButton[1].clipsToBounds = true
        selecteButton[1].layer.cornerRadius = 15
        
        selecteButton[2].layer.shadowOpacity = 0.5
        selecteButton[2].layer.cornerRadius = 15
        selecteButton[2].clipsToBounds = true
        selecteButton[2].layer.cornerRadius = 15
        
        selecteButton[3].layer.shadowOpacity = 0.5
        selecteButton[3].layer.cornerRadius = 15
        selecteButton[3].clipsToBounds = true
        selecteButton[3].layer.cornerRadius = 15
        
        
        nextButton.layer.shadowOpacity = 0.5
        nextButton.layer.cornerRadius = 15
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = 15
        
        
        previous.layer.shadowOpacity = 0.5
        previous.layer.cornerRadius = 15
        previous.clipsToBounds = true
        previous.layer.cornerRadius = 15
        
    }

}


