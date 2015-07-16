createGameOverScene = (game, nextSceneFunc) ->
  gameOverLabel = new Label('GAME OVER')
  gameOverLabel.color = '#ffffff'
  gameOverLabel.x = 250
  gameOverLabel.y = 100

  scoreLabel = new Label("#{window.score}")
  scoreLabel.color = '#ffffff'
  scoreLabel.x = 250
  scoreLabel.y = 125

  gameOverScene = new Scene()
  gameOverScene.backgroundColor = "#000000";

  gameOverScene.addChild gameOverLabel
  gameOverScene.addChild scoreLabel

  isRelease = false
  gameOverScene.addEventListener 'enterframe', ->
    scoreLabel.text = "#{window.score}"
    if game.input.a
      if isRelease
        isRelease = false
        nextSceneFunc()
    else
      isRelease = true

  gameOverScene

module.exports = createGameOverScene
