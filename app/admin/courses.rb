ActiveAdmin.register Course do
  index do 
      column "Course Name",:name do |course|
        link_to course.name,[:admin,course]
      
      end
     
      column "",:name do |course|
        link_2= link_to "Delete",admin_course_path(course),:method => :delete,:class => "member_link"
        link_1=link_to "Edit",edit_admin_course_path(course),:class => "member_link"
        link_1+link_2
      end 
   end
   
   show do 
    attributes_table do
      row :name
      row :created_at
      row :updated_at
    end
    strong { link_to "View All Course", admin_courses_path }
    
    end
end
