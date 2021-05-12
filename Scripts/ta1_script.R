#CARGAR DATOS
hotel.booking = read.csv("./Datos/hotel_bookings.csv", header = TRUE, sep = ",")

#INSPECCIONAR DATOS

#Ver todos los datos del dataframe
View(hotel.booking)

#Ver las 5 primeros filas del dataframe
head(hotel.booking, 5)

#Ver las 5 ultimas filas del dataframe
tail(hotel.booking, 5)

#Ver nombres de las columnas del dataframe
names(hotel.booking)

str(hotel.booking)
#Al revisar los datos nos damos cuenta que existe múltiples valores que funcionarían mejor como factor.

summary(hotel.booking)
#Con Summary corroboramos que hay datos numércios que estan cumpliendo la función de factor y deben ser corregidos, además
#se nota la presencia de algunos NAs en Children, sin embargo la limpieza necesaria se hará luego.

hotel.booking$is_canceled = as.factor(hotel.booking$is_canceled)
hotel.booking$arrival_date_year = as.factor(hotel.booking$arrival_date_year)
hotel.booking$arrival_date_week_number = as.factor(hotel.booking$arrival_date_week_number)
hotel.booking$arrival_date_day_of_month = as.factor(hotel.booking$arrival_date_day_of_month)
hotel.booking$is_repeated_guest = as.factor(hotel.booking$is_repeated_guest)
#Se convirtieron estas variables a Factor y se realizó una verificación posterior

str(hotel.booking)

summary(hotel.booking)
#Finalmente comprobamos que los datos están correctos y podemos proceder con el análisis y selección
#de visualizaciones.


#VISUALIZACIONES
counts = table(hotel.booking$customer_type, hotel.booking$reserved_room_type)
barplot(counts, col=c("green","yellow","blue","red"), legend = c("Contrato", "Grupo", "Transitorio", "Transitorio asociado"), main = "Tipo de cliente por habitaci�n reservada")
table(hotel.booking$customer_type, hotel.booking$reserved_room_type)
#Esta gráfica nos ayuda a verificar dos cosas, primero cuales son los tipos de habitaci�n m�s reservados en relaci�n con el tipo de cliente, vemos que en todos los tipos de habitación
#predomina el transitorio, además nos permite conocer los tipos de habitación más solicitadas en las reservas, notando una clara victoria por parte del tipo A seguido del tipo D.

counts2 = table(hotel.booking$reservation_status, hotel.booking$deposit_type)
barplot(counts2, col=c("blue","red","green"), legend = c("Cancelado", "Check-out", "No se muestra"), main = "Estado de la reservaci�n por el tipo de deposito")
table(hotel.booking$reservation_status, hotel.booking$deposit_type)
#Esta gráfica nos ayuda a revisar por el estado de la reservación que tipo de deposito predomina y notamos algo increible, en el caso de los que no hacen ningún depósito la gran mayoría
#termina completando su estadía y retirandose, sin embargo en los realizan un depósito completo que no tiene lugar a devoluciones se ve que predomina por mucho la cantidad de clientes
#que cancelaron.

table(hotel.booking$is_canceled, hotel.booking$hotel)
counts3 =  table(hotel.booking$is_canceled, hotel.booking$hotel)
barplot(counts3, col=c("blue","red"), legend = c("Continuaron", "Cancelado"), main = "Cancelacion de reserva por tipo de hotel")
#Esta grafica nos permite ver en tipo de hotel hay mas cancelaciones.

table(hotel.booking$arrival_date_month)
barplot(table(hotel.booking$arrival_date_month), main = " Reservas totales por mes", names= c("Apr", "Aug", "Dec", "Feb", "Jan", "Jul", "Jun", "Mar", "May", "Nov", "Oct", "Sep"))
#Esta grafica nos ayuda a ver el volumen de usuarios por cada mes y de esta manera estar mas preparados para cuando los meses de mayor afluencia lleguen.

counts4=table(hotel.booking$is_repeated_guest,hotel.booking$market_segment)
barplot(counts4,col = c("blue","green"),legend=c("No Constante","Constante"),main="Clientes frecuentes por origen de la reserva")
table(hotel.booking$is_repeated_guest,hotel.booking$market_segment)
# Esta grafica permite observar que tipo de segmento de mercado es mas constante o repetitivo(siendo en este caso con un mayor porcentaje el corporativo).





