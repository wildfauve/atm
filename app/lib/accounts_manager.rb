class AccountsManager
  
  include Wisper::Publisher
  
  attr_accessor :account_msg, :account
  
  def self.all(user_proxy: nil)
    @accounts = []
    accounts = AccountsPort.new.get_accounts({id_token: user_proxy.access_token[:id_token]})
    accounts["accounts"].each do |acct|
      @accounts << self.new(account: acct)
    end
    @accounts
  end
  
  def self.accounts
    @accounts
  end
  
  def initialize(account: nil)
    @account_msg = account if account
  end
  
  def link_for(rel: nil)
    @account_msg["_links"][rel.to_s]["href"]
  end
  
  def get_account(user_proxy: nil, link: nil)
    @account = AccountsPort.new.get_account(link: link, options: {id_token: user_proxy.access_token[:id_token]})
    self
  end
  
  def process_account_transaction(link: nil, amount: nil, user_proxy: nil)
    txn = AccountsPort.new.account_transaction(link: link, amount: amount, id_token: user_proxy.access_token[:id_token])
    publish(:succesful_transaction_event, self)
  end
  
  
  
end