/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     28/06/2021 12:52:58                          */
/*==============================================================*/

/*==============================================================*/
/* Table: ATIENDE                                               */
/*==============================================================*/
create table ATIENDE (
   USUARIO_ID           NUMERIC(5)           not null,
   BOMBERO_ID           NUMERIC(5)           not null,
   constraint PK_ATIENDE primary key (USUARIO_ID, BOMBERO_ID)
);

/*==============================================================*/
/* Table: BOMBERO                                               */
/*==============================================================*/
create table BOMBERO (
   BOMBERO_ID           NUMERIC(5)           not null,
   VEHICULO_ID          NUMERIC(5)           null,
   ESTACION_ID          NUMERIC(5)           null,
   PUESTO_ID            NUMERIC(5)           null,
   BOMBERO_NOMBRE       VARCHAR(30)          null,
   BOMBERO_APELLIDO     VARCHAR(30)          null,
   BOMBERO_CI           NUMERIC              null,
   BOMBERO_GENERO       VARCHAR(15)          null,
   BOMBERO_TELEFONO     NUMERIC(10)          null,
   BOMBERO_FECHANACIMIENTO DATE              null,
   BOMBERO_CORREO       VARCHAR(20)          null,
   constraint PK_BOMBERO primary key (BOMBERO_ID)
);

/*==============================================================*/
/* Table: EMERGENCIA                                            */
/*==============================================================*/
create table EMERGENCIA (
   EMERGENCIA_ID        NUMERIC(8)           not null,
   USUARIO_ID           NUMERIC(5)           null,
   EMERGENCIA_TIPO      VARCHAR(30)          null,
   EMERGENCIA_DESCRIPCION VARCHAR(30)          null,
   constraint PK_EMERGENCIA primary key (EMERGENCIA_ID)
);

/*==============================================================*/
/* Table: ESTACION                                              */
/*==============================================================*/
create table ESTACION (
   ESTACION_ID          NUMERIC(5)           not null,
   ESTACION_DIRECCION   VARCHAR(30)          null,
   ESTACION_TELEFONO    NUMERIC(10)          null,
   constraint PK_ESTACION primary key (ESTACION_ID)
);

/*==============================================================*/
/* Table: PUESTO_INSTITUCIONAL                                  */
/*==============================================================*/
create table PUESTO_INSTITUCIONAL (
   PUESTO_ID            NUMERIC(5)           not null,
   PUESTO_UNIDAD_PERTENECE VARCHAR(30)          null,
   PUESTO_CARGO         VARCHAR(30)          null,
   constraint PK_PUESTO_INSTITUCIONAL primary key (PUESTO_ID)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   USUARIO_ID           NUMERIC(5)           not null,
   USUARIO_CEDULA       NUMERIC(10)          null,
   USUARIO_NOMBRE       VARCHAR(30)          null,
   USUARIO_APELLIDO     VARCHAR(30)          null,
   USUARIO_GENERO       VARCHAR(15)          null,
   USUARIO_DIRECCION    VARCHAR(30)          null,
   USUARIO_TELEFONO     NUMERIC(10)          null,
   USUARIO_FECHA        DATE                 null,
   USUARIO_HORA         TIME                 null,
   constraint PK_USUARIO primary key (USUARIO_ID)
);

/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
create table VEHICULO (
   VEHICULO_ID          NUMERIC(5)           not null,
   ESTACION_ID          NUMERIC(5)           null,
   VEHICULO_PLACA       VARCHAR(8)           null,
   VEHICULO_MARCA       VARCHAR(20)          null,
   VEHICULO_TIPO        VARCHAR(15)          null,
   constraint PK_VEHICULO primary key (VEHICULO_ID)
);

alter table ATIENDE
   add constraint FK_ATIENDE_ATIENDE_USUARIO foreign key (USUARIO_ID)
      references USUARIO (USUARIO_ID)
      on delete restrict on update restrict;

alter table ATIENDE
   add constraint FK_ATIENDE_ATIENDE2_BOMBERO foreign key (BOMBERO_ID)
      references BOMBERO (BOMBERO_ID)
      on delete restrict on update restrict;

alter table BOMBERO
   add constraint FK_BOMBERO_PERTENECE_PUESTO foreign key (PUESTO_ID)
      references PUESTO_INSTITUCIONAL (PUESTO_ID)
      on delete restrict on update restrict;

alter table BOMBERO
   add constraint FK_BOMBERO_TIENE_ESTACION foreign key (ESTACION_ID)
      references ESTACION (ESTACION_ID)
      on delete restrict on update restrict;

alter table BOMBERO
   add constraint FK_BOMBERO_TRANSPORTE_VEHICULO foreign key (VEHICULO_ID)
      references VEHICULO (VEHICULO_ID)
      on delete restrict on update restrict;

alter table EMERGENCIA
   add constraint FK_EMERGENC_TIENE_USUARIO_ foreign key (USUARIO_ID)
      references USUARIO (USUARIO_ID)
      on delete restrict on update restrict;

alter table VEHICULO
   add constraint FK_VEHICULO_DISPONE_ESTACION foreign key (ESTACION_ID)
      references ESTACION (ESTACION_ID)
      on delete restrict on update restrict;

