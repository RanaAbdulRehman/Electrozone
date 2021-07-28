class Category < ApplicationRecord
    has_many :brands, dependent: :destroy

    before_save :set_slog
    before_update :set_slog
    private
    def set_slog
        self.slog = self.title.downcase
    end
end
