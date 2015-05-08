module.exports = (robot) ->
  say = (user, post) ->
    post_type_map =
      stories:        "怖い話",
      comics:         "ホラー漫画",
      wallpapers:     "怖い画像",
      urban_legends:  "都市伝説",
      haunted_places: "心霊スポット",
      umas:           "UMA投稿",
      aliens:         "宇宙人・UFO事件",
      demons:         "悪魔",
      specters:       "妖怪",
      ooparts:        "オーパーツ",
      movies:         "ホラー映画",
      reviews:        "レビュー"

    kowabana_host = 'http://kowabana.jp'
    post_name = post_type_map["#{post.type}"]

    "#{kowabana_host}/users/#{user.id}|#{user.name} さんが
    #{kowabana_host}/#{post.relative_url}|#{post.title}(#{post_name})
    を投稿しました。"

  robot.router.post "/hubot/new_posting_notification", (req, res) ->
    room = '#kowabana'
    user = req.body.user
    post = req.body.post
    message = say(user, post)
    robot.messageRoom room, message
    res.send 200
