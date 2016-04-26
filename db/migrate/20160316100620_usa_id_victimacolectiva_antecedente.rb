class UsaIdVictimacolectivaAntecedente < ActiveRecord::Migration
  def up
   execute <<-SQL
     ALTER TABLE sivel2_gen_antecedente_comunidad 
      RENAME TO sivel2_gen_antecedente_victimacolectiva;

     ALTER TABLE sivel2_gen_antecedente_victimacolectiva 
      ADD COLUMN victimacolectiva_id
        INTEGER REFERENCES sivel2_gen_victimacolectiva(id);

    UPDATE sivel2_gen_antecedente_victimacolectiva SET 
      victimacolectiva_id=sivel2_gen_victimacolectiva.id 
      FROM sivel2_gen_victimacolectiva WHERE 
        sivel2_gen_antecedente_victimacolectiva.id_grupoper=sivel2_gen_victimacolectiva.id_grupoper
      AND sivel2_gen_antecedente_victimacolectiva.id_caso=sivel2_gen_victimacolectiva.id_caso;

    ALTER TABLE sivel2_gen_antecedente_victimacolectiva
      DROP COLUMN id_grupoper;
    
     ALTER TABLE sivel2_gen_antecedente_victimacolectiva
      DROP COLUMN id_caso;
   SQL
  end
  def down
   execute <<-SQL
     ALTER TABLE sivel2_gen_antecedente_victimacolectiva
      ADD COLUMN id_caso INTEGER REFERENCES sivel2_gen_caso;

     ALTER TABLE sivel2_gen_antecedente_victimacolectiva
      ADD COLUMN id_grupoper INTEGER REFERENCES sivel2_gen_grupoper;

     UPDATE sivel2_gen_antecedente_victimacolectiva SET 
      id_grupoper=sivel2_gen_victimacolectiva.id_grupoper,
      id_caso=sivel2_gen_victimacolectiva.id_caso
      FROM sivel2_gen_victimacolectiva WHERE 
        sivel2_gen_antecedente_victimacolectiva.victimacolectiva_id=sivel2_gen_victimacolectiva.id;

     ALTER TABLE sivel2_gen_antecedente_victimacolectiva 
      DROP COLUMN victimacolectiva_id;

     ALTER TABLE sivel2_gen_antecedente_victimacolectiva
      RENAME TO sivel2_gen_antecedente_comunidad ;
   SQL
  end
end