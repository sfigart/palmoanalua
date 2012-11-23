class RegistrationsDatatable
  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Registration.count,
      iTotalDisplayRecords: registrations.total_entries,
      aaData: data
    }
  end

private

  def data
    registrations.map do |registration|
      [
        link_to(registration.player_name, registration),
        h(registration.email_address),
        h(registration.grade),
        h(registration.age),
        h(registration.gender),
        h(registration.shirt_size)
      ]
    end
  end

  def registrations
    @registrations ||= fetch_registrations
  end

  def fetch_registrations
    registrations = Registration.order("#{sort_column} #{sort_direction}")
    registrations = registrations.page(page).per_page(per_page)
    if params[:sSearch].present?
      registrations = registrations.where("player_last_name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    registrations
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[player_last_name email_address]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end