module.exports = (robot) ->
  say = (user_name, post_type) ->
    post_type_map =
      story: "怖い話",
      comic: "怖い漫画",
      wallpaper: "怖い画像",
      urban_legend: "都市伝説",

    post_name = post_type_map["#{post_type}"]
    "#{user_name}さんが#{post_name}を投稿しました。"

  robot.router.post "/hubot/new_posting_notification", (req, res) ->
    room = '#kowabana'
    user_name = req.body.user_name
    post_type = req.body.type
    message = say(user_name, post_type)
    robot.messageRoom room, message
    res.send 200
