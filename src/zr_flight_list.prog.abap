REPORT zr_flight_list.

TYPES: BEGIN OF ty_flight,
         carrid   TYPE scarr-carrid,
         carrname TYPE scarr-carrname,
         connid   TYPE spfli-connid,
         cityfrom TYPE spfli-cityfrom,
         cityto   TYPE spfli-cityto,
         fldate   TYPE sflight-fldate,
         price    TYPE sflight-price,
         currency TYPE sflight-currency,
         seatsmax TYPE sflight-seatsmax,
         seatsocc TYPE sflight-seatsocc,
       END OF ty_flight.

START-OF-SELECTION.
  SELECT scarr~carrid,
         scarr~carrname,
         spfli~connid,
         spfli~cityfrom,
         spfli~cityto,
         sflight~fldate,
         sflight~price,
         sflight~currency,
         sflight~seatsmax,
         sflight~seatsocc
    INTO TABLE @DATA(lt_flights) UP TO 50 ROWS
    FROM sflight
    INNER JOIN scarr ON scarr~carrid = sflight~carrid
    INNER JOIN spfli ON  spfli~carrid = sflight~carrid
                     AND spfli~connid = sflight~connid
    ORDER BY scarr~carrid, spfli~connid, sflight~fldate.

  TRY.
      cl_salv_table=>factory(
        IMPORTING
          r_salv_table = DATA(lo_salv)
        CHANGING
          t_table      = lt_flights
      ).
      lo_salv->get_display_settings( )->set_list_header( 'Flight Data' ).
      lo_salv->display( ).
    CATCH cx_salv_msg INTO DATA(lx_salv).
      MESSAGE lx_salv->get_text( ) TYPE 'E'.
  ENDTRY.