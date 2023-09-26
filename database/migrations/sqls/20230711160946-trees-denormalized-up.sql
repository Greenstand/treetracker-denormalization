CREATE TABLE trees_denormalized (
    id int NOT NULL PRIMARY KEY,
    organizations int[] NOT NULL,
    wallet_id uuid,
    country_id int NOT NULL,
    continent_id int NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    time_created timestamp without time zone NOT NULL,
    time_updated timestamp without time zone NOT NULL,
    missing boolean DEFAULT false,
    priority boolean DEFAULT false,
    cause_of_death_id integer,
    planter_id integer,
    primary_location_id integer,
    settings_id integer,
    override_settings_id integer,
    dead integer DEFAULT 0 NOT NULL,
    photo_id integer,
    image_url character varying,
    certificate_id integer,
    estimated_geometric_location geometry(Point,4326),
    lat numeric,
    lon numeric,
    gps_accuracy integer,
    active boolean DEFAULT true,
    planter_photo_url character varying,
    planter_identifier character varying,
    device_id integer,
    sequence integer,
    note character varying,
    verified boolean DEFAULT false NOT NULL,
    uuid character varying,
    approved boolean DEFAULT false NOT NULL,
    status character varying DEFAULT 'planted'::character varying NOT NULL,
    cluster_regions_assigned boolean DEFAULT false NOT NULL,
    species_id integer,
    planting_organization_id integer,
    payment_id integer,
    contract_id integer,
    token_issued boolean DEFAULT false NOT NULL,
    morphology text,
    age text,
    species character varying,
    capture_approval_tag text,
    rejection_reason text,
    matching_hash character varying,
    device_identifier character varying,
    images jsonb,
    domain_specific_data jsonb,
    image_url_backup character varying,
    token_id uuid,
    name character varying,
    earnings_id uuid,
    session_id uuid
);

CREATE INDEX certificate_id_idx ON trees_denormalized USING btree (certificate_id);
CREATE INDEX tree_planter_org_planter_idx ON trees_denormalized USING btree (planter_id, planting_organization_id);
CREATE INDEX trees_active_approved_idx ON trees_denormalized USING btree (active, approved);
CREATE INDEX trees_active_by_time_created_idx ON trees_denormalized USING btree (active, time_created);
CREATE INDEX trees_active_idx ON trees_denormalized USING btree (active);
CREATE INDEX trees_active_species_id_idx ON trees_denormalized USING btree (active, species_id);
CREATE INDEX trees_approved_by_time_created_idx ON trees_denormalized USING btree (approved, time_created);
CREATE INDEX trees_approved_idx ON trees_denormalized USING btree (approved);
CREATE INDEX trees_cause_of_death_id ON trees_denormalized USING btree (cause_of_death_id);
CREATE INDEX trees_estimated_geometric_location_index_btree ON trees_denormalized USING btree (estimated_geometric_location);
CREATE INDEX trees_estimated_geometric_location_index_gist ON trees_denormalized USING gist (estimated_geometric_location);
CREATE INDEX trees_expr_idx ON trees_denormalized USING btree ((1)) WHERE active;
CREATE UNIQUE INDEX trees_name_idx ON trees_denormalized USING btree (name);
CREATE INDEX trees_override_settings_id ON trees_denormalized USING btree (override_settings_id);
CREATE INDEX trees_payment_id_idx ON trees_denormalized USING btree (payment_id);
CREATE INDEX trees_planter_id_by_time_created_idx ON trees_denormalized USING btree (planter_id, time_created);
CREATE INDEX trees_planter_id_idx ON trees_denormalized USING btree (planter_id);
CREATE INDEX trees_planting_organization_id_by_time_created_idx ON trees_denormalized USING btree (planting_organization_id, time_created);
CREATE INDEX trees_planting_organization_id_idx ON trees_denormalized USING btree (planting_organization_id);
CREATE INDEX trees_primary_location_id ON trees_denormalized USING btree (primary_location_id);
CREATE INDEX trees_settings_id ON trees_denormalized USING btree (settings_id);
CREATE INDEX trees_species_id_idx ON trees_denormalized USING btree (species_id);
CREATE INDEX trees_token_id_idx ON trees_denormalized USING btree (token_id);
CREATE INDEX trees_user_id ON trees_denormalized USING btree (planter_id);
CREATE INDEX trees_uuid_idx ON trees_denormalized USING btree (uuid);
CREATE UNIQUE INDEX trees_uuid_idx1 ON trees_denormalized USING btree (uuid);
CREATE INDEX trees_verify_query_idx ON trees_denormalized USING btree (planter_id, approved, time_created);