class InventariosController < ApplicationController
  
  @root_url = "/inventario/index"

  layout 'application'

  add_flash_types :notice

  #Listar registro
  def index
   @inventarios = Inventario.all()
  end

  def create
    @inventarios = Inventario.new
  end

  def read
    @inventarios = params[:id_cliente]
    @inventarios = Inventario.where(url: @inventarios)
  end

  def insert
    #Insertar nuevo archivo
    uploaded_file = params[:img]
    File.open(Rails.root.join('public', 'assets/img', uploaded_file.original_filename), 'wb') do |file|
        file.write(uploaded_file.read)
    end

    @inventarios = Inventario.new(parametros)

    if @inventarios.save
      @postres.update_column(:img, uploaded_file.original_filename)
    else
      render :new

    end

    #Se redirecciona a una vista principal con mensaje
    @ini = "/inventarios/index"
    flash[:notice]= "Creado Exitosamente"
    redirect_to @ini

  end

  #Formulario para actualizar
  def update
    @inventarios = Inventario.find(params [:id])
    @inventarios.Inventario.where(id: @inventarios)

  end

  def editar

    #Pasamos el 'id' del registro a actualizar 
    @inventarios = Inventario.find(params[:id])

    #Se actualiza el archivo

    uploaded_file = params[:img]

    if params[:img].present?
      simg = Inventario.where(:id => @inventarios).pluck(:img)
      imgdelete = Rails.root.join('public', 'assets/img', simg.join)
      File.delete(Rails.root + imgdelete)


      #Nuevo Archivo

      File.open(Rails.root.join('public', 'assets/img', uploaded_file.original_filename), 'wb') do |file|
        file.write(uploaded_file.read)
      end

    else

      #
    end


    if @inventarios.update(parametros)

      if params[:img].present?
        @inventarios.update_column(:img,uploaded_file.original_filename)
      else
        #
      end

    else
      render  :edit


    end 

    @ini = "/postres/index"
    flash[:notice] = "Actualizado Correctamente !"
    redirect_to @ini 
  end

  def delete

    @inventarios = Inventario.find
    (params[:id])

    #Eliminamos la imagen

     simg = Inventario.where(:id => @inventarios).pluck(:img)
      imgdelete = Rails.root.join('public','assets/img', simg.join)
      File.delete(Rails.root + imgdelete)

      Inventario.where(id: @inventarios).destroy_all

      @ini= "/inventarios/index"
      flash[:notice]= "Eliminado Correctamente !"
      redirect_to @ini
  end

  private parametros
    params.permit(:placas, :marca, :modelo, :cliente,:id_cliente,:img)
  end

end
