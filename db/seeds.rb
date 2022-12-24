users = [
  {
    email: "jcavallo@colgate.edu",
    password: "doggcatt",
    username: "jcavallo",
    private_key: "i58907894yhr34fh340f83f",
    public_key: "elfho3brifoui34fbi34ffer3",
    following: 3,
    reputation: 20,
    account_num: 0
  },
  {
    email: "jcavallo88@colgate.edu",
    password: "doggcatt",
    username: "jcavallo2",
    private_key: "i58907894yhr34fwdfh340f83f",
    public_key: "elfho3brifouicwdsv34fbi34ffer3",
    following: 20,
    reputation: 10,
    account_num: 1
  }
]

User.delete_all

User.create!(users)


new_account = Account.new(account_type: "instagram", account_username: "cavalloj", media_count: 30, account_id: "JDHGF")
new_account2 = Account.new(account_type: "facebook", account_username: "cavalloja", media_count: 33, account_id: "JDHFSGF")

User.all[0].accounts.append(new_account)
User.all[0].accounts.append(new_account2)


