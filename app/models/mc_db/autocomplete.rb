module McDb::Autocomplete
  def autocomplete(term)
    any_of({"#{:last_username}" => /#{term}/}).
    limit(10).
    to_a
  end
end
