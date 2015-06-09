# encoding: UTF-8
module Sivel2Gen
  module Admin
    class SectoressocialesController < Sip::Admin::BasicasController
      before_action :set_sectorsocial, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sivel2Gen::Sectorsocial
  
      def clase 
        "Sivel2Gen::Sectorsocial"
      end
  
      def set_sectorsocial
        @basica = Sectorsocial.find(params[:id])
      end
  
      def sectorsocial_params
        params.require(:sectorsocial).permit(*atributos_form)
      end
  
    end
  end
end
