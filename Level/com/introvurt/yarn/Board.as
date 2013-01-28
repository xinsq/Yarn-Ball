﻿package com.introvurt.yarn {		import flash.display.Sprite;		public class Board extends Sprite {				private var _gridData:Array;		private var _c:int;		private var _r:int;		private var _squareSize:int = 16;		public function Board( c:int, r:int ) {			// constructor code			_r = r;			_c = c;			trace("*",_c,_r);			initGrid();		}				private function initGrid():void // w:int, h:int 		{			// save all the squares in 2D array			_gridData = new Array();						// just adding an array for each row to start			for( var i:int = 0; i < _r; i++ )			{				var arr:Array = new Array();				_gridData[i] = arr;								for( var j:int = 0; j < _c; j++ )				{					// trace("j:",j);					var tile:Tile = new Tile();					tile.gridX = j;					tile.gridY = i;										tile.x = j * _squareSize;					tile.y = i * _squareSize;					_gridData[i][j] = tile;										addChild(tile);				}			}		}				/*private function initGrid( w:int, h:int ):void		{			// save all the squares in 2D array			_gridData = new Array();						// just adding an array for each row to start			for( var i:int = 0; i < w; i++ )			{				var arr:Array = new Array();				_gridData[i] = arr;								for( var j:int = 0; j < h; j++ )				{					var tile:Tile = new Tile();					tile.gridX = i;					tile.gridY = j;										tile.x = i * _squareSize;					tile.y = j * _squareSize;					_gridData[i][j] = tile;										addChild(tile);				}			}		}*/				public function findAllNeighbors():void		{			for( var i:int = 0; i < _r; i++ )			{				for( var j:int = 0; j < _c; j++ )				{					// set the open value of each neighbor					var tile:Tile;					var n:Tile;					var e:Tile;					var s:Tile;					var w:Tile;					var neighbors:Array = [false,false,false,false];										tile = _gridData[i][j];										// check to see if the neighbor exists					/*					if( j-1 > 0 ) n = _gridData[i][j-1];					if( i+1 < _c-1 ) e = _gridData[i+1][j];					if( j+1 < _r-1 ) s = _gridData[i][j+1];					if( i-1 > 0 ) w = _gridData[i-1][j];					*/					if( i-1 > 0 ) n = _gridData[i-1][j];					if( j+1 < _c-1 ) e = _gridData[i][j+1];					if( i+1 < _r-1 ) s = _gridData[i+1][j];					if( j-1 > 0 ) w = _gridData[i][j-1];										if(n) neighbors[0] = n.isOpen;					if(e) neighbors[1] = e.isOpen;					if(s) neighbors[2] = s.isOpen;					if(w) neighbors[3] = w.isOpen;										// pass the array to the tile					tile.neighbors = neighbors;				}			}		}				public function createJson():String		{			var json:String = '{ tileset_file: "ground_all.png", tile_data: [';						for( var i:int = 0; i < _r; i++ )			{				json += '[';				for( var j:int = 0; j < _c; j++ )				{					var tile = _gridData[i][j];					json += tile.createJson();					if( j < _c-1 ) json += ',';				}				json += ']';				if( i < _r-1 ) json += ',';			}						json += ']}';						return json;		}	}}