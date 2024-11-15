*&-------------------------------------------------------------------------------------------*
*& Nome: Jo�o Paulo Candido da Silva                                                         *
*& DATA: 10/05/2022                                                                          *
*&                                                                                           *
*&                                                                                           *
*&                                                                                           *
*&-------------------------------------------------------------------------------------------*
*&-------------------------------------------------------------------------------------------*
*&                                                                                           *
*& A Customised ABAP Program, for an Airport Company, Based on CITY FROM and CITY TO         *
*& (both provided by the user in the Selection Screen), the program must retrieve which      *
*& flights in the system have these 2 cities (Departude and Arrival), The data for these     *
*& information can be found in table SPFLI.                                                  *                                             *
*&                                                                                           *
*&-------------------------------------------------------------------------------------------*

REPORT z_firstprogramflight.

*&-------------------------------------------------------------------------------------------*
*& Data Declaration
*&-------------------------------------------------------------------------------------------*
DATA: w_spfli TYPE spfli.
DATA: t_spfli TYPE TABLE OF spfli.


*&-------------------------------------------------------------------------------------------*
*& Selection Screen
*&-------------------------------------------------------------------------------------------*
PARAMETER: p_cityf TYPE spfli-cityfrom,
           p_cityto TYPE spfli-cityto.


*&-------------------------------------------------------------------------------------------*
*& Selection
*&-------------------------------------------------------------------------------------------*
SELECT *
INTO TABLE t_spfli
FROM spfli
WHERE cityfrom = p_cityf AND
      cityto = p_cityto.


*&-------------------------------------------------------------------------------------------*
*& Processing
*&-------------------------------------------------------------------------------------------*

  IF sy-subrc = 0.

  LOOP AT t_spfli into w_spfli.
    write: w_spfli-carrid, w_spfli-connid.
  ENDLOOP.

  ELSE.

    write 'nothing found'.

  ENDIF.
