module ApplicationHelper
    def achivement_image_name(achivement) # ユーザーの称号に応じて画像を変更する。
        case achivement
        when "BEGINNER"
         'begginer.png'
        when "ROOKIE"
         'main.jpg'
        when "CHALLENGER"
         'begginer.png'
        when "MASTER"
         'begginer.png'
        end 
    end       
end
