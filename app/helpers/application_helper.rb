module ApplicationHelper
    def achivement_image_name(achivement) # ユーザーの称号に応じて画像を変更する。
        case achivement
        when "BEGINNER"
         'begginer.png'
        when "ROOKIE"
         'rookie.png'
        when "CHALLENGER"
         'challenger.png'
        when "MASTER"
         'master.png'
        end 
    end
    
    def achivement_check(achivement) # ユーザーの称号でボタン権限をつける
         achivement == "CHALLENGER" || achivement == "MASTER"
    end
        
end
