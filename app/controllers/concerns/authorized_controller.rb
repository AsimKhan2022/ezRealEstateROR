module AuthorizedController
  extend ActiveSupport::Concern

  private

  def set_admin
    @admin = current_admin
  end

  def set_company
    @company = Company.find(params[:id])
  end

  def set_seller
    @seller = Seller.find(params[:id])
  end

  def set_buyer
    @buyer = Buyer.find(params[:id])
  end

  def set_property
    @property = Property.find(params[:id])
  end

  def set_lead
    @lead = Lead.find(params[:id])
  end

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  def set_tenant
    @tenant = Tenant.find(params[:id])
  end

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def set_medium
    @medium = Medium.find(params[:id])
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def set_user
    return unless params[:id].present?

    @user = User.find_by(id: params[:id])
  end

 # rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Style/GuardClause, Style/IfUnlessModifier, Layout/CommentIndentation, Lint/RedundantCopDisableDirective
  def authorize_admin
    unless current_admin && (admin_authorized?(@company) || admin_authorized?(@seller) || admin_authorized?(@buyer) || admin_authorized?(@user) || admin_authorized?(@property) || admin_authorized?(@assignment) || admin_authorized?(@lead) || admin_authorized?(@tenant) || admin_authorized?(@sale) || admin_authorized?(@medium) || admin_authorized?(@article))
      redirect_to root_path, alert: 'You are not authorized to perform this action'
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Style/GuardClause, Style/IfUnlessModifier, Layout/CommentIndentation, Lint/RedundantCopDisableDirective

  def admin_authorized?(resource)
    resource && resource.admin == current_admin
  end
end
