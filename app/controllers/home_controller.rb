class HomeController< ApplicationController
    before_action :authenticate_user!
    def index
        if current_user.admin?
            render "admin_index.html"
        end
    end
end