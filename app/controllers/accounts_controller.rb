class AccountsController < ApplicationController
  
  def index
    @accounts = AccountsManager.all(user_proxy: @current_user_proxy)
  end
  
  def account
    @link = params[:link]
    @account = AccountsManager.new.get_account(user_proxy: @current_user_proxy, link: @link)
  end
  
  def options
    @deposit = params[:deposit]
    @withdraw = params[:withdraw]
    @self = params[:self]
    @type = params[:type]
  end
  
  def withdraw
    @link = params[:link]
  end
  
  def deposit
    @link = params[:link]
  end
    
  #{"utf8"=>"✓", "authenticity_token"=>"fMD60zZkE0aX1nSbU6B0OH22AWd92JoSIVJW/sh0f8Q=", "amount"=>"10", "commit"=>"Submit", "link"=>"http://localhost:3023/api/v1/accounts/546569bf4d617414e60d0000/transactions/deposit"}
  def transaction
    acct_mgr = AccountsManager.new
    acct_mgr.subscribe self
    acct_mgr.process_account_transaction(link: params[:link], amount: params[:amount], user_proxy: @current_user_proxy)
  end
  
  def succesful_transaction_event(acct_mgr)
    flash.notice = "Well Done!!"
    redirect_to accounts_path
  end
  
end