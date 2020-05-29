class ProceduresRepository < ApplicationRepository
  class QueryObject < ApplicationRepository::QueryObject

    def search(text)
      return self unless text.present?
      @scope = @scope
        .where("procedures.name ~* ?", text)
      self
    end

    def sort(text)
      @scope = @scope.sort_by { |s| s[/^"#{text}"/] }
      self
    end

    private

    def build_scope
      Procedure
    end
  end
end