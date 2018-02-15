json.user do
  json.partial! 'user', user: @user

  json.organizations @user_organizations do |org|
    json.extract! org, :id, :uid, :name, :account_frozen, :created_at
    json.role @user.role(org)
  end
end
