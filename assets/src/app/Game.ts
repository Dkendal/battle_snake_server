import './Game.css';
import 'phoenix_html';
import {Game} from 'elm/Game';
import {embedApp} from '../utils';
import {GameBoard} from '../GameBoard';
import css from '../css-variables';

const colorPallet = new Map<string, string>(Object.entries(css));

document.addEventListener('DOMContentLoaded', () => {
  const gameAppConfig = {
    websocket: `ws://${window.location.host}/socket/websocket`,
  };

  embedApp('Game', Game, gameAppConfig).map(program => {
    let board: GameBoard;
    let canvas: HTMLCanvasElement;

    program.ports.render.subscribe(world => {
      if (!board) {
        const id = world.gameId;
        const node = document.getElementById(id);

        if (!node) {
          throw new Error(`could not find an element with id ${id}`);
        }

        board = new GameBoard(node, colorPallet);
      }

      requestAnimationFrame(() => {
        // canvas.width = canvas.clientWidth;
        // canvas.height = canvas.clientHeight;
        board.draw(world);
      });
    });
  });
});