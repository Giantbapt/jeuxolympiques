class AthletesController < ApplicationController
    def index
      #@athletes = Athlete.where(:text).
      @athletes = Athlete.all
      @participations = Participation.all
    end
end
