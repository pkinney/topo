searchNodes=[{"type":"module","title":"Topo","doc":"A Geometry library for Elixir that calculates relationships between two geometries. Geometries can be of any of the following types: Point LineString Polygon MultiPoint MultiLineString MultiPolygon Each of these functions can be passed any two Geometries in either a Map with a :type and :coordinates keys or as a struct generated via the Geo library ( https://github.com/bryanjos/geo ). Coordinates are represented as atoms {x, y} and multiple coordinates as Lists. a = %{ type : &quot;Polygon&quot; , coordinates : [ [ { 2 , 2 } , { 20 , 2 } , { 11 , 11 } , { 2 , 2 } ] ] } b = % Geo.Polygon { coordinates : [ [ { 2 , 2 } , { 20 , 2 } , { 11 , 11 } , { 2 , 2 } ] ] } Topo . equals? a , b # =&gt; true Instead of a Point geometry, just a single coordinate can be used. a = %{ type : &quot;Polygon&quot; , coordinates : [ [ { 2 , 2 } , { 20 , 2 } , { 11 , 11 } , { 2 , 2 } ] ] } Topo . intersects? a , { 4 , 6 } # =&gt; true The Topo library's functions will automatically attempt to &quot;clean&quot; geometries passed to them: Linear Rings (including Polygons) will be reordered to a counter-clockwise direction. Polygon's Linear Rings will automatically be closed if the first point is not repeated as the last point. Points that are equal or collinear with surrounding points are removed from LineStrings or Polygons.","ref":"Topo.html"},{"type":"function","title":"Topo.contains?/2","doc":"Returns true if all points of geometry B lie within A . There are a few non-obvious special cases that are worth mentioning: A Polygon does not contain its own boundary. Specifically a LineString that is the exact same as a Polygon's exterior Linear ring is not contained within a that Polygon. a = % Geo.Polygon { coordinates : [ [ { 2 , 2 } , { 20 , 2 } , { 11 , 11 } , { 2 , 2 } ] ] } b = % Geo.LineString { coordinates : [ { 2 , 2 } , { 20 , 2 } , { 11 , 11 } , { 2 , 2 } ] } Topo . contains? a , b # =&gt; false Topo . intersects? a , b # =&gt; true A LineString does not contain it's own first and last point (unless those points are the same, as in a LinearRing) a = % Geo.LineString { coordinates : [ { 1 , 3 } , { 2 , - 1 } , { 0 , - 1 } ] } b = % Geo.LineString { coordinates : [ { 1 , 3 } , { 2 , - 1 } , { 0 , - 1 } , { 1 , 3 } ] } Topo . contains? a , { 1 , 3 } # =&gt; false Topo . intersects? a , { 1 , 3 } # =&gt; true Topo . contains? b , { 1 , 3 } # =&gt; true Examples iex&gt; Topo . contains? ( ...&gt; %{ type : &quot;Polygon&quot; , coordinates : [ [ { 20 , 20 } , { 20 , 180 } , { 220 , 180 } , { 220 , 20 } , { 20 , 20 } ] ] } , ...&gt; %{ type : &quot;Polygon&quot; , coordinates : [ [ { 160 , 60 } , { 20 , 20 } , { 100 , 140 } , { 160 , 60 } ] ] } ...&gt; ) true iex&gt; Topo . contains? ( ...&gt; %{ type : &quot;Polygon&quot; , coordinates : [ [ { 160 , 60 } , { 20 , 20 } , { 100 , 140 } , { 160 , 60 } ] ] } , ...&gt; %{ type : &quot;Polygon&quot; , coordinates : [ [ { 20 , 20 } , { 20 , 180 } , { 220 , 180 } , { 220 , 20 } , { 20 , 20 } ] ] } ...&gt; ) false","ref":"Topo.html#contains?/2"},{"type":"function","title":"Topo.disjoint?/2","doc":"Returns true if geometries A and B do not have any points in common. Examples iex&gt; Topo . disjoint? ( { 1 , - 3 } , %{ type : &quot;MultiPoint&quot; , coordinates : [ { 70 , 35 } , { 100 , 80 } ] } ) true iex&gt; Topo . disjoint? ( ...&gt; %{ type : &quot;Polygon&quot; , coordinates : [ ...&gt; [ { 60 , 120 } , { 60 , 40 } , { 160 , 40 } , { 160 , 120 } , { 60 , 120 } ] , ...&gt; [ { 140 , 100 } , { 80 , 100 } , { 80 , 60 } , { 140 , 60 } , { 140 , 100 } ] ] } , ...&gt; % Geo.MultiPoint { coordinates : [ { 70 , 35 } , { 100 , 80 } ] } ...&gt; ) true","ref":"Topo.html#disjoint?/2"},{"type":"function","title":"Topo.equals?/2","doc":"Geometries A and B are equivalent and cover the exact same set of points. By definition, A and B are equal if A contains B and B contains A . Equality does not necessarily mean that the geometries are of the same type. A Point A is equal to a MultiPoint that contains only the same Point A . Examples iex&gt; Topo . equals? ( ...&gt; %{ type : &quot;Point&quot; , coordinates : { 2 , - 3 } } , ...&gt; %{ type : &quot;MultiPoint&quot; , coordinates : [ { 2 , - 3 } ] } ...&gt; ) true iex&gt; Topo . equals? ( ...&gt; %{ type : &quot;Polygon&quot; , coordinates : [ [ { 160 , 60 } , { 20 , 20 } , { 100 , 140 } , { 160 , 60 } ] ] } , ...&gt; %{ type : &quot;Polygon&quot; , coordinates : [ [ { 20 , 20 } , { 20 , 180 } , { 220 , 180 } , { 220 , 20 } , { 20 , 20 } ] ] } ...&gt; ) false","ref":"Topo.html#equals?/2"},{"type":"function","title":"Topo.intersects?/2","doc":"Returns true if geometries A and B share at least one point in common. Examples iex&gt; Topo . intersects? ( ...&gt; %{ type : &quot;Polygon&quot; , coordinates : [ [ { 2 , 2 } , { 20 , 2 } , { 11 , 11 } , { 2 , 2 } ] ] } , ...&gt; %{ type : &quot;LineString&quot; , coordinates : [ { 11 , 10 } , { 4 , 2.5 } , { 16 , 2.5 } , { 11 , 10 } ] } ...&gt; ) true iex&gt; Topo . intersects? ( ...&gt; %{ type : &quot;Polygon&quot; , coordinates : [ ...&gt; [ { 60 , 120 } , { 60 , 40 } , { 160 , 40 } , { 160 , 120 } , { 60 , 120 } ] , ...&gt; [ { 140 , 100 } , { 80 , 100 } , { 80 , 60 } , { 140 , 60 } , { 140 , 100 } ] ] } , ...&gt; %{ type : &quot;MultiPoint&quot; , coordinates : [ { 70 , 35 } , { 100 , 80 } ] } ...&gt; ) false","ref":"Topo.html#intersects?/2"},{"type":"function","title":"Topo.within?/2","doc":"This is the direct converse of contains? . All points of geometry A lie within geometry B . Examples iex&gt; Topo . within? ( ...&gt; %{ type : &quot;Polygon&quot; , coordinates : [ [ { 20 , 20 } , { 20 , 180 } , { 220 , 180 } , { 220 , 20 } , { 20 , 20 } ] ] } , ...&gt; %{ type : &quot;Polygon&quot; , coordinates : [ [ { 160 , 60 } , { 20 , 20 } , { 100 , 140 } , { 160 , 60 } ] ] } ...&gt; ) false iex&gt; Topo . within? ( ...&gt; %{ type : &quot;Polygon&quot; , coordinates : [ [ { 160 , 60 } , { 20 , 20 } , { 100 , 140 } , { 160 , 60 } ] ] } , ...&gt; %{ type : &quot;Polygon&quot; , coordinates : [ [ { 20 , 20 } , { 20 , 180 } , { 220 , 180 } , { 220 , 20 } , { 20 , 20 } ] ] } ...&gt; ) true","ref":"Topo.html#within?/2"},{"type":"type","title":"Topo.geometry/0","doc":"","ref":"Topo.html#t:geometry/0"}]