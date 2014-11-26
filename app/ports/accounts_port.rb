class AccountsPort < Port
  
  attr_accessor :accounts
  
  
  def get_accounts(params)
    conn = Faraday.new(url: Setting.services(:accounts, :index))
    conn.params = params
    status_and_parse(resp: conn.get, parse_in_to: "@accounts")
  end
  
  def account_transaction(link: nil, amount: nil, id_token: nil)
    conn = Faraday.new(url: link)
    conn.params = transaction_msg(amount: amount, id_token: id_token)
    status_and_parse(resp: conn.put, parse_in_to: "@transaction")
  end
  
  def get_account(link: nil, options: nil)
    conn = Faraday.new(url: link)
    conn.params = options
    status_and_parse(resp: conn.get, parse_in_to: "@account")
  end
  
  def transaction_msg(amount: nil, id_token: nil)
    {
      kind: "transaction",
      id_token: id_token,
      amount: amount,
      desc: "ATM"
    }
  end
  
    
end