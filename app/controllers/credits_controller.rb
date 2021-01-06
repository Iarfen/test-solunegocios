class CreditsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def add_credits
        if (User.exists?(:email => params[:user]))
            @user = User.find_by(:email => params[:user])
        else
            @user = User.create!(:email => params[:user])
        end
        if (Store.exists?(:name => params[:store]))
            @store = Store.find_by(:name => params[:store])
        else
            @store = Store.create!(:name => params[:store])
        end
        if (Credit.exists?(:user_id => @user.id, :store_id => @store.id))
            @credit = Credit.find_by(:user_id => @user.id, :store_id => @store.id)
            @credit.credits += params[:credits].to_i
            @credit.save
        else
            @credit = Credit.create(:user_id => @user.id, :store_id => @store.id, :credits => params[:credits])
        end
        render json: @credit, status: 200
    end

    def substract_credits
        if (User.exists?(:email => params[:user]))
            @user = User.find_by(:email => params[:user])
        else
            return
        end
        if (Store.exists?(:name => params[:store]))
            @store = Store.find_by(:name => params[:store])
        else
            return
        end
        if (Credit.exists?(:user_id => @user.id, :store_id => @store.id))
            @credit = Credit.find_by(:user_id => @user.id, :store_id => @store.id)
            @credit.credits -= params[:credits].to_i
            @credit.save
        else
            return
        end
        render json: @credit, status: 200
    end

    def view_credits_user
        if (User.exists?(:email => params[:user]))
            @user = User.find_by(:email => params[:user])
        else
            return
        end
        if (Credit.exists?(:user_id => @user.id))
            @credit = Credit.where(:user_id => @user.id)
        else
            return
        end
        render json: @credit, status: 200
    end

    def view_credits_store
        if (Store.exists?(:name => params[:store]))
            @store = Store.find_by(:name => params[:store])
        else
            return
        end
        if (Credit.exists?(:store_id => @store.id))
            @credit = Credit.where(:store_id => @store.id)
        else
            return
        end
        render json: @credit, status: 200
    end
end
