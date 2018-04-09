class User < ActiveRecord::Base
    has_many :posts

    # def userPost
    #   User.where([])
    # end

end

class Post < ActiveRecord::Base
    belongs_to :user
end
