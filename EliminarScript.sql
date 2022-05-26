CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar`(id_hotel INT)
BEGIN
	DECLARE  id INT;
    set id = (select id_gre from hoteles where id_htl=id_hotel);
	DELETE FROM habitaciones WHERE id_htl=id_hotel;
	DELETE FROM hoteles WHERE id_htl=id_hotel;
    DELETE FROM gerentes where id_gre=id;
END