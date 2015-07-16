createTitleScene = (game, nextSceneFunc) ->
  gameOverLabel = new Label('ココロトリップ')
  gameOverLabel.color = '#ffffff'
  gameOverLabel.x = 250
  gameOverLabel.y = 100

  gameOverScene = new Scene()
  gameOverScene.backgroundColor = "#000000";

  gameOverScene.addChild gameOverLabel

  gameOverScene.addEventListener 'enterframe', ->
    if game.input.a
      nextSceneFunc()

  gameOverScene

module.exports = createTitleScene
