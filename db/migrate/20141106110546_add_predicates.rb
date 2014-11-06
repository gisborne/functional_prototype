class AddPredicates < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE TABLE predicates
      (
        id uuid PRIMARY KEY NOT NULL,
        fn character varying(2000),
        fields hstore,
        created_at timestamp without time zone DEFAULT now(),
        name character varying
      )
      WITH (
        OIDS=FALSE
      );
      ALTER TABLE predicates
        OWNER TO gisborne;

      CREATE INDEX predicates_idx
        ON predicates
        USING gin
        (fn COLLATE pg_catalog."default", fields, created_at);
    SQL
  end

  def down
    execute <<-SQL
      DROP TABLE predicates;
    SQL
  end
end
