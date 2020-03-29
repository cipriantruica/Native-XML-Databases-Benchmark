// count number of articles by author and year
// map function v1
function(doc) {
    for (var x = 0, len = doc.author.length; x < len; x++) {
        emit([doc.author[x],doc.year], 1);
    }
}

// map function v2
function(doc) {
    for (var x = 0, len = doc.author.length; x < len; x++) {
       emit({ "author": doc.author[x], "year": doc.year }, 1)
    }
} 

// reduce function
function(keys, values, rereduce){
        return sum(values);
}