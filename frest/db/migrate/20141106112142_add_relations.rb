class AddRelations < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE TABLE relations
      (
        id uuid PRIMARY KEY NOT NULL,
        name character varying,
        fields hstore
      )
      WITH (
        OIDS=FALSE
      );
      ALTER TABLE relations
        OWNER TO gisborne;

    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE relations;
    SQL
  end
end
