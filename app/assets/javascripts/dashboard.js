$(document).ready(function(){

	rankingTemplate = $('#rankingTemplate')
	allPhonesTemplate = $('#allPhonesTemplate')
	actionTemplate = $('#actionTemplate')
	awardTemplate = $('#awardTemplate')

  origin_phones = [
		'15801652103',
		'15890345324',
		'13809456903',
		"18178266356",
		"15973840254",
		"15034847747",
		"18428398769",
		"13666326601",
		"15755735735",
		"18381857737",
		"15095330846",
		"18733592191",
		"18428087962",
		"15777261013",
		"13698190492",
		"15973844551",
		"18482379341",
		"17076437939",
		"13626566435",
		"13132687816",
		"15287176497",
		"18673861985",
		"13560566972",
		"13626566435",
		"13132687816",
		"15287176497",
		"18673861985",
		"13626566435",
		"13132687816",
		"15287176497",
		"18673861985"				
	]


	data = {
		ranking: '三等奖',
		phones: origin_phones.slice(0, origin_phones.length - origin_phones.length%4),
		actionName: '开始抽奖'
	}

	$(".container").html()
	$(".container").append(rankingTemplate.render(data))


	// template = $( "#attendeesTemplate" )

 //  current_ranking = 0;
 //  current_ranking_seat =0;
 //  winnings = [[], [], []]

 //  calcPhones = function(random_num) {
 //  	numbers = [];
 //  	calc = function() {
 //    	phone = origin_phones[Math.floor(Math.random() * origin_phones.length)]
 //    	return { phone: phone };
 //  	}

 //  	while (random_num > 0) {
 //  		random_num--;
 //  		numbers = numbers.concat(calc())
 //  	}
 //  	return numbers;
 //  }

 //  parse_current_rankings = function() {
 //  	var data = [];
 //    ranking = all_rankings[current_ranking];
 //    var seats = ranking[2]
 //    var i = current_ranking_seat;
 //    while(i < seats) {
 //    	i++
 //    	width = 100/ranking[2] -1;
 //    	data = data.concat({
	//     	className: i === current_ranking_seat + 1 ? 'active' : '',
	//    		seat: i,
	//    		width: width > 15 ? 15 : width ,
	//    	  phones: calcPhones(13)    		
 //    	})
 //    }

 //    return data;
 //  }


	// render = function() {
	// 	$('.right-top p').html(window.all_rankings[current_ranking][0] + '等奖' + '<br /><small>(共' + all_rankings[current_ranking][1] + '名)</small>');
	// 	var materials = parse_current_rankings()
	// 	$( ".ddddd" ).html(template.render(materials));
 //  }

 //  render_sucess = function() {
	//   winnings_list = [
	//     {
	//     	ranking: '三',
	//     	num: 5,
	//     	list: winnings[0].join(',  ')
	//     },
	//     {
	//     	ranking: '二',
	//     	num: 2,
	//     	list: winnings[1].join(',  ')
	//     },
	//     {
	//     	ranking: '一',
	//     	num: 1,
	//     	list: winnings[2].join(',  ')
	//     }
	//   ]
	// 	$(".finished ul").html($('#successTemplate').render(winnings_list));
	// 	$('.finished').css('display', 'block');
	// 	$('.shoujiang').css('display', 'none');
	// 	$('.right-top p').html('中奖结果');		
 //  }

 //   if ($('.dashboard_start').text()) {
 //    window.int = setInterval(render, 50);
 //   }

	// $(document).bind('keyup', function(event) {
	// 	if (event.keyCode == "13") {

	// 		if (window.int) {
	// 			clearInterval(window.int)
	// 			window.int = false
	// 			winnings[current_ranking] = winnings[current_ranking].concat($('.suiji.active .xxxx div:nth-child(5)').html())
	// 			console.log(winnings)
	// 			console.log(current_ranking)
	// 			console.log(current_ranking_seat)						
	// 			return;
	// 		}

	// 		if (current_ranking == 2 && current_ranking_seat == 0) {
	// 			clearInterval(window.int)		
	// 			window.int = false
 // 				return render_sucess()
	// 		}


	// 		if (current_ranking_seat < all_rankings[current_ranking][2] -1) {
	// 			current_ranking_seat++
	// 		} else {
	// 			current_ranking++
	// 			current_ranking_seat = 0
	// 		}

	// 		console.log(current_ranking)
	// 		console.log(current_ranking_seat)			

	// 	  window.int = setInterval(render, 50);

	// 	}
	// });  
})