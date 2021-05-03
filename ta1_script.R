#CARGAR DATOS
hotel.booking = read.csv("./Datos/hotel_bookings.csv", header = TRUE, sep = ",")

#INSPECCIONAR DATOS
View(hotel.booking)

head(hotel.booking, 5)

tail(hotel.booking, 5)

names(hotel.booking)

str(hotel.booking)

summary(hotel.booking)

hotel.booking$is_canceled = as.factor(hotel.booking$is_canceled)
hotel.booking$arrival_date_year = as.factor(hotel.booking$arrival_date_year)
hotel.booking$arrival_date_week_number = as.factor(hotel.booking$arrival_date_week_number)
hotel.booking$arrival_date_day_of_month = as.factor(hotel.booking$arrival_date_day_of_month)
hotel.booking$is_repeated_guest = as.factor(hotel.booking$is_repeated_guest)

str(hotel.booking)

summary(hotel.booking)

#LIMPIAR DATOS