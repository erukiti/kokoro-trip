createGameScene = (game, gameOverSceneFunc) ->
  gameScene = new Scene()
  gameScene.backgroundColor = "#000000";

  kokoro = new Sprite(16, 16)
  kokoro.image = game.assets['vendor/enchant.js-builds-0.8.2-b/images/icon0.png']
  gameScene.addChild kokoro
  kokoro.frame = 0x0a

  scoreLabel = new Label('0')
  scoreLabel.color = '#ffffff'
  gameScene.addChild scoreLabel

  stars = []
  isClear = true
  x = 0
  y = 0
  score = 0
  gameScene.addEventListener 'enterframe', ->
    if isClear
      for star in stars
        gameScene.removeChild star
      stars = []
      score = 0
      scoreLabel.text = '0'
      kokoro.x = 0
      kokoro.y = 50
      x = 0
      y = 0
      isClear = false

    if stars.length < 30
      star = new Sprite(16, 16)
      star.image = game.assets['vendor/enchant.js-builds-0.8.2-b/images/icon0.png']
      gameScene.addChild star
      star.frame = 0x1e
      star.scale 0.5, 0.5
      star.x = Math.floor(Math.random() * 50) + 500
      star.y = Math.floor(Math.random() * 250) + 30
      star.deltaX = Math.random() * 2 + 0.25
      star.deltaY = 1

      stars.push star

    isDead = false

    if game.input.a
      y -= 0.5 if y > -5
    else
      y += 0.5 if y < 5
    if game.input.left
      x -= 0.5 if x > -5
    if game.input.right
      x += 0.5 if x < 5

    kokoro.x += x 
    kokoro.y += y

    kokoro.x = 0 if kokoro.x < 0
    kokoro.x = 500 if kokoro.x > 500
    kokoro.y = 20 if kokoro.y < 20
    isDead = true if kokoro.y > 320

    dels = []
    for star in stars
      star.y += star.deltaY
      star.x -= star.deltaX

      if star.y > 315 || star.y < 5
        star.deltaY = -star.deltaY

      if star.x < 0
        gameScene.removeChild star
        dels.push star

      isDead = true if star.intersect kokoro

    stars = _.difference stars, dels

    if isDead
      isClear = true
      window.score = score
      gameOverSceneFunc()

    score += 10
    scoreLabel.text = "#{score}"

  gameScene

module.exports = createGameScene
