class Node {
  dynamic value;
  bool discovered = false;
  List<Node> links = [];
  int distance = 0;
  int weight;
  
  @override
  String toString() =>
  '''
  
  value:      $value
  discovered: $discovered
  distance:   $distance
  links:      ${links.length}
  ''';
}

BFS(List<Node> graph, Node start) {
  final queue = [start];
  
  while(queue.isNotEmpty) {
    Node node = queue.removeLast();
    
    for(Node link in node.links) {
      if(link.distance == 0) {
        queue.add(link);
        link.distance = node.distance + 1;
      }
    }
  }
}

DFS(List<Node> graph, [cb]) {
  for(final node in graph) {
    if(!node.discovered) {
      explore(graph, node, cb ?? null);
    }
  }
}

explore(List<Node> graph, Node node, callback) {
  node.discovered = true;
 	callback != null && callback(node);
  
  for(Node link in node.links) {
    if(!link.discovered) {
      explore(graph, link, callback);
    }
  }
}

void main() {
	final first = new Node()
    ..value = 'first'
    ..links = [
    	new Node()
    		..value = 'first-first'
    		..weight = 5,
    	new Node()
    		..value = 'second-first'
    		..weight = 2
  ];
  
  final second = new Node()
    ..value = 'second'
    ..links = [
    	new Node()
    		..value = 'second-first'
    		..weight = 10
  ];
  
  
  final graph = [first, second];
  BFS(graph, first);
  DFS(graph, (node) => print('$node'));

  


}