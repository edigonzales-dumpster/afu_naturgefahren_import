CREATE SCHEMA IF NOT EXISTS afu_naturgefahren_work;
CREATE SEQUENCE afu_naturgefahren_work.t_ili2db_seq;;
-- Naturgefahrenkarte_SO_V11.NatGef.Perimeter_Gefahrenkarte
CREATE TABLE afu_naturgefahren_work.natgef_perimeter_gefahrenkarte (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,perimeter_name varchar(254) NOT NULL
  ,erstellungsart varchar(255) NOT NULL
  ,gk_nach_massnahmen varchar(254) NOT NULL
  ,erstellungsdatum date NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgef_perimeter_gfhrnkrte_geometrie_idx ON afu_naturgefahren_work.natgef_perimeter_gefahrenkarte USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.Objektkategorien_und_Schutzziele
CREATE TABLE afu_naturgefahren_work.natgef_objektkategorien_und_schutzziele (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,datenquelle varchar(254) NOT NULL
  ,objektkategorie decimal(2,1) NOT NULL
  ,schutzziel_0_30 integer NOT NULL
  ,schutzziel_30_100 integer NOT NULL
  ,schutzziel_100_300 integer NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgf_bjktktg_nd_schtzzele_geometrie_idx ON afu_naturgefahren_work.natgef_objektkategorien_und_schutzziele USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.Prozessquelle_Wasser
CREATE TABLE afu_naturgefahren_work.natgef_prozessquelle_wasser (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(LINESTRING,21781) NOT NULL
  ,prozessquelle_wasser varchar(254) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgef_prozessquelle_wsser_geometrie_idx ON afu_naturgefahren_work.natgef_prozessquelle_wasser USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.Prozessquelle_Sturz
CREATE TABLE afu_naturgefahren_work.natgef_prozessquelle_sturz (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,prozessquelle_sturz varchar(254) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgef_prozessquelle_sturz_geometrie_idx ON afu_naturgefahren_work.natgef_prozessquelle_sturz USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.IK_Wasser
CREATE TABLE afu_naturgefahren_work.natgef_ik_wasser (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,prozessart_wasser varchar(255) NOT NULL
  ,wiederkehrperiode_wasser varchar(255) NOT NULL
  ,intensitaet_wasser varchar(255) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
  ,prozessquelle_wasser bigint NULL
)
;
CREATE INDEX natgef_ik_wasser_geometrie_idx ON afu_naturgefahren_work.natgef_ik_wasser USING GIST ( geometrie );
CREATE INDEX natgef_ik_wasser_prozessquelle_wasser_idx ON afu_naturgefahren_work.natgef_ik_wasser ( prozessquelle_wasser );
-- Naturgefahrenkarte_SO_V11.NatGef.RG_Wasser
CREATE TABLE afu_naturgefahren_work.natgef_rg_wasser (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,prozessart_wasser varchar(255) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
  ,prozessquelle_wasser bigint NULL
)
;
CREATE INDEX natgef_rg_wasser_geometrie_idx ON afu_naturgefahren_work.natgef_rg_wasser USING GIST ( geometrie );
CREATE INDEX natgef_rg_wasser_prozessquelle_wasser_idx ON afu_naturgefahren_work.natgef_rg_wasser ( prozessquelle_wasser );
-- Naturgefahrenkarte_SO_V11.NatGef.GK_Wasser
CREATE TABLE afu_naturgefahren_work.natgef_gk_wasser (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,gefahrenstufe_wasser varchar(255) NOT NULL
  ,prozessart_wasser varchar(255) NOT NULL
  ,beschriftung_wasser varchar(255) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgef_gk_wasser_geometrie_idx ON afu_naturgefahren_work.natgef_gk_wasser USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.Ueberflutungskarte
CREATE TABLE afu_naturgefahren_work.natgef_ueberflutungskarte (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,wiederkehrperiode_wasser varchar(255) NOT NULL
  ,ueberflutungshoehe_wasser varchar(255) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
  ,prozessquelle_wasser bigint NULL
)
;
CREATE INDEX natgef_ueberflutungskarte_geometrie_idx ON afu_naturgefahren_work.natgef_ueberflutungskarte USING GIST ( geometrie );
CREATE INDEX natgef_ueberflutungskarte_prozessquelle_wasser_idx ON afu_naturgefahren_work.natgef_ueberflutungskarte ( prozessquelle_wasser );
-- Naturgefahrenkarte_SO_V11.NatGef.Punktsignatur
CREATE TABLE afu_naturgefahren_work.natgef_punktsignatur (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POINT,21781) NOT NULL
  ,art varchar(255) NOT NULL
  ,rotation integer NOT NULL
  ,wiederkehrperiode_wasser varchar(255) NOT NULL
)
;
CREATE INDEX natgef_punktsignatur_geometrie_idx ON afu_naturgefahren_work.natgef_punktsignatur USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.IK_Sturz
CREATE TABLE afu_naturgefahren_work.natgef_ik_sturz (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,prozessart_sturz varchar(255) NOT NULL
  ,wiederkehrperiode_sturz varchar(255) NOT NULL
  ,intensitaet_sturz varchar(255) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
  ,prozessquelle_sturz bigint NULL
)
;
CREATE INDEX natgef_ik_sturz_geometrie_idx ON afu_naturgefahren_work.natgef_ik_sturz USING GIST ( geometrie );
CREATE INDEX natgef_ik_sturz_prozessquelle_sturz_idx ON afu_naturgefahren_work.natgef_ik_sturz ( prozessquelle_sturz );
-- Naturgefahrenkarte_SO_V11.NatGef.RG_Sturz
CREATE TABLE afu_naturgefahren_work.natgef_rg_sturz (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,prozessart_sturz varchar(255) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
  ,prozessquelle_sturz bigint NULL
)
;
CREATE INDEX natgef_rg_sturz_geometrie_idx ON afu_naturgefahren_work.natgef_rg_sturz USING GIST ( geometrie );
CREATE INDEX natgef_rg_sturz_prozessquelle_sturz_idx ON afu_naturgefahren_work.natgef_rg_sturz ( prozessquelle_sturz );
-- Naturgefahrenkarte_SO_V11.NatGef.GK_Sturz
CREATE TABLE afu_naturgefahren_work.natgef_gk_sturz (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,gefahrenstufe_sturz varchar(255) NOT NULL
  ,prozessart_sturz varchar(255) NOT NULL
  ,beschriftung_sturz varchar(255) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgef_gk_sturz_geometrie_idx ON afu_naturgefahren_work.natgef_gk_sturz USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_kontinuierlich_Sackung
CREATE TABLE afu_naturgefahren_work.natgef_ik_rutschung_kontinuierlich_sackung (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,prozessart_rutsch varchar(255) NOT NULL
  ,rutschgeschwindigkeit varchar(255) NOT NULL
  ,tiefe_gleitflaeche varchar(255) NOT NULL
  ,differenzialbewegung varchar(255) NOT NULL
  ,beschleunigung varchar(255) NOT NULL
  ,intensitaet_korrektur varchar(255) NOT NULL
  ,intensitaet_definitv varchar(255) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgf_k_rtschtnrlch_sckung_geometrie_idx ON afu_naturgefahren_work.natgef_ik_rutschung_kontinuierlich_sackung USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.GK_Rutschung_kontinuierlich_Sackung
CREATE TABLE afu_naturgefahren_work.natgef_gk_rutschung_kontinuierlich_sackung (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,gefahrenstufe_rutsch_kont varchar(255) NOT NULL
  ,prozessart_rutsch_kont varchar(255) NOT NULL
  ,beschriftung_rutsch_kont varchar(255) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgf_gk_rtsctnrlch_sckung_geometrie_idx ON afu_naturgefahren_work.natgef_gk_rutschung_kontinuierlich_sackung USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_spontan
CREATE TABLE afu_naturgefahren_work.natgef_ik_rutschung_spontan (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,wiederkehrperiode_rutsch_spont varchar(255) NOT NULL
  ,intensitaet_rutsch_spont varchar(255) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgef_ik_rutschung_spntan_geometrie_idx ON afu_naturgefahren_work.natgef_ik_rutschung_spontan USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.GK_Rutschung_spontan
CREATE TABLE afu_naturgefahren_work.natgef_gk_rutschung_spontan (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,gefahrenstufe_rutsch_spont varchar(255) NOT NULL
  ,beschriftung_rutsch_spont varchar(255) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgef_gk_rutschung_spntan_geometrie_idx ON afu_naturgefahren_work.natgef_gk_rutschung_spontan USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.IK_Hangmure
CREATE TABLE afu_naturgefahren_work.natgef_ik_hangmure (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,wiederkehrperiode_hangmure varchar(255) NOT NULL
  ,intensitaet_hangmure varchar(255) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgef_ik_hangmure_geometrie_idx ON afu_naturgefahren_work.natgef_ik_hangmure USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.GK_Hangmure
CREATE TABLE afu_naturgefahren_work.natgef_gk_hangmure (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,gefahrenstufe_hangmure varchar(255) NOT NULL
  ,beschriftung_hangmure varchar(255) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgef_gk_hangmure_geometrie_idx ON afu_naturgefahren_work.natgef_gk_hangmure USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.IK_Absenkung_Einsturz
CREATE TABLE afu_naturgefahren_work.natgef_ik_absenkung_einsturz (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,wiederkehrperiode_absenkung varchar(255) NOT NULL
  ,intensitaet_absenkung varchar(255) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgef_ik_absenkung_nsturz_geometrie_idx ON afu_naturgefahren_work.natgef_ik_absenkung_einsturz USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.GK_Absenkung_Einsturz
CREATE TABLE afu_naturgefahren_work.natgef_gk_absenkung_einsturz (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,gefahrenstufe_absenkung varchar(255) NOT NULL
  ,beschriftung_absenkung varchar(255) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgef_gk_absenkung_nsturz_geometrie_idx ON afu_naturgefahren_work.natgef_gk_absenkung_einsturz USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.GK_synoptisch
CREATE TABLE afu_naturgefahren_work.natgef_gk_synoptisch (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,gefahrenstufe varchar(255) NOT NULL
  ,beschriftung_synopt_gk varchar(255) NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgef_gk_synoptisch_geometrie_idx ON afu_naturgefahren_work.natgef_gk_synoptisch USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_WKP_0_bis_30_Jahre
CREATE TABLE afu_naturgefahren_work.natgef_schutzdefizit_wkp_0_bis_30_jahre (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,defizitwert_wkp_0_bis_30 integer NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgf_schtzdf_0_bs_30_jhre_geometrie_idx ON afu_naturgefahren_work.natgef_schutzdefizit_wkp_0_bis_30_jahre USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Wasser
CREATE TABLE afu_naturgefahren_work.natgef_schutzdefizit_wasser (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,defizitwert_wasser integer NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgef_schutzdefizit_wsser_geometrie_idx ON afu_naturgefahren_work.natgef_schutzdefizit_wasser USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Sturz
CREATE TABLE afu_naturgefahren_work.natgef_schutzdefizit_sturz (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,defizitwert_sturz integer NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgef_schutzdefizit_sturz_geometrie_idx ON afu_naturgefahren_work.natgef_schutzdefizit_sturz USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Hangbewegung
CREATE TABLE afu_naturgefahren_work.natgef_schutzdefizit_hangbewegung (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,defizitwert_hangbewegung integer NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgef_schtzdfzt_hngbwgung_geometrie_idx ON afu_naturgefahren_work.natgef_schutzdefizit_hangbewegung USING GIST ( geometrie );
-- Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_synoptisch
CREATE TABLE afu_naturgefahren_work.natgef_schutzdefizit_synoptisch (
  T_Id bigint PRIMARY KEY DEFAULT nextval('afu_naturgefahren_work.t_ili2db_seq')
  ,geometrie geometry(POLYGON,21781) NOT NULL
  ,defizitwert_synoptisch integer NOT NULL
  ,bemerkungen varchar(254) NOT NULL
)
;
CREATE INDEX natgef_schutzdfzt_synptsch_geometrie_idx ON afu_naturgefahren_work.natgef_schutzdefizit_synoptisch USING GIST ( geometrie );
CREATE TABLE afu_naturgefahren_work.T_ILI2DB_BASKET (
  T_Id bigint PRIMARY KEY
  ,dataset bigint NULL
  ,topic varchar(200) NOT NULL
  ,T_Ili_Tid varchar(200) NULL
  ,attachmentKey varchar(200) NOT NULL
  ,domains varchar(1024) NULL
)
;
CREATE INDEX T_ILI2DB_BASKET_dataset_idx ON afu_naturgefahren_work.t_ili2db_basket ( dataset );
CREATE TABLE afu_naturgefahren_work.T_ILI2DB_DATASET (
  T_Id bigint PRIMARY KEY
  ,datasetName varchar(200) NULL
)
;
CREATE TABLE afu_naturgefahren_work.T_ILI2DB_INHERITANCE (
  thisClass varchar(1024) PRIMARY KEY
  ,baseClass varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.T_ILI2DB_SETTINGS (
  tag varchar(60) PRIMARY KEY
  ,setting varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.T_ILI2DB_TRAFO (
  iliname varchar(1024) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE afu_naturgefahren_work.T_ILI2DB_MODEL (
  filename varchar(250) NOT NULL
  ,iliversion varchar(3) NOT NULL
  ,modelName text NOT NULL
  ,content text NOT NULL
  ,importDate timestamp NOT NULL
  ,PRIMARY KEY (modelName,iliversion)
)
;
CREATE TABLE afu_naturgefahren_work.beschriftung_synopt_gk (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.ueberflutungshoehe_wasser (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.beschriftung_hangmure (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.erstellungsart (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.prozessart_wasser (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.intensitaet_korrektur (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.tiefe_gleitflaeche (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.prozessart_rutsch_kont (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.beschriftung_rutsch_kont (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.beschriftung_rutsch_spont (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.prozessart_sturz (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.wiederkehrperiode (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.intensitaet (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.rutschgeschwindigkeit (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.beschleunigung (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.beschriftung_sturz (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.punktsignatur (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.beschriftung_absenkung (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.beschriftung_wasser (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.gefahrenstufe (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.differenzialbewegung (
  itfCode integer PRIMARY KEY
  ,iliCode varchar(1024) NOT NULL
  ,seq integer NULL
  ,inactive boolean NOT NULL
  ,dispName varchar(250) NOT NULL
  ,description varchar(1024) NULL
)
;
CREATE TABLE afu_naturgefahren_work.T_ILI2DB_CLASSNAME (
  IliName varchar(1024) PRIMARY KEY
  ,SqlName varchar(1024) NOT NULL
)
;
CREATE TABLE afu_naturgefahren_work.T_ILI2DB_ATTRNAME (
  IliName varchar(1024) NOT NULL
  ,SqlName varchar(1024) NOT NULL
  ,ColOwner varchar(1024) NOT NULL
  ,Target varchar(1024) NULL
  ,PRIMARY KEY (ColOwner,SqlName)
)
;
CREATE TABLE afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (
  tablename varchar(255) NOT NULL
  ,subtype varchar(255) NULL
  ,columnname varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (
  tablename varchar(255) NOT NULL
  ,tag varchar(1024) NOT NULL
  ,setting varchar(1024) NOT NULL
)
;
CREATE TABLE afu_naturgefahren_work.T_ILI2DB_META_ATTRS (
  ilielement varchar(255) NOT NULL
  ,attr_name varchar(1024) NOT NULL
  ,attr_value varchar(1024) NOT NULL
)
;
ALTER TABLE afu_naturgefahren_work.natgef_objektkategorien_und_schutzziele ADD CONSTRAINT natgf_bjktkt_nd_schtzzele_objektkategorie_check CHECK( objektkategorie BETWEEN 1.0 AND 3.3);
ALTER TABLE afu_naturgefahren_work.natgef_objektkategorien_und_schutzziele ADD CONSTRAINT natgf_bjktkt_nd_schtzzele_schutzziel_0_30_check CHECK( schutzziel_0_30 BETWEEN 0 AND 99);
ALTER TABLE afu_naturgefahren_work.natgef_objektkategorien_und_schutzziele ADD CONSTRAINT natgf_bjktkt_nd_schtzzele_schutzziel_30_100_check CHECK( schutzziel_30_100 BETWEEN 0 AND 99);
ALTER TABLE afu_naturgefahren_work.natgef_objektkategorien_und_schutzziele ADD CONSTRAINT natgf_bjktkt_nd_schtzzele_schutzziel_100_300_check CHECK( schutzziel_100_300 BETWEEN 0 AND 99);
CREATE UNIQUE INDEX natgef_prozessquelle_wsser_prozessquelle_wasser_key ON afu_naturgefahren_work.natgef_prozessquelle_wasser (prozessquelle_wasser)
;
CREATE UNIQUE INDEX natgef_prozessquelle_sturz_prozessquelle_sturz_key ON afu_naturgefahren_work.natgef_prozessquelle_sturz (prozessquelle_sturz)
;
ALTER TABLE afu_naturgefahren_work.natgef_ik_wasser ADD CONSTRAINT natgef_ik_wasser_prozessquelle_wasser_fkey FOREIGN KEY ( prozessquelle_wasser ) REFERENCES afu_naturgefahren_work.natgef_prozessquelle_wasser DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE afu_naturgefahren_work.natgef_rg_wasser ADD CONSTRAINT natgef_rg_wasser_prozessquelle_wasser_fkey FOREIGN KEY ( prozessquelle_wasser ) REFERENCES afu_naturgefahren_work.natgef_prozessquelle_wasser DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE afu_naturgefahren_work.natgef_ueberflutungskarte ADD CONSTRAINT natgef_ueberflutungskarte_prozessquelle_wasser_fkey FOREIGN KEY ( prozessquelle_wasser ) REFERENCES afu_naturgefahren_work.natgef_prozessquelle_wasser DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE afu_naturgefahren_work.natgef_punktsignatur ADD CONSTRAINT natgef_punktsignatur_rotation_check CHECK( rotation BETWEEN 0 AND 359);
ALTER TABLE afu_naturgefahren_work.natgef_ik_sturz ADD CONSTRAINT natgef_ik_sturz_prozessquelle_sturz_fkey FOREIGN KEY ( prozessquelle_sturz ) REFERENCES afu_naturgefahren_work.natgef_prozessquelle_sturz DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE afu_naturgefahren_work.natgef_rg_sturz ADD CONSTRAINT natgef_rg_sturz_prozessquelle_sturz_fkey FOREIGN KEY ( prozessquelle_sturz ) REFERENCES afu_naturgefahren_work.natgef_prozessquelle_sturz DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE afu_naturgefahren_work.natgef_schutzdefizit_wkp_0_bis_30_jahre ADD CONSTRAINT natgf_schtzd_0_bs_30_jhre_defizitwert_wkp_0_bis_30_check CHECK( defizitwert_wkp_0_bis_30 BETWEEN 0 AND 99);
ALTER TABLE afu_naturgefahren_work.natgef_schutzdefizit_wasser ADD CONSTRAINT natgef_schutzdefizt_wsser_defizitwert_wasser_check CHECK( defizitwert_wasser BETWEEN 0 AND 99);
ALTER TABLE afu_naturgefahren_work.natgef_schutzdefizit_sturz ADD CONSTRAINT natgef_schutzdefizt_sturz_defizitwert_sturz_check CHECK( defizitwert_sturz BETWEEN 0 AND 99);
ALTER TABLE afu_naturgefahren_work.natgef_schutzdefizit_hangbewegung ADD CONSTRAINT natgf_schtzdfzt_hngbwgung_defizitwert_hangbewegung_check CHECK( defizitwert_hangbewegung BETWEEN 0 AND 99);
ALTER TABLE afu_naturgefahren_work.natgef_schutzdefizit_synoptisch ADD CONSTRAINT natgef_schtzdfzt_synptsch_defizitwert_synoptisch_check CHECK( defizitwert_synoptisch BETWEEN 0 AND 99);
ALTER TABLE afu_naturgefahren_work.T_ILI2DB_BASKET ADD CONSTRAINT T_ILI2DB_BASKET_dataset_fkey FOREIGN KEY ( dataset ) REFERENCES afu_naturgefahren_work.T_ILI2DB_DATASET DEFERRABLE INITIALLY DEFERRED;
CREATE UNIQUE INDEX T_ILI2DB_DATASET_datasetName_key ON afu_naturgefahren_work.T_ILI2DB_DATASET (datasetName)
;
CREATE UNIQUE INDEX T_ILI2DB_MODEL_modelName_iliversion_key ON afu_naturgefahren_work.T_ILI2DB_MODEL (modelName,iliversion)
;
CREATE UNIQUE INDEX T_ILI2DB_ATTRNAME_ColOwner_SqlName_key ON afu_naturgefahren_work.T_ILI2DB_ATTRNAME (ColOwner,SqlName)
;
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Erstellungsart','erstellungsart');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Gefahrenstufe','gefahrenstufe');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Differenzialbewegung','differenzialbewegung');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Beschriftung_Sturz','beschriftung_sturz');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Beschriftung_Rutsch_kont','beschriftung_rutsch_kont');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.UeberflutungskarteProzessquelle_Wasser','natgef_ueberflutungskarteprozessquelle_wasser');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_synoptisch','natgef_schutzdefizit_synoptisch');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Hangmure','natgef_gk_hangmure');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Intensitaet','intensitaet');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_kontinuierlich_Sackung','natgef_ik_rutschung_kontinuierlich_sackung');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Beschriftung_Absenkung','beschriftung_absenkung');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Sturz','natgef_schutzdefizit_sturz');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Prozessart_Sturz','prozessart_sturz');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Hangbewegung','natgef_schutzdefizit_hangbewegung');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Punktsignatur','natgef_punktsignatur');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Beschriftung_Hangmure','beschriftung_hangmure');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Absenkung_Einsturz','natgef_gk_absenkung_einsturz');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Prozessart_Rutsch_kont','prozessart_rutsch_kont');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Rutschung_kontinuierlich_Sackung','natgef_gk_rutschung_kontinuierlich_sackung');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Prozessquelle_Wasser','natgef_prozessquelle_wasser');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_SturzProzessquelle_Sturz','natgef_rg_sturzprozessquelle_sturz');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Prozessquelle_Sturz','natgef_prozessquelle_sturz');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Sturz','natgef_ik_sturz');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Wasser','natgef_gk_wasser');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_WKP_0_bis_30_Jahre','natgef_schutzdefizit_wkp_0_bis_30_jahre');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_Sturz','natgef_rg_sturz');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Rutschung_spontan','natgef_gk_rutschung_spontan');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_spontan','natgef_ik_rutschung_spontan');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Tiefe_Gleitflaeche','tiefe_gleitflaeche');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Beschleunigung','beschleunigung');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Sturz','natgef_gk_sturz');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Rutschgeschwindigkeit','rutschgeschwindigkeit');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Beschriftung_Rutsch_spont','beschriftung_rutsch_spont');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Punktsignatur','punktsignatur');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Hangmure','natgef_ik_hangmure');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Prozessart_Wasser','prozessart_wasser');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_synoptisch','natgef_gk_synoptisch');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Wasser','natgef_ik_wasser');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Beschriftung_synopt_GK','beschriftung_synopt_gk');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_WasserProzessquelle_Wasser','natgef_ik_wasserprozessquelle_wasser');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_WasserProzessquelle_Wasser','natgef_rg_wasserprozessquelle_wasser');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_SturzProzessquelle_Sturz','natgef_ik_sturzprozessquelle_sturz');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Absenkung_Einsturz','natgef_ik_absenkung_einsturz');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_Wasser','natgef_rg_wasser');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Wasser','natgef_schutzdefizit_wasser');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Objektkategorien_und_Schutzziele','natgef_objektkategorien_und_schutzziele');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Ueberflutungskarte','natgef_ueberflutungskarte');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Ueberflutungshoehe_Wasser','ueberflutungshoehe_wasser');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Wiederkehrperiode','wiederkehrperiode');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Intensitaet_Korrektur','intensitaet_korrektur');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Perimeter_Gefahrenkarte','natgef_perimeter_gefahrenkarte');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_CLASSNAME (IliName,SqlName) VALUES ('Naturgefahrenkarte_SO_V11.Beschriftung_Wasser','beschriftung_wasser');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_kontinuierlich_Sackung.Bemerkungen','bemerkungen','natgef_ik_rutschung_kontinuierlich_sackung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Hangmure.Beschriftung_Hangmure','beschriftung_hangmure','natgef_gk_hangmure',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Punktsignatur.Art','art','natgef_punktsignatur',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Hangbewegung.Bemerkungen','bemerkungen','natgef_schutzdefizit_hangbewegung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Sturz.Wiederkehrperiode_Sturz','wiederkehrperiode_sturz','natgef_ik_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Sturz.Gefahrenstufe_Sturz','gefahrenstufe_sturz','natgef_gk_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Rutschung_kontinuierlich_Sackung.Gefahrenstufe_Rutsch_kont','gefahrenstufe_rutsch_kont','natgef_gk_rutschung_kontinuierlich_sackung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_Sturz.Prozessart_Sturz','prozessart_sturz','natgef_rg_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Objektkategorien_und_Schutzziele.Schutzziel_30_100','schutzziel_30_100','natgef_objektkategorien_und_schutzziele',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_kontinuierlich_Sackung.Differenzialbewegung','differenzialbewegung','natgef_ik_rutschung_kontinuierlich_sackung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Sturz.Defizitwert_Sturz','defizitwert_sturz','natgef_schutzdefizit_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Wasser.Bemerkungen','bemerkungen','natgef_ik_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_kontinuierlich_Sackung.Tiefe_Gleitflaeche','tiefe_gleitflaeche','natgef_ik_rutschung_kontinuierlich_sackung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Rutschung_spontan.Beschriftung_Rutsch_spont','beschriftung_rutsch_spont','natgef_gk_rutschung_spontan',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Rutschung_kontinuierlich_Sackung.Bemerkungen','bemerkungen','natgef_gk_rutschung_kontinuierlich_sackung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Absenkung_Einsturz.Gefahrenstufe_Absenkung','gefahrenstufe_absenkung','natgef_gk_absenkung_einsturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Hangbewegung.Geometrie','geometrie','natgef_schutzdefizit_hangbewegung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Wasser.Gefahrenstufe_Wasser','gefahrenstufe_wasser','natgef_gk_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_synoptisch.Bemerkungen','bemerkungen','natgef_schutzdefizit_synoptisch',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_Wasser.Bemerkungen','bemerkungen','natgef_rg_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_SturzProzessquelle_Sturz.Prozessquelle_Sturz','prozessquelle_sturz','natgef_rg_sturz','natgef_prozessquelle_sturz');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Prozessquelle_Wasser.Bemerkungen','bemerkungen','natgef_prozessquelle_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_Sturz.Geometrie','geometrie','natgef_rg_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Absenkung_Einsturz.Beschriftung_Absenkung','beschriftung_absenkung','natgef_gk_absenkung_einsturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Objektkategorien_und_Schutzziele.Objektkategorie','objektkategorie','natgef_objektkategorien_und_schutzziele',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Punktsignatur.Wiederkehrperiode_Wasser','wiederkehrperiode_wasser','natgef_punktsignatur',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Ueberflutungskarte.Geometrie','geometrie','natgef_ueberflutungskarte',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Absenkung_Einsturz.Bemerkungen','bemerkungen','natgef_ik_absenkung_einsturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_kontinuierlich_Sackung.Intensitaet_korrektur','intensitaet_korrektur','natgef_ik_rutschung_kontinuierlich_sackung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Hangbewegung.Defizitwert_Hangbewegung','defizitwert_hangbewegung','natgef_schutzdefizit_hangbewegung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_WKP_0_bis_30_Jahre.Geometrie','geometrie','natgef_schutzdefizit_wkp_0_bis_30_jahre',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_WasserProzessquelle_Wasser.Prozessquelle_Wasser','prozessquelle_wasser','natgef_rg_wasser','natgef_prozessquelle_wasser');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_synoptisch.Beschriftung_synopt_GK','beschriftung_synopt_gk','natgef_gk_synoptisch',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_spontan.Bemerkungen','bemerkungen','natgef_ik_rutschung_spontan',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Objektkategorien_und_Schutzziele.Schutzziel_0_30','schutzziel_0_30','natgef_objektkategorien_und_schutzziele',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Sturz.Prozessart_Sturz','prozessart_sturz','natgef_gk_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_kontinuierlich_Sackung.Intensitaet_definitv','intensitaet_definitv','natgef_ik_rutschung_kontinuierlich_sackung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Absenkung_Einsturz.Wiederkehrperiode_Absenkung','wiederkehrperiode_absenkung','natgef_ik_absenkung_einsturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Punktsignatur.Rotation','rotation','natgef_punktsignatur',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_kontinuierlich_Sackung.Prozessart_Rutsch','prozessart_rutsch','natgef_ik_rutschung_kontinuierlich_sackung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Sturz.Bemerkungen','bemerkungen','natgef_schutzdefizit_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_WKP_0_bis_30_Jahre.Defizitwert_WKP_0_bis_30','defizitwert_wkp_0_bis_30','natgef_schutzdefizit_wkp_0_bis_30_jahre',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Wasser.Geometrie','geometrie','natgef_ik_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Wasser.Prozessart_Wasser','prozessart_wasser','natgef_gk_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Prozessquelle_Wasser.Geometrie','geometrie','natgef_prozessquelle_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Absenkung_Einsturz.Intensitaet_Absenkung','intensitaet_absenkung','natgef_ik_absenkung_einsturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Ueberflutungskarte.Bemerkungen','bemerkungen','natgef_ueberflutungskarte',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Hangmure.Wiederkehrperiode_Hangmure','wiederkehrperiode_hangmure','natgef_ik_hangmure',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Ueberflutungskarte.Wiederkehrperiode_Wasser','wiederkehrperiode_wasser','natgef_ueberflutungskarte',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_spontan.Geometrie','geometrie','natgef_ik_rutschung_spontan',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Sturz.Bemerkungen','bemerkungen','natgef_gk_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Sturz.Intensitaet_Sturz','intensitaet_sturz','natgef_ik_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Wasser.Bemerkungen','bemerkungen','natgef_schutzdefizit_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_spontan.Intensitaet_Rutsch_spont','intensitaet_rutsch_spont','natgef_ik_rutschung_spontan',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Sturz.Geometrie','geometrie','natgef_ik_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Sturz.Bemerkungen','bemerkungen','natgef_ik_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Sturz.Beschriftung_Sturz','beschriftung_sturz','natgef_gk_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.UeberflutungskarteProzessquelle_Wasser.Prozessquelle_Wasser','prozessquelle_wasser','natgef_ueberflutungskarte','natgef_prozessquelle_wasser');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_SturzProzessquelle_Sturz.Prozessquelle_Sturz','prozessquelle_sturz','natgef_ik_sturz','natgef_prozessquelle_sturz');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_WKP_0_bis_30_Jahre.Bemerkungen','bemerkungen','natgef_schutzdefizit_wkp_0_bis_30_jahre',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_Wasser.Prozessart_Wasser','prozessart_wasser','natgef_rg_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Punktsignatur.Geometrie','geometrie','natgef_punktsignatur',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Objektkategorien_und_Schutzziele.Bemerkungen','bemerkungen','natgef_objektkategorien_und_schutzziele',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Perimeter_Gefahrenkarte.GK_nach_Massnahmen','gk_nach_massnahmen','natgef_perimeter_gefahrenkarte',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Prozessquelle_Sturz.Bemerkungen','bemerkungen','natgef_prozessquelle_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Wasser.Prozessart_Wasser','prozessart_wasser','natgef_ik_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Perimeter_Gefahrenkarte.Perimeter_Name','perimeter_name','natgef_perimeter_gefahrenkarte',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Wasser.Geometrie','geometrie','natgef_gk_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_kontinuierlich_Sackung.Geometrie','geometrie','natgef_ik_rutschung_kontinuierlich_sackung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_spontan.Wiederkehrperiode_Rutsch_spont','wiederkehrperiode_rutsch_spont','natgef_ik_rutschung_spontan',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_Sturz.Bemerkungen','bemerkungen','natgef_rg_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Rutschung_spontan.Geometrie','geometrie','natgef_gk_rutschung_spontan',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Prozessquelle_Sturz.Geometrie','geometrie','natgef_prozessquelle_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_kontinuierlich_Sackung.Rutschgeschwindigkeit','rutschgeschwindigkeit','natgef_ik_rutschung_kontinuierlich_sackung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_synoptisch.Geometrie','geometrie','natgef_schutzdefizit_synoptisch',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Hangmure.Bemerkungen','bemerkungen','natgef_ik_hangmure',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Rutschung_spontan.Bemerkungen','bemerkungen','natgef_gk_rutschung_spontan',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_kontinuierlich_Sackung.Beschleunigung','beschleunigung','natgef_ik_rutschung_kontinuierlich_sackung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Perimeter_Gefahrenkarte.Erstellungsart','erstellungsart','natgef_perimeter_gefahrenkarte',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Rutschung_kontinuierlich_Sackung.Beschriftung_Rutsch_kont','beschriftung_rutsch_kont','natgef_gk_rutschung_kontinuierlich_sackung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Wasser.Geometrie','geometrie','natgef_schutzdefizit_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Sturz.Geometrie','geometrie','natgef_schutzdefizit_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Objektkategorien_und_Schutzziele.Geometrie','geometrie','natgef_objektkategorien_und_schutzziele',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_synoptisch.Defizitwert_synoptisch','defizitwert_synoptisch','natgef_schutzdefizit_synoptisch',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Absenkung_Einsturz.Bemerkungen','bemerkungen','natgef_gk_absenkung_einsturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_synoptisch.Bemerkungen','bemerkungen','natgef_gk_synoptisch',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Rutschung_spontan.Gefahrenstufe_Rutsch_spont','gefahrenstufe_rutsch_spont','natgef_gk_rutschung_spontan',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Perimeter_Gefahrenkarte.Geometrie','geometrie','natgef_perimeter_gefahrenkarte',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Ueberflutungskarte.Ueberflutungshoehe_Wasser','ueberflutungshoehe_wasser','natgef_ueberflutungskarte',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Hangmure.Gefahrenstufe_Hangmure','gefahrenstufe_hangmure','natgef_gk_hangmure',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_synoptisch.Geometrie','geometrie','natgef_gk_synoptisch',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Hangmure.Bemerkungen','bemerkungen','natgef_gk_hangmure',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Wasser.Beschriftung_Wasser','beschriftung_wasser','natgef_gk_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_synoptisch.Gefahrenstufe','gefahrenstufe','natgef_gk_synoptisch',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Wasser.Defizitwert_Wasser','defizitwert_wasser','natgef_schutzdefizit_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_WasserProzessquelle_Wasser.Prozessquelle_Wasser','prozessquelle_wasser','natgef_ik_wasser','natgef_prozessquelle_wasser');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_Wasser.Geometrie','geometrie','natgef_rg_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Rutschung_kontinuierlich_Sackung.Geometrie','geometrie','natgef_gk_rutschung_kontinuierlich_sackung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Sturz.Geometrie','geometrie','natgef_gk_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Objektkategorien_und_Schutzziele.Datenquelle','datenquelle','natgef_objektkategorien_und_schutzziele',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Perimeter_Gefahrenkarte.Bemerkungen','bemerkungen','natgef_perimeter_gefahrenkarte',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Sturz.Prozessart_Sturz','prozessart_sturz','natgef_ik_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Hangmure.Geometrie','geometrie','natgef_gk_hangmure',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Prozessquelle_Sturz.Prozessquelle_Sturz','prozessquelle_sturz','natgef_prozessquelle_sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Rutschung_kontinuierlich_Sackung.Prozessart_Rutsch_kont','prozessart_rutsch_kont','natgef_gk_rutschung_kontinuierlich_sackung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Absenkung_Einsturz.Geometrie','geometrie','natgef_ik_absenkung_einsturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Wasser.Bemerkungen','bemerkungen','natgef_gk_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Objektkategorien_und_Schutzziele.Schutzziel_100_300','schutzziel_100_300','natgef_objektkategorien_und_schutzziele',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Prozessquelle_Wasser.Prozessquelle_Wasser','prozessquelle_wasser','natgef_prozessquelle_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Hangmure.Geometrie','geometrie','natgef_ik_hangmure',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Perimeter_Gefahrenkarte.Erstellungsdatum','erstellungsdatum','natgef_perimeter_gefahrenkarte',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Wasser.Wiederkehrperiode_Wasser','wiederkehrperiode_wasser','natgef_ik_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Wasser.Intensitaet_Wasser','intensitaet_wasser','natgef_ik_wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Hangmure.Intensitaet_Hangmure','intensitaet_hangmure','natgef_ik_hangmure',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_ATTRNAME (IliName,SqlName,ColOwner,Target) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Absenkung_Einsturz.Geometrie','geometrie','natgef_gk_absenkung_einsturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Sturz','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Wasser','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_WKP_0_bis_30_Jahre','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_Sturz','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Rutschung_spontan','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_spontan','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.UeberflutungskarteProzessquelle_Wasser','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_synoptisch','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Sturz','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Hangmure','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_kontinuierlich_Sackung','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Sturz','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Hangmure','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Hangbewegung','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_synoptisch','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Wasser','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Punktsignatur','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_WasserProzessquelle_Wasser','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_WasserProzessquelle_Wasser','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_SturzProzessquelle_Sturz','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Absenkung_Einsturz','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Absenkung_Einsturz','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_Wasser','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Wasser','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Objektkategorien_und_Schutzziele','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Ueberflutungskarte','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Rutschung_kontinuierlich_Sackung','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Prozessquelle_Wasser','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_SturzProzessquelle_Sturz','ch.ehi.ili2db.inheritance','embedded');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Prozessquelle_Sturz','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TRAFO (iliname,tag,setting) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Perimeter_Gefahrenkarte','ch.ehi.ili2db.inheritance','newClass');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Ueberflutungskarte',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_SturzProzessquelle_Sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_WKP_0_bis_30_Jahre',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_WasserProzessquelle_Wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_WasserProzessquelle_Wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Absenkung_Einsturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_SturzProzessquelle_Sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.UeberflutungskarteProzessquelle_Wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Absenkung_Einsturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Hangmure',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Hangmure',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_kontinuierlich_Sackung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Prozessquelle_Sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Objektkategorien_und_Schutzziele',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_synoptisch',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Hangbewegung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Rutschung_spontan',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_Wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Rutschung_spontan',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Prozessquelle_Wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_synoptisch',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Punktsignatur',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Rutschung_kontinuierlich_Sackung',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.RG_Sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.IK_Sturz',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Schutzdefizit_Wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.GK_Wasser',NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_INHERITANCE (thisClass,baseClass) VALUES ('Naturgefahrenkarte_SO_V11.NatGef.Perimeter_Gefahrenkarte',NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.U_1',0,'Beschriftung Wasser.U 1',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.U_2',1,'Beschriftung Wasser.U 2',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.U_3',2,'Beschriftung Wasser.U 3',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.U_4',3,'Beschriftung Wasser.U 4',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.U_5',4,'Beschriftung Wasser.U 5',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.U_6',5,'Beschriftung Wasser.U 6',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.U_7',6,'Beschriftung Wasser.U 7',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.U_8',7,'Beschriftung Wasser.U 8',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.M_4',8,'Beschriftung Wasser.M 4',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.M_5',9,'Beschriftung Wasser.M 5',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.M_6',10,'Beschriftung Wasser.M 6',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.M_7',11,'Beschriftung Wasser.M 7',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.M_8',12,'Beschriftung Wasser.M 8',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.M_9',13,'Beschriftung Wasser.M 9',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.U_9',14,'Beschriftung Wasser.U 9',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.E_7',15,'Beschriftung Wasser.E 7',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.E_8',16,'Beschriftung Wasser.E 8',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.E_9',17,'Beschriftung Wasser.E 9',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.U_X',18,'Beschriftung Wasser.U X',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.M_X',19,'Beschriftung Wasser.M X',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.E_X',20,'Beschriftung Wasser.E X',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Wasser.not',21,'Beschriftung Wasser.not',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Sturz.S_1',22,'Beschriftung Sturz.S 1',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Sturz.S_2',23,'Beschriftung Sturz.S 2',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Sturz.S_3',24,'Beschriftung Sturz.S 3',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Sturz.S_4',25,'Beschriftung Sturz.S 4',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Sturz.S_5',26,'Beschriftung Sturz.S 5',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Sturz.S_6',27,'Beschriftung Sturz.S 6',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Sturz.S_7',28,'Beschriftung Sturz.S 7',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Sturz.S_8',29,'Beschriftung Sturz.S 8',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Sturz.S_9',30,'Beschriftung Sturz.S 9',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Sturz.S_X',31,'Beschriftung Sturz.S X',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Sturz.not',32,'Beschriftung Sturz.not',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Rutsch_kont.R_2',33,'Beschriftung Rutsch kont.R 2',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Rutsch_kont.R_5',34,'Beschriftung Rutsch kont.R 5',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Rutsch_kont.R_8',35,'Beschriftung Rutsch kont.R 8',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Rutsch_kont.R_X',36,'Beschriftung Rutsch kont.R X',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Rutsch_kont.not',37,'Beschriftung Rutsch kont.not',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Rutsch_spont.R_4',38,'Beschriftung Rutsch spont.R 4',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Rutsch_spont.R_5',39,'Beschriftung Rutsch spont.R 5',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Rutsch_spont.R_6',40,'Beschriftung Rutsch spont.R 6',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Rutsch_spont.R_X',41,'Beschriftung Rutsch spont.R X',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Rutsch_spont.not',42,'Beschriftung Rutsch spont.not',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Hangmure.H_1',43,'Beschriftung Hangmure.H 1',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Hangmure.H_2',44,'Beschriftung Hangmure.H 2',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Hangmure.H_3',45,'Beschriftung Hangmure.H 3',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Hangmure.H_4',46,'Beschriftung Hangmure.H 4',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Hangmure.H_5',47,'Beschriftung Hangmure.H 5',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Hangmure.H_6',48,'Beschriftung Hangmure.H 6',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Hangmure.H_7',49,'Beschriftung Hangmure.H 7',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Hangmure.H_8',50,'Beschriftung Hangmure.H 8',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Hangmure.H_9',51,'Beschriftung Hangmure.H 9',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Hangmure.H_X',52,'Beschriftung Hangmure.H X',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Hangmure.not',53,'Beschriftung Hangmure.not',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Absenkung.A_4',54,'Beschriftung Absenkung.A 4',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Absenkung.A_5',55,'Beschriftung Absenkung.A 5',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Absenkung.A_6',56,'Beschriftung Absenkung.A 6',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Absenkung.A_X',57,'Beschriftung Absenkung.A X',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Beschriftung_Absenkung.not',58,'Beschriftung Absenkung.not',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_synopt_gk (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'not',59,'not',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.ueberflutungshoehe_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'von_0_bis_25cm',0,'von 0 bis 25cm',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.ueberflutungshoehe_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'von_25_bis_50cm',1,'von 25 bis 50cm',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.ueberflutungshoehe_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'von_50_bis_75cm',2,'von 50 bis 75cm',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.ueberflutungshoehe_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'von_75_bis_100cm',3,'von 75 bis 100cm',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.ueberflutungshoehe_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'von_100_bis_200cm',4,'von 100 bis 200cm',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.ueberflutungshoehe_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'groesser_200cm',5,'groesser 200cm',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.ueberflutungshoehe_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine_Ueberflutung',6,'keine Ueberflutung',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_hangmure (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'H_1',0,'H 1',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_hangmure (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'H_2',1,'H 2',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_hangmure (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'H_3',2,'H 3',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_hangmure (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'H_4',3,'H 4',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_hangmure (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'H_5',4,'H 5',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_hangmure (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'H_6',5,'H 6',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_hangmure (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'H_7',6,'H 7',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_hangmure (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'H_8',7,'H 8',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_hangmure (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'H_9',8,'H 9',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_hangmure (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'H_X',9,'H X',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_hangmure (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'not',10,'not',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.erstellungsart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'rekonstr_digitalisierte_GK',0,'rekonstr digitalisierte GK',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.erstellungsart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'digital_erstellte_GK',1,'digital erstellte GK',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.erstellungsart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'gem_GHK_nicht_von_NatGef_betr',2,'gem GHK nicht von NatGef betr',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.erstellungsart (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'gem_Abkl_nicht_von_NatGef_betr',3,'gem Abkl nicht von NatGef betr',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.prozessart_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Ueberflutung',0,'Ueberflutung',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.prozessart_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Uebersarung',1,'Uebersarung',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.prozessart_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Murgang',2,'Murgang',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.prozessart_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Ufererosion',3,'Ufererosion',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.prozessart_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine_Gefaehrdung',4,'keine Gefaehrdung',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.prozessart_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nicht_rekonstruierbar',5,'nicht rekonstruierbar',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.intensitaet_korrektur (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Entschaerfung_minus_1',0,'Entschaerfung minus 1',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.intensitaet_korrektur (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine',1,'keine',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.intensitaet_korrektur (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Verschaerfung_plus_1',2,'Verschaerfung plus 1',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.intensitaet_korrektur (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Verschaerfung_plus_2',3,'Verschaerfung plus 2',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.intensitaet_korrektur (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nicht_rekonstruierbar',4,'nicht rekonstruierbar',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.tiefe_gleitflaeche (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'oberflaechlich_0_bis_2m',0,'oberflaechlich 0 bis 2m',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.tiefe_gleitflaeche (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'mitteltief_2_bis_10m',1,'mitteltief 2 bis 10m',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.tiefe_gleitflaeche (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'tief_10_bis_40m',2,'tief 10 bis 40m',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.tiefe_gleitflaeche (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'unbestimmt_kleiner_40m',3,'unbestimmt kleiner 40m',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.tiefe_gleitflaeche (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'sehr_tief_groesser_40m',4,'sehr tief groesser 40m',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.tiefe_gleitflaeche (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine',5,'keine',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.tiefe_gleitflaeche (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nicht_rekonstruierbar',6,'nicht rekonstruierbar',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.prozessart_rutsch_kont (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Rutsch_kont',0,'Rutsch kont',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.prozessart_rutsch_kont (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Sackung',1,'Sackung',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.prozessart_rutsch_kont (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine_Gefaehrdung',2,'keine Gefaehrdung',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.prozessart_rutsch_kont (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nicht_rekonstruierbar',3,'nicht rekonstruierbar',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_rutsch_kont (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'R_2',0,'R 2',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_rutsch_kont (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'R_5',1,'R 5',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_rutsch_kont (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'R_8',2,'R 8',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_rutsch_kont (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'R_X',3,'R X',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_rutsch_kont (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'not',4,'not',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_rutsch_spont (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'R_4',0,'R 4',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_rutsch_spont (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'R_5',1,'R 5',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_rutsch_spont (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'R_6',2,'R 6',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_rutsch_spont (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'R_X',3,'R X',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_rutsch_spont (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'not',4,'not',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.prozessart_sturz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Stein_Blockschlag',0,'Stein Blockschlag',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.prozessart_sturz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Felssturz',1,'Felssturz',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.prozessart_sturz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Bergsturz',2,'Bergsturz',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.prozessart_sturz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine_Gefaehrdung',3,'keine Gefaehrdung',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.prozessart_sturz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nicht_rekonstruierbar',4,'nicht rekonstruierbar',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.wiederkehrperiode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'von_0_bis_30_Jahre',0,'von 0 bis 30 Jahre',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.wiederkehrperiode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'von_30_bis_100_Jahre',1,'von 30 bis 100 Jahre',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.wiederkehrperiode (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'von_100_bis_300_Jahre',2,'von 100 bis 300 Jahre',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.intensitaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'schwach',0,'schwach',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.intensitaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'mittel',1,'mittel',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.intensitaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'stark',2,'stark',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.intensitaet (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine',3,'keine',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.rutschgeschwindigkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'substabil_0_bis_2cm_Jahr',0,'substabil 0 bis 2cm Jahr',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.rutschgeschwindigkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'wenig_aktiv_2_bis_10cm_Jahr',1,'wenig aktiv 2 bis 10cm Jahr',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.rutschgeschwindigkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'aktiv_groesser_10cm_Jahr',2,'aktiv groesser 10cm Jahr',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.rutschgeschwindigkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine',3,'keine',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.rutschgeschwindigkeit (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nicht_rekonstruierbar',4,'nicht rekonstruierbar',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschleunigung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine',0,'keine',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschleunigung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'gering_kleiner_2fach_Mittelwert_v',1,'gering kleiner 2fach Mittelwert v',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschleunigung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'mittel_2fach_bis_5fach_Mittelwert_v',2,'mittel 2fach bis 5fach Mittelwert v',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschleunigung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'stark_groesser_5fach_Mittelwert_v',3,'stark groesser 5fach Mittelwert v',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschleunigung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nicht_rekonstruierbar',4,'nicht rekonstruierbar',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_sturz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'S_1',0,'S 1',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_sturz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'S_2',1,'S 2',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_sturz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'S_3',2,'S 3',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_sturz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'S_4',3,'S 4',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_sturz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'S_5',4,'S 5',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_sturz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'S_6',5,'S 6',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_sturz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'S_7',6,'S 7',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_sturz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'S_8',7,'S 8',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_sturz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'S_9',8,'S 9',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_sturz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'S_X',9,'S X',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_sturz (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'not',10,'not',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.punktsignatur (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Fliessrichtung',0,'Fliessrichtung',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.punktsignatur (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'Untergeschoss',1,'Untergeschoss',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_absenkung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'A_4',0,'A 4',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_absenkung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'A_5',1,'A 5',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_absenkung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'A_6',2,'A 6',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_absenkung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'A_X',3,'A X',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_absenkung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'not',4,'not',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'U_1',0,'U 1',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'U_2',1,'U 2',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'U_3',2,'U 3',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'U_4',3,'U 4',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'U_5',4,'U 5',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'U_6',5,'U 6',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'U_7',6,'U 7',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'U_8',7,'U 8',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'M_4',8,'M 4',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'M_5',9,'M 5',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'M_6',10,'M 6',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'M_7',11,'M 7',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'M_8',12,'M 8',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'M_9',13,'M 9',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'U_9',14,'U 9',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'E_7',15,'E 7',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'E_8',16,'E 8',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'E_9',17,'E 9',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'U_X',18,'U X',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'M_X',19,'M X',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'E_X',20,'E X',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.beschriftung_wasser (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'not',21,'not',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.gefahrenstufe (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine',0,'keine',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.gefahrenstufe (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'gering',1,'gering',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.gefahrenstufe (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'mittel',2,'mittel',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.gefahrenstufe (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'erheblich',3,'erheblich',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.differenzialbewegung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'keine',0,'keine',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.differenzialbewegung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'gering_bis_2cm_Jahr_Parzelle',1,'gering bis 2cm Jahr Parzelle',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.differenzialbewegung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'hoch_groesser_2cm_Jahr_Parzelle',2,'hoch groesser 2cm Jahr Parzelle',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.differenzialbewegung (seq,iliCode,itfCode,dispName,inactive,description) VALUES (NULL,'nicht_rekonstruierbar',3,'nicht rekonstruierbar',FALSE,NULL);
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_prozessquelle_sturz',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_prozessquelle_sturz',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_prozessquelle_sturz',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_prozessquelle_sturz',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_prozessquelle_sturz',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_prozessquelle_sturz',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_prozessquelle_sturz',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_rutschung_kontinuierlich_sackung',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_rutschung_kontinuierlich_sackung',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_rutschung_kontinuierlich_sackung',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_rutschung_kontinuierlich_sackung',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_rutschung_kontinuierlich_sackung',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_rutschung_kontinuierlich_sackung',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_rutschung_kontinuierlich_sackung',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_absenkung_einsturz',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_absenkung_einsturz',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_absenkung_einsturz',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_absenkung_einsturz',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_absenkung_einsturz',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_absenkung_einsturz',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_absenkung_einsturz',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_punktsignatur',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_punktsignatur',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_punktsignatur',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_punktsignatur',NULL,'geometrie','ch.ehi.ili2db.geomType','POINT');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_punktsignatur',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_punktsignatur',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_punktsignatur',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_rg_sturz',NULL,'prozessquelle_sturz','ch.ehi.ili2db.foreignKey','natgef_prozessquelle_sturz');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_rutschung_spontan',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_rutschung_spontan',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_rutschung_spontan',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_rutschung_spontan',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_rutschung_spontan',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_rutschung_spontan',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_rutschung_spontan',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_wasser',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_wasser',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_wasser',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_wasser',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_wasser',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_wasser',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_wasser',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_rutschung_spontan',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_rutschung_spontan',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_rutschung_spontan',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_rutschung_spontan',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_rutschung_spontan',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_rutschung_spontan',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_rutschung_spontan',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_wasser',NULL,'prozessquelle_wasser','ch.ehi.ili2db.foreignKey','natgef_prozessquelle_wasser');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_hangmure',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_hangmure',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_hangmure',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_hangmure',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_hangmure',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_hangmure',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_hangmure',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_synoptisch',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_synoptisch',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_synoptisch',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_synoptisch',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_synoptisch',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_synoptisch',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_synoptisch',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_hangbewegung',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_hangbewegung',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_hangbewegung',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_hangbewegung',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_hangbewegung',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_hangbewegung',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_hangbewegung',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_rg_wasser',NULL,'prozessquelle_wasser','ch.ehi.ili2db.foreignKey','natgef_prozessquelle_wasser');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_sturz',NULL,'prozessquelle_sturz','ch.ehi.ili2db.foreignKey','natgef_prozessquelle_sturz');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_sturz',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_sturz',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_sturz',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_sturz',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_sturz',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_sturz',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_sturz',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ueberflutungskarte',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ueberflutungskarte',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ueberflutungskarte',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ueberflutungskarte',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ueberflutungskarte',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ueberflutungskarte',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ueberflutungskarte',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_synoptisch',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_synoptisch',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_synoptisch',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_synoptisch',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_synoptisch',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_synoptisch',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_synoptisch',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_objektkategorien_und_schutzziele',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_objektkategorien_und_schutzziele',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_objektkategorien_und_schutzziele',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_objektkategorien_und_schutzziele',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_objektkategorien_und_schutzziele',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_objektkategorien_und_schutzziele',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_objektkategorien_und_schutzziele',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ueberflutungskarte',NULL,'prozessquelle_wasser','ch.ehi.ili2db.foreignKey','natgef_prozessquelle_wasser');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_perimeter_gefahrenkarte',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_perimeter_gefahrenkarte',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_perimeter_gefahrenkarte',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_perimeter_gefahrenkarte',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_perimeter_gefahrenkarte',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_perimeter_gefahrenkarte',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_perimeter_gefahrenkarte',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_rg_sturz',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_rg_sturz',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_rg_sturz',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_rg_sturz',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_rg_sturz',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_rg_sturz',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_rg_sturz',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_sturz',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_sturz',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_sturz',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_sturz',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_sturz',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_sturz',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_sturz',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_sturz',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_sturz',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_sturz',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_sturz',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_sturz',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_sturz',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_sturz',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_prozessquelle_wasser',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_prozessquelle_wasser',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_prozessquelle_wasser',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_prozessquelle_wasser',NULL,'geometrie','ch.ehi.ili2db.geomType','LINESTRING');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_prozessquelle_wasser',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_prozessquelle_wasser',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_prozessquelle_wasser',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_rg_wasser',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_rg_wasser',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_rg_wasser',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_rg_wasser',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_rg_wasser',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_rg_wasser',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_rg_wasser',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_hangmure',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_hangmure',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_hangmure',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_hangmure',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_hangmure',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_hangmure',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_hangmure',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_wkp_0_bis_30_jahre',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_wkp_0_bis_30_jahre',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_wkp_0_bis_30_jahre',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_wkp_0_bis_30_jahre',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_wkp_0_bis_30_jahre',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_wkp_0_bis_30_jahre',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_wkp_0_bis_30_jahre',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_rutschung_kontinuierlich_sackung',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_rutschung_kontinuierlich_sackung',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_rutschung_kontinuierlich_sackung',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_rutschung_kontinuierlich_sackung',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_rutschung_kontinuierlich_sackung',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_rutschung_kontinuierlich_sackung',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_rutschung_kontinuierlich_sackung',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_wasser',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_wasser',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_wasser',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_wasser',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_wasser',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_wasser',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_ik_wasser',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_wasser',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_wasser',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_wasser',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_wasser',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_wasser',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_wasser',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_schutzdefizit_wasser',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_absenkung_einsturz',NULL,'geometrie','ch.ehi.ili2db.coordDimension','2');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_absenkung_einsturz',NULL,'geometrie','ch.ehi.ili2db.c1Max','660000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_absenkung_einsturz',NULL,'geometrie','ch.ehi.ili2db.c2Max','270000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_absenkung_einsturz',NULL,'geometrie','ch.ehi.ili2db.geomType','POLYGON');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_absenkung_einsturz',NULL,'geometrie','ch.ehi.ili2db.c1Min','580000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_absenkung_einsturz',NULL,'geometrie','ch.ehi.ili2db.c2Min','205000.000');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_COLUMN_PROP (tablename,subtype,columnname,tag,setting) VALUES ('natgef_gk_absenkung_einsturz',NULL,'geometrie','ch.ehi.ili2db.srid','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('beschriftung_synopt_gk','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_perimeter_gefahrenkarte','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_objektkategorien_und_schutzziele','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('prozessart_sturz','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_ueberflutungskarte','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('tiefe_gleitflaeche','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('gefahrenstufe','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_schutzdefizit_wkp_0_bis_30_jahre','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('prozessart_wasser','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('differenzialbewegung','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_schutzdefizit_wasser','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('intensitaet','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_ik_rutschung_kontinuierlich_sackung','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_prozessquelle_sturz','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('ueberflutungshoehe_wasser','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_prozessquelle_wasser','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_schutzdefizit_synoptisch','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('beschriftung_absenkung','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_ik_sturz','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_gk_sturz','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('beschriftung_rutsch_kont','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('beschleunigung','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_punktsignatur','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('intensitaet_korrektur','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_gk_hangmure','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_ik_wasser','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_gk_rutschung_kontinuierlich_sackung','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_schutzdefizit_hangbewegung','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_gk_wasser','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('erstellungsart','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('beschriftung_wasser','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_gk_rutschung_spontan','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_gk_absenkung_einsturz','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_ik_rutschung_spontan','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('rutschgeschwindigkeit','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('punktsignatur','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_ik_hangmure','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_rg_sturz','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_schutzdefizit_sturz','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('beschriftung_rutsch_spont','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('beschriftung_sturz','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_rg_wasser','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_ik_absenkung_einsturz','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('beschriftung_hangmure','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('wiederkehrperiode','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('natgef_gk_synoptisch','ch.ehi.ili2db.tableKind','CLASS');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_TABLE_PROP (tablename,tag,setting) VALUES ('prozessart_rutsch_kont','ch.ehi.ili2db.tableKind','ENUM');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_MODEL (filename,iliversion,modelName,content,importDate) VALUES ('ngkso11.ili','1.0','Naturgefahrenkarte_SO_V11','
TRANSFER INTERLIS1;

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!! Datenmodell Naturgefahrenkarte Kanton Solothurn
!! beschrieben in INTERLIS Version 1 (SN 612030)
!!
!! Version:   11
!! Datum:     14. Dez. 2007
!! Dateiname: ngkso11.ili
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

MODEL Naturgefahrenkarte_SO_V11
DOMAIN
  LKoord = COORD2	580000.000	205000.000
			660000.000	270000.000;
  HKoord = COORD3	580000.000	205000.000	0.000
			660000.000	270000.000	1600.000; 
  Hoehe = DIM1 200.000 1600.000;

  Erstellungsart = (rekonstr_digitalisierte_GK,
                  digital_erstellte_GK,gem_GHK_nicht_von_NatGef_betr,
                  gem_Abkl_nicht_von_NatGef_betr);

  Prozessart_Wasser = (Ueberflutung,Uebersarung,Murgang,Ufererosion,keine_Gefaehrdung,
            nicht_rekonstruierbar); !! nur bei Rekonstruktion bestehender GK zugelassen
  Prozessart_Sturz = (Stein_Blockschlag,Felssturz,Bergsturz,keine_Gefaehrdung,
                       nicht_rekonstruierbar); !! nur bei Rekonstruktion bestehender GK zugelassen
  Prozessart_Rutsch_kont = (Rutsch_kont,Sackung, keine_Gefaehrdung, 
           nicht_rekonstruierbar); !! nur bei Rekonstruktion bestehender GK zugelassen
                  
                  
  Intensitaet = (schwach,mittel,stark,keine);
                  
  Wiederkehrperiode = (von_0_bis_30_Jahre,von_30_bis_100_Jahre,von_100_bis_300_Jahre);
                  
  Ueberflutungshoehe_Wasser = (von_0_bis_25cm,von_25_bis_50cm,von_50_bis_75cm,
                           von_75_bis_100cm,von_100_bis_200cm,groesser_200cm,keine_Ueberflutung); 
                  
  Gefahrenstufe  = (keine,gering,mittel,erheblich);
                  
  Rutschgeschwindigkeit = (substabil_0_bis_2cm_Jahr,wenig_aktiv_2_bis_10cm_Jahr,
                           aktiv_groesser_10cm_Jahr,keine,
                        nicht_rekonstruierbar); !! nur bei Rekonstruktion bestehender GK zugelassen

  Tiefe_Gleitflaeche = (oberflaechlich_0_bis_2m,mitteltief_2_bis_10m,
                 tief_10_bis_40m,unbestimmt_kleiner_40m,sehr_tief_groesser_40m,keine,
                        nicht_rekonstruierbar); !! nur bei Rekonstruktion bestehender GK zugelassen
                        
  Differenzialbewegung =  (keine,gering_bis_2cm_Jahr_Parzelle,hoch_groesser_2cm_Jahr_Parzelle,
                        nicht_rekonstruierbar); !! nur bei Rekonstruktion bestehender GK zugelassen
                        
  Beschleunigung =    (keine,gering_kleiner_2fach_Mittelwert_v,
                       mittel_2fach_bis_5fach_Mittelwert_v, stark_groesser_5fach_Mittelwert_v,
                        nicht_rekonstruierbar); !! nur bei Rekonstruktion bestehender GK zugelassen
                        
  Intensitaet_Korrektur = (Entschaerfung_minus_1,keine,Verschaerfung_plus_1,Verschaerfung_plus_2,
                        nicht_rekonstruierbar); !! nur bei Rekonstruktion bestehender GK zugelassen

  Punktsignatur = (Fliessrichtung,Untergeschoss);
  
  Beschriftung_Wasser = (U_1,U_2,U_3,U_4,U_5,U_6,U_7,U_8,
                         M_4,M_5,M_6,M_7,M_8,M_9,U_9,E_7,
                         E_8,E_9,U_X,M_X,E_X,not);  !! U_X, M_X, E_X nur bei Rekonstruktion bestehender GK zugelassen
  !! not nur bei Gefahrenstufe keine zugelassen

  Beschriftung_Sturz = (S_1,S_2,S_3,S_4,S_5,S_6,S_7,S_8,S_9,S_X,not); !!S_X nur bei Rekonstruktion bestehender GK zugelassen
!! not nur bei Gefahrenstufe keine zugelassen

  Beschriftung_Rutsch_kont = (R_2,R_5,R_8,R_X,not); !!R_X nur bei Rekonstruktion bestehender GK zugelassen
!! not nur bei Gefahrenstufe keine zugelassen


	Beschriftung_Rutsch_spont = (R_4,R_5,R_6,R_X,not); !!R_X nur bei Rekonstruktion bestehender GK zugelassen
!! not nur bei Gefahrenstufe keine zugelassen

	Beschriftung_Hangmure = (H_1,H_2,H_3,H_4,H_5,H_6,H_7,H_8,H_9,H_X,not); !!H_X nur bei Rekonstruktion bestehender GK zugelassen
!! not nur bei Gefahrenstufe keine zugelassen

	Beschriftung_Absenkung = (A_4,A_5,A_6,A_X,not); !!A_X nur bei Rekonstruktion bestehender GK zugelassen
!! not nur bei Gefahrenstufe keine zugelassen

	Beschriftung_synopt_GK = 
	  (Beschriftung_Wasser (U_1,U_2,U_3,U_4,U_5,U_6,U_7,U_8,
                         M_4,M_5,M_6,M_7,M_8,M_9,U_9,E_7,
                         E_8,E_9,U_X,M_X,E_X,not),
 	   Beschriftung_Sturz (S_1,S_2,S_3,S_4,S_5,S_6,S_7,S_8,S_9,S_X,not),
	   Beschriftung_Rutsch_kont (R_2,R_5,R_8,R_X,not),
           Beschriftung_Rutsch_spont (R_4,R_5,R_6,R_X,not),
	   Beschriftung_Hangmure (H_1,H_2,H_3,H_4,H_5,H_6,H_7,H_8,H_9,H_X,not), 
	   Beschriftung_Absenkung (A_4,A_5,A_6,A_X,not), 
	   not); !! not nur bei Gefahrenstufe "keine" zugelassen


									  
!!*******************************************************************


 
TOPIC NatGef =
  TABLE Perimeter_Gefahrenkarte =
    Geometrie: 			AREA WITH (STRAIGHTS, ARCS) VERTEX LKoord  !! Pro GK nur EIN Perimeterfeature, 
      				WITHOUT OVERLAPS > 0.05;   !! ggf. mit mehreren Teilgeometrien (Multipart Feature)
    Perimeter_Name: 		TEXT*254;		!!Ortsbezeichnung, Flurname
    Erstellungsart:		Erstellungsart;
    GK_nach_Massnahmen:		TEXT*254;		!!vorhanden, nicht_vorhanden, nicht_notwendig
    Erstellungsdatum:		DATE;             !!Format ist YYYYMMDD
    Bemerkungen: 			TEXT*254;		!!Standardtext: keine
    NO IDENT
  END Perimeter_Gefahrenkarte;
  
  TABLE Objektkategorien_und_Schutzziele =
    Geometrie:			AREA WITH (STRAIGHTS, ARCS) VERTEX LKoord
      				WITHOUT OVERLAPS > 0.05;
    Datenquelle: 			TEXT*254;			!!Datensatzbezeichnung, z.B. kommunaler Nutzungsplan
    Objektkategorie: 		[1.0..3.3];			!!Nr. gem. BUWAL         
    Schutzziel_0_30:		[0..99];			!!Schutzziel f�r Wiederkehrperiode 0 bis 30 J.
    Schutzziel_30_100:		[0..99];			!!analog
    Schutzziel_100_300:		[0..99];			!!analog
    Bemerkungen: 			TEXT*254;		      !!Standardtext: keine
    NO IDENT
  END Objektkategorien_und_Schutzziele;

  TABLE Prozessquelle_Wasser =
    Geometrie: 			POLYLINE WITH (STRAIGHTS, ARCS) VERTEX LKoord;
    Prozessquelle_Wasser:	TEXT*254;			!!Name Prozessquelle (eindeutig)
    Bemerkungen: 			TEXT*254;			!!Standardtext: keine
    IDENT Prozessquelle_Wasser;
  END Prozessquelle_Wasser;
  
  TABLE Prozessquelle_Sturz =
    Geometrie: 			AREA WITH (STRAIGHTS, ARCS) VERTEX LKoord
                              WITHOUT OVERLAPS > 0.05;
    Prozessquelle_Sturz:	TEXT*254;			!!Name Prozessquelle (eindeutig)
    Bemerkungen: 			TEXT*254;			!!Standardtext: keine
    IDENT Prozessquelle_Sturz;
  END Prozessquelle_Sturz;

  TABLE IK_Wasser =
    Geometrie: 			SURFACE WITH (STRAIGHTS, ARCS) VERTEX LKoord;
    Prozessart_Wasser:		Prozessart_Wasser;
    Prozessquelle_Wasser:	OPTIONAL -> Prozessquelle_Wasser;
    Wiederkehrperiode_Wasser: Wiederkehrperiode;
    Intensitaet_Wasser:		Intensitaet;
    Bemerkungen:			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END IK_Wasser;

  TABLE RG_Wasser =
    Geometrie:			SURFACE WITH (STRAIGHTS, ARCS) VERTEX LKoord;
    Prozessart_Wasser:		Prozessart_Wasser;
    Prozessquelle_Wasser:	OPTIONAL -> Prozessquelle_Wasser;
    Bemerkungen:			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END RG_Wasser;

  TABLE GK_Wasser =
    Geometrie: 			AREA WITH (STRAIGHTS, ARCS) VERTEX LKoord
                              WITHOUT OVERLAPS > 0.05;
    Gefahrenstufe_Wasser:	Gefahrenstufe;
	  Prozessart_Wasser:	Prozessart_Wasser;
	  Beschriftung_Wasser: Beschriftung_Wasser;
    Bemerkungen:			TEXT*254;			!!Standardtext: keine 
    NO IDENT
  END GK_Wasser;

  TABLE Ueberflutungskarte =
    Geometrie: 			SURFACE WITH (STRAIGHTS, ARCS) VERTEX LKoord;
    Prozessquelle_Wasser:	OPTIONAL -> Prozessquelle_Wasser;
    Wiederkehrperiode_Wasser:	Wiederkehrperiode;
    Ueberflutungshoehe_Wasser:Ueberflutungshoehe_Wasser;
    Bemerkungen:			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END Ueberflutungskarte;
	
	TABLE Punktsignatur = 
    Geometrie: 			LKoord;
    Art:				Punktsignatur;
    Rotation:  			[0..359];			!!Azimut in Grad, dh. 0 Grad f�r Nord, 90 Grad f�r Ost usw.
Wiederkehrperiode_Wasser: Wiederkehrperiode; 
    NO IDENT
  END Punktsignatur;
  
  TABLE IK_Sturz =
    Geometrie:			SURFACE WITH (STRAIGHTS, ARCS) VERTEX LKoord;
    Prozessart_Sturz:		Prozessart_Sturz;
    Prozessquelle_Sturz:	OPTIONAL ->Prozessquelle_Sturz;
    Wiederkehrperiode_Sturz:	Wiederkehrperiode;
    Intensitaet_Sturz:		Intensitaet;
    Bemerkungen:			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END IK_Sturz;
  
  TABLE RG_Sturz = 
    Geometrie:			SURFACE WITH (STRAIGHTS, ARCS) VERTEX LKoord;
    Prozessart_Sturz:		Prozessart_Sturz;
    Prozessquelle_Sturz:	OPTIONAL ->Prozessquelle_Sturz;
    Bemerkungen:			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END RG_Sturz;

  TABLE GK_Sturz = 
    Geometrie: 			AREA WITH (STRAIGHTS, ARCS) VERTEX LKoord
                              WITHOUT OVERLAPS > 0.05;
    Gefahrenstufe_Sturz:	Gefahrenstufe;
	  Prozessart_Sturz:	Prozessart_Sturz;
	  Beschriftung_Sturz:	Beschriftung_Sturz;
    Bemerkungen:			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END GK_Sturz;
  
  TABLE IK_Rutschung_kontinuierlich_Sackung =
    Geometrie:			SURFACE WITH (STRAIGHTS, ARCS) VERTEX LKoord;
    Prozessart_Rutsch:		Prozessart_Rutsch_kont;
    Rutschgeschwindigkeit:	Rutschgeschwindigkeit;
    Tiefe_Gleitflaeche:		Tiefe_Gleitflaeche;
    Differenzialbewegung:	Differenzialbewegung;
    Beschleunigung:		Beschleunigung;
    Intensitaet_korrektur:	Intensitaet_Korrektur;
    Intensitaet_definitv:	Intensitaet;
    Bemerkungen:			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END IK_Rutschung_kontinuierlich_Sackung;
  
  TABLE GK_Rutschung_kontinuierlich_Sackung = 
    Geometrie: 			AREA WITH (STRAIGHTS, ARCS) VERTEX LKoord
                              WITHOUT OVERLAPS > 0.05;
    Gefahrenstufe_Rutsch_kont:	Gefahrenstufe;
	  Prozessart_Rutsch_kont:	Prozessart_Rutsch_kont;
	  Beschriftung_Rutsch_kont:	Beschriftung_Rutsch_kont;
    Bemerkungen:			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END GK_Rutschung_kontinuierlich_Sackung;
 
  TABLE IK_Rutschung_spontan =
    Geometrie:			SURFACE WITH (STRAIGHTS, ARCS) VERTEX LKoord;
    Wiederkehrperiode_Rutsch_spont: Wiederkehrperiode;
    Intensitaet_Rutsch_spont: Intensitaet;			!! immer "mittel" resp. "keine"
    Bemerkungen:			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END IK_Rutschung_spontan;

  TABLE GK_Rutschung_spontan = 
    Geometrie: 			AREA WITH (STRAIGHTS, ARCS) VERTEX LKoord
                              WITHOUT OVERLAPS > 0.05;
    Gefahrenstufe_Rutsch_spont: Gefahrenstufe;                   !! immer "erheblich" resp. "keine"
	  Beschriftung_Rutsch_spont:	Beschriftung_Rutsch_spont;
    Bemerkungen:			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END GK_Rutschung_spontan;

  TABLE IK_Hangmure =
    Geometrie:			SURFACE WITH (STRAIGHTS, ARCS) VERTEX LKoord;
    Wiederkehrperiode_Hangmure: Wiederkehrperiode;
    Intensitaet_Hangmure:	Intensitaet;
    Bemerkungen:			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END IK_Hangmure;

  TABLE GK_Hangmure = 
    Geometrie: 			AREA WITH (STRAIGHTS, ARCS) VERTEX LKoord
                              WITHOUT OVERLAPS > 0.05;
    Gefahrenstufe_Hangmure:	Gefahrenstufe;
	  Beschriftung_Hangmure: Beschriftung_Hangmure;
    Bemerkungen:			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END GK_Hangmure;

  TABLE IK_Absenkung_Einsturz =
    Geometrie:			SURFACE WITH (STRAIGHTS, ARCS) VERTEX LKoord
                              WITHOUT OVERLAPS > 0.05;
    Wiederkehrperiode_Absenkung: Wiederkehrperiode;
    Intensitaet_Absenkung:	Intensitaet;			!! immer "mittel" resp. "keine"
    Bemerkungen:			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END IK_Absenkung_Einsturz;

  TABLE GK_Absenkung_Einsturz = 
    Geometrie: 			AREA WITH (STRAIGHTS, ARCS) VERTEX LKoord
                              WITHOUT OVERLAPS > 0.05;
    Gefahrenstufe_Absenkung:	Gefahrenstufe;
	  Beschriftung_Absenkung:	Beschriftung_Absenkung;
    Bemerkungen:			TEXT*254;			!!Standardtext: keine 
    NO IDENT
  END GK_Absenkung_Einsturz;

  TABLE GK_synoptisch = 
    Geometrie: 			AREA WITH (STRAIGHTS, ARCS) VERTEX LKoord
                              WITHOUT OVERLAPS > 0.05;
    Gefahrenstufe:		Gefahrenstufe;
	  Beschriftung_synopt_GK:	Beschriftung_synopt_GK;
    Bemerkungen: 			TEXT*254;			!!Standardtext: keine 
    NO IDENT
  END GK_synoptisch;

  TABLE Schutzdefizit_WKP_0_bis_30_Jahre =
    Geometrie: 			AREA WITH (STRAIGHTS, ARCS) VERTEX LKoord
                              WITHOUT OVERLAPS > 0.05;
    Defizitwert_WKP_0_bis_30:	[0..99];			!!Summe der Defizitwerte aus allen IK 0-30
    Bemerkungen: 			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END Schutzdefizit_WKP_0_bis_30_Jahre;
  
  TABLE Schutzdefizit_Wasser =
    Geometrie: 			AREA WITH (STRAIGHTS, ARCS) VERTEX LKoord
                              WITHOUT OVERLAPS > 0.05;
    Defizitwert_Wasser:		[0..99];			!!Summe der Defizitwerte aus allen IK Wassergefahr
    Bemerkungen: 			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END Schutzdefizit_Wasser;

  TABLE Schutzdefizit_Sturz =
    Geometrie: 			AREA WITH (STRAIGHTS, ARCS) VERTEX LKoord
                              WITHOUT OVERLAPS > 0.05;
    Defizitwert_Sturz:		[0..99];			!!Summe der Defizitwerte aus allen IK Sturz
    Bemerkungen: 			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END Schutzdefizit_Sturz;

  TABLE Schutzdefizit_Hangbewegung =
    Geometrie: 			AREA WITH (STRAIGHTS, ARCS) VERTEX LKoord
                              WITHOUT OVERLAPS > 0.05;
    Defizitwert_Hangbewegung:	[0..99];			!!Summe der Defizitwerte aus alle IK Rutschprozesse
    Bemerkungen: 			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END Schutzdefizit_Hangbewegung;

  TABLE Schutzdefizit_synoptisch =
    Geometrie: 			AREA WITH (STRAIGHTS, ARCS) VERTEX LKoord
                              WITHOUT OVERLAPS > 0.05;
    Defizitwert_synoptisch:	[0..99];			!!Defizitwert_Wasser + 
                                                      !!Defizitwert_Sturz + Defizitwert_Hangbewegung
    Bemerkungen: 			TEXT*254;			!!Standardtext: keine
    NO IDENT
  END Schutzdefizit_synoptisch;


END NatGef. !!Topic


END Naturgefahrenkarte_SO_V11. !!Model

!!FORMAT FREE;
FORMAT FIX WITH LINESIZE = 320, TIDSIZE = 16;

CODE
  BLANK = DEFAULT, UNDEFINED = DEFAULT, CONTINUE = DEFAULT;
  TID = ANY;
END.



','2020-09-09 15:28:53.521');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createMetaInfo','True');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.beautifyEnumDispName','underscore');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.arrayTrafo','coalesce');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.nameOptimization','topic');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.localisedTrafo','expand');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.numericCheckConstraints','create');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.sender','ili2pg-4.3.1-23b1f79e8ad644414773bb9bd1a97c8c265c5082');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createForeignKey','yes');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.sqlgen.createGeomIndex','True');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.defaultSrsAuthority','EPSG');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.defaultSrsCode','21781');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.uuidDefaultValue','uuid_generate_v4()');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.StrokeArcs','enable');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiLineTrafo','coalesce');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.interlis.ili2c.ilidirs','%ILI_FROM_DB;%XTF_DIR;http://models.interlis.ch/;%JAR_DIR');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createForeignKeyIndex','yes');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.jsonTrafo','coalesce');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.createEnumDefs','multiTable');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.uniqueConstraints','create');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.maxSqlNameLength','60');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.inheritanceTrafo','smart1');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.catalogueRefTrafo','coalesce');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiPointTrafo','coalesce');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multiSurfaceTrafo','coalesce');
INSERT INTO afu_naturgefahren_work.T_ILI2DB_SETTINGS (tag,setting) VALUES ('ch.ehi.ili2db.multilingualTrafo','expand');
