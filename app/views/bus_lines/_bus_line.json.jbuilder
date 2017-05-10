json.extract! bus_line, :id, :name, :operating_from, :operating_to, :in_charge_unit, :ticket_fee, :description, :created_at, :updated_at
json.url bus_line_url(bus_line, format: :json)
