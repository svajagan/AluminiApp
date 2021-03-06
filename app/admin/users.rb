ActiveAdmin.register User do

  index do
    column :name do |user|
     link_to user.name,[:admin,user]
    end
    column :course
    column "" do |user|
      link_1 = link_to "Edit",edit_admin_user_path(user),:class => "member_link"
      link_2 = link_to "Delete",admin_user_path(user),:method=>:delete,:confirm => "Are you sure you want to delete ?",:class => "member_link"
      link_1+link_2
    end
  end
    
  form do |f|
  f.inputs "Details" do
    f.input :course_id,:collection => Course.all.collect{|c| [c.name,c.id]},:as => :select
   f.input :name
   f.input :email
   f.input :password,:as => :password
   f.input :password_confirmation,:label=>"Confirm Password",:as => :password
   f.input :year_of_passing,:as => :number
  
   end
   f.buttons
  end
  
  show do
    attributes_table do
      row :name
      row :course_id
      row :email
      row :year_of_passing
    end
    strong{link_to "View All Users",admin_users_path}
    active_admin_comments
    
  end
end
