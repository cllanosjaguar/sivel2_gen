# encoding: UTF-8

module Sivel2Gen
  module Concerns
    module Models
      module Caso 
        extend ActiveSupport::Concern

        included do
          include Sip::Modelo
          include Sip::Localizacion
          include Sip::FormatoFechaHelper

          @current_usuario = nil
          attr_accessor :current_usuario

          # Ordenados por foreign_key para facilitar comparar con esquema en base
          has_many :acto, foreign_key: "id_caso", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::Acto'
          accepts_nested_attributes_for :acto, allow_destroy: true, 
            reject_if: :all_blank

          has_many :actocolectivo, foreign_key: "id_caso", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::Actocolectivo'

          has_many :anexo_caso, foreign_key: "id_caso", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::AnexoCaso',
            inverse_of: :caso
          accepts_nested_attributes_for :anexo_caso, allow_destroy: true, 
            reject_if: :all_blank
          has_many :sip_anexo, :through => :anexo_caso, 
            class_name: 'Sip::Anexo'
          accepts_nested_attributes_for :sip_anexo,  reject_if: :all_blank

          has_and_belongs_to_many :antecedente, 
            class_name: 'Sivel2Gen::Antecedente',
            foreign_key: :id_caso, 
            association_foreign_key: :id_antecedente,
            join_table: 'sivel2_gen_antecedente_caso'

          has_and_belongs_to_many :contexto, 
            class_name: 'Sivel2Gen::Contexto',
            foreign_key: :id_caso, 
            association_foreign_key: :id_contexto,
            join_table: 'sivel2_gen_caso_contexto'

          has_many :caso_etiqueta, foreign_key: "id_caso", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::CasoEtiqueta'
          has_many :etiqueta, through: :caso_etiqueta, 
            class_name: 'Sip::Etiqueta'
          accepts_nested_attributes_for :caso_etiqueta, allow_destroy: true, 
            reject_if: :all_blank
          
          has_many :caso_fotra, foreign_key: "id_caso", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::CasoFotra',
            inverse_of: :caso
          accepts_nested_attributes_for :caso_fotra, allow_destroy: true, 
            reject_if: :all_blank
          has_many :fotra, through: :caso_fotra, class_name: 'Sip::Fotra'

          has_many :caso_fuenteprensa, foreign_key: "id_caso", 
            validate: true, dependent: :destroy, 
            class_name: 'Sivel2Gen::CasoFuenteprensa', inverse_of: :caso
          accepts_nested_attributes_for :caso_fuenteprensa, 
            allow_destroy: true, reject_if: :all_blank
          has_many :fuenteprensa, through: :caso_fuenteprensa, 
            class_name: 'Sip::Fuenteprensa'

          has_and_belongs_to_many :frontera, 
            class_name: 'Sivel2Gen::Frontera',
            foreign_key: 'id_caso',
            association_foreign_key: 'id_frontera',
            join_table: 'sivel2_gen_caso_frontera'

          has_many :caso_presponsable, foreign_key: "id_caso", 
            validate: true, 
            dependent: :destroy, 
            class_name: 'Sivel2Gen::CasoPresponsable'
          has_many :presponsable, through: :caso_presponsable, 
            class_name: 'Sivel2Gen::Presponsable'
          accepts_nested_attributes_for :caso_presponsable, 
            allow_destroy: true, reject_if: :all_blank

          has_and_belongs_to_many :region, 
            class_name: 'Sivel2Gen::Region',
            foreign_key: 'id_caso', 
            association_foreign_key: 'id_region',
            join_table: 'sivel2_gen_caso_region'

          has_many :caso_usuario, foreign_key: "id_caso", validate: true, 
            class_name: 'Sivel2Gen::CasoUsuario', dependent: :delete_all
          has_many :usuario, :through => :caso_usuario, class_name: 'Usuario'

          has_many :ubicacion, foreign_key: "id_caso", validate: true, 
            dependent: :destroy, class_name: 'Sip::Ubicacion'
          accepts_nested_attributes_for :ubicacion, allow_destroy: true, 
            reject_if: :all_blank

          has_many :victima,  foreign_key: "id_caso", dependent: :destroy, 
            class_name: 'Sivel2Gen::Victima'
          has_many :persona, :through => :victima, class_name: 'Sip::Persona'
          accepts_nested_attributes_for :persona,  reject_if: :all_blank
          accepts_nested_attributes_for :victima, allow_destroy: true, 
            reject_if: :all_blank

          has_many :victimacolectiva, foreign_key: "id_caso", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::Victimacolectiva' 
          has_many :grupoper, :through => :victimacolectiva, 
            class_name: 'Sip::Grupoper'
          accepts_nested_attributes_for :grupoper,  reject_if: :all_blank
          accepts_nested_attributes_for :victimacolectiva, 
            allow_destroy: true, 
            reject_if: :all_blank

          has_many :combatiente, foreign_key: "id_caso", validate: true, 
            dependent: :destroy, class_name: 'Sivel2Gen::Combatiente' 
          accepts_nested_attributes_for :combatiente, allow_destroy: true, 
            reject_if: :all_blank

          has_one :sivel2_gen_conscaso, foreign_key: "caso_id"

          belongs_to :intervalo, foreign_key: "id_intervalo", 
            validate: true, class_name: 'Sivel2Gen::Intervalo'

          campofecha_localizado :fecha

          validates_presence_of :fecha
          validates :titulo, length: { maximum: 50 }
          validates :hora, length: { maximum: 10 }
          validates :duracion, length: { maximum: 10 }
          validates :grconfiabilidad, length: { maximum: 5 }
          validates :gresclarecimiento, length: { maximum: 5 }
          validates :grimpunidad, length: { maximum: 8 }
          validates :grinformacion, length: { maximum: 8 }

        end

        module ClassMethods


        end


      end
    end
  end
end
