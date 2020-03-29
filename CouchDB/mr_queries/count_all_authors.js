// count number of articles by author
// map function
function (doc) {
   for (var x = 0, len = doc.author.length; x < len; x++) {
      emit(doc.author[x], 1);
   }
}

// reduce function
function(keys, values, rereduce){
        return sum(values);
}