require "csv"

class MassiveChargeController < ApplicationController
    def form
        render "form"
    end

    def send_form
        @new_users = CSV.parse(File.read(params[:file]))
        @new_users.each do |user|
            add_credits(user[0],user[1],user[2])
        end
        @credits = Credit.all
        render json: @credits, status: 200
    end

    def add_credits(user,store,credits)
        if (User.exists?(:email => user))
            @user = User.find_by(:email => user)
        else
            @user = User.create!(:email => user)
        end
        if (Store.exists?(:name => store))
            @store = Store.find_by(:name => store)
        else
            @store = Store.create!(:name => store)
        end
        if (Credit.exists?(:user_id => @user.id, :store_id => @store.id))
            @credit = Credit.find_by(:user_id => @user.id, :store_id => @store.id)
            @credit.credits += credits.to_i
            @credit.save
        else
            @credit = Credit.create(:user_id => @user.id, :store_id => @store.id, :credits => credits)
        end
    end
end
