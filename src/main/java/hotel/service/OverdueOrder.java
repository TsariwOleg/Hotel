package hotel.service;

import hotel.dao.DAOOrder;

import java.time.LocalDate;

public class OverdueOrder implements Runnable{
   private LocalDate date;

    @Override
    public void run() {
        if (date==null){
            date=LocalDate.now();
        }

        while (true){
            if (!date.isEqual(LocalDate.now())){
                date=LocalDate.now();
                new DAOOrder().deleteOldOrders(date.minusDays(2));
            }

        }

    }
}
