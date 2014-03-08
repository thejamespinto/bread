<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController

  # load and authorize resources
  before_actions do
    #all actions
    # actions {  }

    # building actions
    actions(:new, :create) { @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %> }

    # member actions, will raise a 404 if the model is not found
    actions(
      :show, :edit, :update, :destroy
    ) { @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %> }
  end

  authorize_resource





  # GET <%= route_url %>
  def index
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
  end




  # GET <%= route_url %>/1
  # GET <%= route_url %>/1.json
  def show
  end

  # GET <%= route_url %>/new
  def new
  end

  # GET <%= route_url %>/1/edit
  def edit
  end




  # POST <%= route_url %>
  def create
    if @<%= orm_instance.save %>
      redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully created.'" %>
    else
      render action: 'new'
    end
  end

  # PATCH/PUT <%= route_url %>/1
  def update
    if @<%= orm_instance.update("#{singular_table_name}_params") %>
      redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully updated.'" %>
    else
      render action: 'edit'
    end
  end

  # DELETE <%= route_url %>/1
  def destroy
    if @<%= orm_instance.destroy %>
      redirect_to <%= index_helper %>_url, notice: <%= "'#{human_name} was successfully destroyed.'" %>
    else
      render action: 'edit'
    end
  end



  private

    # Only allow a trusted parameter "white list" through.
    def <%= "#{singular_table_name}_params" %>
      if params[<%= ":#{singular_table_name}" %>]
        <%- if attributes_names.empty? -%>
        params[<%= ":#{singular_table_name}" %>]
        <%- else -%>
        params.require(<%= ":#{singular_table_name}" %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
        <%- end -%>
      else
        {}
      end
    end
end
<% end -%>


################
# JSON BUILDER #
################

# # POST <%= route_url %>
# # POST <%= route_url %>.json
# def create
#   respond_to do |format|
#     if @<%= orm_instance.save %>
#       format.html { redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully created.'" %> }
#       format.json { render action: 'show', status: :created, location: <%= "@#{singular_table_name}" %> }
#     else
#       format.html { render action: 'new' }
#       format.json { render json: <%= "@#{orm_instance.errors}" %>, status: :unprocessable_entity }
#     end
#   end
# end

# # PATCH/PUT <%= route_url %>/1
# # PATCH/PUT <%= route_url %>/1.json
# def update
#   respond_to do |format|
#     if @<%= orm_instance.update("#{singular_table_name}_params") %>
#       format.html { redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully updated.'" %> }
#       format.json { render action: 'show', status: :ok, location: <%= "@#{singular_table_name}" %> }
#     else
#       format.html { render action: 'edit' }
#       format.json { render json: <%= "@#{orm_instance.errors}" %>, status: :unprocessable_entity }
#     end
#   end
# end

# # DELETE <%= route_url %>/1
# # DELETE <%= route_url %>/1.json
# def destroy
#   respond_to do |format|
#     if @<%= orm_instance.destroy %>
#       format.html { redirect_to <%= index_helper %>_url, notice: <%= "'#{human_name} was successfully destroyed.'" %> }
#       format.json { render action: 'index', status: :ok, location: <%= "@#{singular_table_name}" %> }
#     else
#       format.html { render action: 'edit' }
#       format.json { render json: <%= "@#{orm_instance.errors}" %>, status: :unprocessable_entity }
#     end
#   end
# end



