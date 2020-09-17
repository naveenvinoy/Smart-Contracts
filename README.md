# XToken


     
    
    constructor (string memory name, string memory symbol) public {
        _name = name;
        _symbol = symbol;
        _decimals = 18;
    }


    Sets the values for {name} and {symbol}, initializes {decimals} with a default value of 18.




   
    function name() public view returns (string memory) {
        return _name;
    }

     Returns the name of the token.

   
    function symbol() public view returns (string memory) {
        return _symbol;
    }

   Returns the symbol of the token, usually a shorter version of the  name.
     

   
  
    function decimals() public view returns (uint8) {
        return _decimals;
    }


    Tokens usually opt for a value of 18, imitating the relationship between
    Ether and Wei. This is the value {ERC20} uses, unless {_setupDecimals} is called.
     
    
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

  Returns the amount of tokens in existence.

    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

  Returns the amount of tokens owned by `account`.

 
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

   Moves `amount` tokens from the caller's account to `recipient`.
    
    
     Returns a boolean value indicating whether the operation succeeded. Emits a {Transfer} event.


    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    Returns the remaining number of tokens that `spender` will be allowed to spend on behalf of `owner` through {transferFrom}. This is zero by default.
     This value changes when {approve} or {transferFrom} are called.
     



    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }
    Sets `amount` as the allowance of `spender` over the caller's tokens. Returns a boolean value indicating whether the operation succeeded.


      function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

   Moves `amount` tokens from `sender` to `recipient` using the allowance mechanism. `amount` is then deducted from the caller's allowance.
         Returns a boolean value indicating whether the operation succeeded.
         Emits a {Transfer} event.



    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }

    
     Automically increases the allowance granted to `spender` by the caller


    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

   Automically decreases the allowance granted to `spender` by the caller

