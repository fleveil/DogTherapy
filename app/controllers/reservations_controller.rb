class ReservationsController < ApplicationController
  def new
    @search = Search.find(params[:search])
    @reservation = Reservation.new
    @dog = Dog.find(params[:dog_id])
  end

  def create
    @search = Search.find(params[:reservation][:search_id])
    @reservation = Reservation.new(reservation_params)

    @reservation.user = current_user
    @dog = Dog.find(params[:dog_id])
    @reservation.dog = @dog

    if @reservation.save
      redirect_to my_reservations_path
    else
      render :new, locals: { parameter: @search }
    end
  end

  def my_reservations
    @reservations = current_user.reservations
  end

  def my_dogs_reservations
    dogs = current_user.dogs
    @pending = retrieve_reservations('pending', dogs)
    @confirmed = retrieve_reservations('confirmed', dogs)
    @declined = retrieve_reservations('declined', dogs)
  end

  def confirm_reservation
    reservation = Reservation.find(params[:id])
    reservation.status = 'confirmed'
    reservation.save
    redirect_to my_dogs_reservations_path
  end

  def decline_reservation
    reservation = Reservation.find(params[:id])
    reservation.status = 'declined'
    reservation.save
    redirect_to my_dogs_reservations_path
  end

  private

  def retrieve_reservations(status, dogs)
    reservations = []
    dogs.each do |dog|
      unless dog.reservations.empty?
        reservations += dog.reservations.select { |reservation| reservation.status == status }
      end
    end
    return reservations
  end

  def reservation_params
    params.require(:reservation).permit(:date)
  end
end
