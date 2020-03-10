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
end
