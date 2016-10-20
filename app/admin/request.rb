ActiveAdmin.register Request do
  permit_params :date, :user_id, :admin_id, :room_id, :deleted, :exported
end
