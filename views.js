"total": {
"map": "function(doc) { 
 	if (doc.players['Player 9']['hand'][0]['value'] == 14 && doc.players['Player 9']['hand'][1]['value'] == 14){ 
 		emit('AA', doc.players['Player 9'].winner) 
 	}
 	if (doc.players['Player 8']['hand'][0]['value'] == 14 && doc.players['Player 8']['hand'][1]['value'] == 14){ 
 		emit('AA', doc.players['Player 8'].winner) 
 	}
 	if (doc.players['Player 7']['hand'][0]['value'] == 14 && doc.players['Player 7']['hand'][1]['value'] == 14){ 
 		emit('AA', doc.players['Player 7'].winner) 
 	}
 	if (doc.players['Player 6']['hand'][0]['value'] == 14 && doc.players['Player 6']['hand'][1]['value'] == 14){ 
 		emit('AA', doc.players['Player 6'].winner) 
 	}
 	if (doc.players['Player 5']['hand'][0]['value'] == 14 && doc.players['Player 5']['hand'][1]['value'] == 14){ 
 		emit('AA', doc.players['Player 5'].winner) 
 	}
 	if (doc.players['Player 4']['hand'][0]['value'] == 14 && doc.players['Player 4']['hand'][1]['value'] == 14){ 
 		emit('AA', doc.players['Player 4'].winner) 
 	}
 	if (doc.players['Player 3']['hand'][0]['value'] == 14 && doc.players['Player 3']['hand'][1]['value'] == 14){ 
 		emit('AA', doc.players['Player 3'].winner) 
 	}
 	if (doc.players['Player 2']['hand'][0]['value'] == 14 && doc.players['Player 2']['hand'][1]['value'] == 14){ 
 		emit('AA', doc.players['Player 2'].winner) 
 	}
 	if (doc.players['Player 1']['hand'][0]['value'] == 14 && doc.players['Player 1']['hand'][1]['value'] == 14){ 
 		emit('AA', doc.players['Player 1'].winner) 
 	}"
}