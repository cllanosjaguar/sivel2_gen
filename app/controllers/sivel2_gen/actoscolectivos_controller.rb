# encoding: UTF-8
require 'date'

module Sivel2Gen
  class ActoscolectivosController < ApplicationController
    load_and_authorize_resource class: Sivel2Gen::Actocolectivo

    # Crea nuevos actos procesando parámetros
    def agregar
      if params[:caso][:id].nil?
        respond_to do |format|
          format.html { render inline: 'Falta identificacion del caso' }
        end
      elsif !params[:caso_actocolectivo_id_presponsable]
        respond_to do |format|
          format.html { render inline: 'Debe tener Presunto Responsable' }
        end
      elsif !params[:caso_actocolectivo_id_categoria]
        respond_to do |format|
          format.html { render inline: 'Debe tener Categoria' }
        end
      elsif !params[:caso_actocolectivo_id_grupoper]
        respond_to do |format|
          format.html { render inline: 'Debe tener Víctima Colectiva' }
        end
      else
        params[:caso_actocolectivo_id_presponsable].each do |cpresp|
          presp = cpresp.to_i
          params[:caso_actocolectivo_id_categoria].each do |ccat|
            cat = ccat.to_i
            params[:caso_actocolectivo_id_grupoper].each do |cvicc|
              vicc = cvicc.to_i
              @caso = Sivel2Gen::Caso.find(params[:caso][:id])
              @caso.current_usuario = current_usuario
              authorize! :update, @caso
              actocolectivo = Sivel2Gen::Actocolectivo.new(
                id_presponsable: presp,
                id_categoria: cat,
                id_grupoper: vicc,
              )
              actocolectivo.caso = @caso
              actocolectivo.save
            end
          end
        end
      end
    
      respond_to do |format|
        format.js { render 'refrescar' }
      end
    end

    def eliminar
      actocolectivo = Actocolectivo.where(id: params[:id_actocolectivo].to_i).take
      if actocolectivo
        @caso = actocolectivo.caso
        actocolectivo.destroy!
      end
      respond_to do |format|
        format.js { render 'refrescar' }
      end
    end

  end
end
