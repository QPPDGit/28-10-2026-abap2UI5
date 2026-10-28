CLASS /sct/au5_cl_ajson_refinitlib DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    CLASS-METHODS create_path_refs_init
      IMPORTING
        !it_data_refs       TYPE /sct/au5_if_ajson_refinit=>tty_data_refs
      RETURNING
        VALUE(ri_refs_init) TYPE REF TO /sct/au5_if_ajson_refinit
      RAISING
        /sct/au5_cx_ajson_error.

ENDCLASS.



CLASS /sct/au5_cl_ajson_refinitlib IMPLEMENTATION.


  METHOD create_path_refs_init.
    CREATE OBJECT ri_refs_init TYPE lcl_path_refs_init
      EXPORTING
        it_data_refs = it_data_refs.
  ENDMETHOD.
ENDCLASS.
