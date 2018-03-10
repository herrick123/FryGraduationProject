function Theme() {
   var infographic = {
        color: [
        '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
        '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
        '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
    ]
   };
   var macarons = {
	    color: [
	        '#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80',
	        '#8d98b3','#e5cf0d','#97b552','#95706d','#dc69aa',
	        '#07a2a4','#9a7fd1','#588dd5','#f5994e','#c05050',
	        '#59678c','#c9ab00','#7eb00a','#6f5553','#c14089'
	    ]
   };
   var moren = {
	   color: [
		   '#ff7f50','#87cefa','#da70d6','#32cd32','#6495ed',
	       '#ff69b4','#ba55d3','#cd5c5c','#ffa500','#40e0d0',
	       '#1e90ff','#ff6347','#7b68ee','#00fa9a','#ffd700',
	       '#6699FF','#ff6666','#3cb371','#b8860b','#30e0e0'
	   ]
   }
  
   this.getTheme = function(name) {
      if (name == "infographic")
          return infographic;
     else if (name == "macarons")
         return macarons;
     else if (name == "moren")
         return moren;
   }
}