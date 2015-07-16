enchant()
game = new Core(640, 320)
game.preload 'vendor/enchant.js-builds-0.8.2-b/images/icon0.png'
game.fps = 30
game.start()

createGameScene = require './game_scene.coffee'
createGameOverScene = require './game_over_scene.coffee'
createTitleScene = require './title_scene.coffee'

game.onload = ->
  titleScene = createTitleScene game, =>
    game.replaceScene gameScene
  gameScene = createGameScene game, =>
    game.replaceScene gameOverScene
  gameOverScene = createGameOverScene game, =>
    game.replaceScene gameScene

  game.keybind ' '.charCodeAt(0), 'a'
  game.pushScene titleScene

