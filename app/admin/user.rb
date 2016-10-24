ActiveAdmin.register User do
  permit_params :name, :email, :password_digest, :remember_token, :is_admin, :label
end
