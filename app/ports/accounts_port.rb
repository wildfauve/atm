class AccountsPort < Port
  
  attr_accessor :accounts
  
  
  def get_accounts(params)
    conn = Faraday.new(url: Setting.services(:accounts, :index))
    conn.params = params
    resp = conn.get
    raise if resp.status >= 300
    @accounts = JSON.parse(resp.body)
    @msg = @accounts
  end
  
  def account_transaction(link: nil, amount: nil, id_token: nil)
    conn = Faraday.new(url: link)
    conn.params = transaction_msg(amount: amount, id_token: id_token)
    resp = conn.put
    raise if resp.status >= 300
    @transaction = JSON.parse(resp.body)
    @msg = @transaction
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