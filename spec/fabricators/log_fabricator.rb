Fabricator(:log) do
  logged_at { DateTime.new(2011,1,2) }
  subject "MyString"
end
