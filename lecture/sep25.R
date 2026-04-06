# Data manipulation
# dplyr: a R package for Data manipulation.
## five key verbs:
### filter(): pick\extract certain rows
### arrange(): Reorder rows
### select(): pick\extract certain columns
### mutate(): Create new column with functions of existing columns
## summarize(): Collapse many values to a single values
# == , >=, <, <=, !=
# .1 + .2 == .3 FALSE
### group_by(): 
flight_sml = select(flights, year:day, ends_with('delay'), distance, air_time)
flights = mutate(flight_sml, gain = dep_delay - arr_delay,
                 speed = distance/air_time * 60)
flights
### group_by ()
 %>%