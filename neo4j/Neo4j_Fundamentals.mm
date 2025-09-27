<map version="freeplane 1.12.1">
<!--To view this file, download free mind mapping software Freeplane from https://www.freeplane.org -->
<node TEXT="Neo4j Fundamentals" LOCALIZED_STYLE_REF="AutomaticLayout.level.root" FOLDED="false" ID="ID_1090958577" CREATED="1409300609620" MODIFIED="1758938908509" VGAP_QUANTITY="3 pt"><hook NAME="MapStyle" background="#d6e8e8ff" zoom="1.4641001">
    <properties show_icon_for_attributes="true" edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" show_note_icons="true" fit_to_viewport="false" show_icons="BESIDE_NODES" associatedTemplateLocation="template:/light_sky_element_template.mm" show_tags="UNDER_NODES"/>
    <tags category_separator="::"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="bottom_or_right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ID="ID_4172522" ICON_SIZE="12 pt" FORMAT_AS_HYPERLINK="false" COLOR="#051552" BACKGROUND_COLOR="#5cd5e8" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="8 pt" SHAPE_VERTICAL_MARGIN="5 pt" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="1.7 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#1164b0" BORDER_DASH_LIKE_EDGE="true" BORDER_DASH="SOLID" VGAP_QUANTITY="3 pt">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="200" DASH="" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_4172522" STARTINCLINATION="115.875 pt;0 pt;" ENDINCLINATION="115.875 pt;28.5 pt;" STARTARROW="NONE" ENDARROW="DEFAULT"/>
<font NAME="SansSerif" SIZE="10" BOLD="false" STRIKETHROUGH="false" ITALIC="false"/>
<edge STYLE="bezier" COLOR="#051552" WIDTH="2" DASH="SOLID"/>
<richcontent TYPE="DETAILS" CONTENT-TYPE="plain/auto"/>
<richcontent TYPE="NOTE" CONTENT-TYPE="plain/auto"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details" COLOR="#fff024" BACKGROUND_COLOR="#000000"/>
<stylenode LOCALIZED_TEXT="defaultstyle.tags">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#f6f9a1" TEXT_ALIGN="LEFT">
<icon BUILTIN="clock2"/>
<font SIZE="10" ITALIC="true"/>
<edge COLOR="#000000"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.selection" COLOR="#ffffff" BACKGROUND_COLOR="#cc7212" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#1164b0"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="bottom_or_right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.important" ID="ID_1823054225" COLOR="#fff024" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#9d5e19">
<icon BUILTIN="yes"/>
<arrowlink COLOR="#9d5e19" TRANSPARENCY="255" DESTINATION="ID_1823054225"/>
<font SIZE="11" BOLD="true"/>
<edge COLOR="#9d5e19"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.flower" COLOR="#ffffff" BACKGROUND_COLOR="#255aba" STYLE="oval" TEXT_ALIGN="CENTER" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="22 pt" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#f9d71c" BORDER_DASH_LIKE_EDGE="false" BORDER_DASH="CLOSE_DOTS" MAX_WIDTH="6 cm" MIN_WIDTH="3 cm"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="bottom_or_right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#ffffff" BACKGROUND_COLOR="#053d8b" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="10 pt" SHAPE_VERTICAL_MARGIN="10 pt" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#2c2b29" BORDER_DASH_LIKE_EDGE="true">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#ffffff" BACKGROUND_COLOR="#1164b0" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="8 pt" SHAPE_VERTICAL_MARGIN="5 pt" BORDER_COLOR="#2c2b29">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#ffffff" BACKGROUND_COLOR="#298bc8" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="8 pt" SHAPE_VERTICAL_MARGIN="5 pt" BORDER_COLOR_LIKE_EDGE="true" BORDER_COLOR="#f0f0f0">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#ffffff" BACKGROUND_COLOR="#3fb7db" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="8 pt" SHAPE_VERTICAL_MARGIN="5 pt" BORDER_COLOR_LIKE_EDGE="true" BORDER_COLOR="#f0f0f0">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#051552" BACKGROUND_COLOR="#5cd5e8" BORDER_COLOR_LIKE_EDGE="true" BORDER_COLOR="#f0f0f0">
<font SIZE="11"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5" BORDER_COLOR_LIKE_EDGE="true" BORDER_COLOR="#f0f0f0">
<font SIZE="11"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6" BORDER_COLOR_LIKE_EDGE="true" BORDER_COLOR="#f0f0f0">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7" BORDER_COLOR="#f0f0f0">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8" BORDER_COLOR="#f0f0f0">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9" BORDER_COLOR="#f0f0f0">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10" BORDER_COLOR="#f0f0f0">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11" BORDER_COLOR="#f0f0f0">
<font SIZE="9"/>
</stylenode>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="accessories/plugins/AutomaticLayout.properties" VALUE="ALL"/>
<font BOLD="true"/>
<node TEXT="1. Graph Thinking" FOLDED="true" POSITION="bottom_or_right" ID="ID_754145201" CREATED="1758938933624" MODIFIED="1758938940329">
<node TEXT="1.1 What is Neo4j?" ID="ID_1102836801" CREATED="1758938941448" MODIFIED="1758938946699">
<node TEXT="Neo4j is a graph database that stores data in a graph." ID="ID_1946364406" CREATED="1758939137105" MODIFIED="1758939149988"/>
<node TEXT="Data is stored as nodes and relationships instead of tables or documents" ID="ID_13729904" CREATED="1758939150242" MODIFIED="1758939165382"/>
<node TEXT="Nodes, Relationships, Labels, and Properties" ID="ID_1148601110" CREATED="1758939169467" MODIFIED="1758939181086">
<node TEXT="Nodes" ID="ID_1909384021" CREATED="1758940474581" MODIFIED="1758940477104">
<node TEXT="Create Nodes with Labels" POSITION="bottom_or_right" ID="ID_476394202" CREATED="1758939783389" MODIFIED="1758939792054">
<node TEXT="create (:Person {name:&quot;Michael&quot;});&#xa;create (:Person {name:&quot;Sarah&quot;});&#xa;create (:Company {name:&quot;Neo4j&quot;});&#xa;create (:Location {name:&quot;Sweden&quot;})" ID="ID_468660802" CREATED="1758939792058" MODIFIED="1758939818939"/>
</node>
<node TEXT="If you want to correct/change one label, e.g. you mistake type &quot;Neorj&quot; for Company label, use SET" POSITION="bottom_or_right" ID="ID_926051400" CREATED="1758939927516" MODIFIED="1758939960502">
<node TEXT="match (c:Company {name:&quot;Neorj&quot;})&#xa;set c.name = &quot;Neo4j&quot;&#xa;return c" ID="ID_1550051631" CREATED="1758939960511" MODIFIED="1758939967337"/>
</node>
<node TEXT="Add additional labels to one node" POSITION="bottom_or_right" ID="ID_403230976" CREATED="1758940153598" MODIFIED="1758940168199">
<node TEXT="MATCH (n {name:&quot;Michael&quot;})&#xa;SET n:Employee&#xa;RETURN n" ID="ID_1658475876" CREATED="1758940168203" MODIFIED="1758940174691"/>
</node>
</node>
<node TEXT="Relationships" ID="ID_400190290" CREATED="1758940339296" MODIFIED="1758940343295">
<node TEXT="One-Way Relationships" ID="ID_1901635414" CREATED="1758940444861" MODIFIED="1758940451712">
<node TEXT="MATCH (p:Person {name:&quot;Michael&quot;})&#xa;MATCH (c:Company {name:&quot;Neo4j&quot;})&#xa;MATCH (l:Location {name:&quot;Sweden&quot;})&#xa;CREATE (p)-[:WORKS_AT]-&gt;(c)-[:FOUNDED_IN]-&gt;(l)&#xa;RETURN p,c,l" POSITION="bottom_or_right" ID="ID_666078939" CREATED="1758940343298" MODIFIED="1758940346313"/>
</node>
<node TEXT="Two-Way Relationships" ID="ID_1276696653" CREATED="1758940455606" MODIFIED="1758940460182">
<node TEXT="MATCH (p1:Person {name:&quot;Michael&quot;}), (p2:Person {name:&quot;Sarah&quot;})&#xa;CREATE (p1)-[:LOVES]-&gt;(p2)-[:LOVES]-&gt;(p1)&#xa;RETURN p1,p2" ID="ID_199100928" CREATED="1758940460184" MODIFIED="1758940463218"/>
<node TEXT="MATCH (p1:Person {name:&quot;Michael&quot;}), (p2:Person {name:&quot;Sarah&quot;})&#xa;CREATE (p1)-[:MARRIED_TO]-&gt;(p2)-[:MARRIED_TO]-&gt;(p1)&#xa;RETURN p1,p2" ID="ID_418717879" CREATED="1758940859767" MODIFIED="1758940901643"/>
</node>
</node>
<node TEXT="Properties" ID="ID_1212036191" CREATED="1758940468039" MODIFIED="1758940471736">
<node TEXT="For Node &quot;Michael&quot;" ID="ID_1352985116" CREATED="1758940650105" MODIFIED="1758940663866">
<node TEXT="MATCH (p:Person {name:&quot;Michael&quot;})&#xa;SET p.firstName = &quot;Michael&quot;,&#xa;    p.lastName = &quot;Faraday&quot;,&#xa;    p.born = &quot;1971-09-22&quot;&#xa;RETURN p" ID="ID_1947806476" CREATED="1758940663871" MODIFIED="1758940666594"/>
</node>
<node TEXT="For Node &quot;Sarah&quot;" ID="ID_735781765" CREATED="1758940671250" MODIFIED="1758940719176">
<node TEXT="MATCH (p:Person {name:&quot;Sarah&quot;})&#xa;SET p.firstName = &quot;Sarah&quot;, p.lastName = &quot;Faraday&quot;, p.maidenName = &quot;Barnard&quot;&#xa;RETURN p" ID="ID_1627540435" CREATED="1758940719178" MODIFIED="1758940721444"/>
</node>
<node TEXT="For Node &quot;Neo4j&quot;" ID="ID_1730907362" CREATED="1758940726336" MODIFIED="1758940735896">
<node TEXT="MATCH (c:Company {name:&quot;Neo4j&quot;})&#xa;SET c.website = &quot;neo4j.com&quot;&#xa;RETURN c" ID="ID_711878334" CREATED="1758940735903" MODIFIED="1758940783773"/>
</node>
<node TEXT="For Node &quot;Sweden&quot;" ID="ID_355775280" CREATED="1758940785327" MODIFIED="1758940792936">
<node TEXT="MATCH (l:Location {name:&quot;Sweden&quot;})&#xa;SET l.capital = &quot;Stockholm&quot;, l.region = &quot;Europe&quot;&#xa;RETURN l" ID="ID_408614743" CREATED="1758940792940" MODIFIED="1758940842132"/>
</node>
<node TEXT="For Relation" ID="ID_1516438810" CREATED="1758940906167" MODIFIED="1758940913207">
<node TEXT="MATCH (p:Person {name:&quot;Michael&quot;})-[w:WORKS_AT]-(c:Company {name:&quot;Neo4j&quot;})&#xa;SET w.position = &quot;Engineer&quot;&#xa;RETURN p,c" ID="ID_593772588" CREATED="1758940913213" MODIFIED="1758941028802"/>
</node>
</node>
</node>
</node>
<node TEXT="1.2 Thinking in Graphs" ID="ID_1905112000" CREATED="1758938947376" MODIFIED="1758938954260">
<node TEXT="The O(n) problem" ID="ID_44727138" CREATED="1758941278573" MODIFIED="1758941284576"/>
<node TEXT="NoSQL Databases" ID="ID_621071674" CREATED="1758941284820" MODIFIED="1758941292336"/>
<node TEXT="Graphs" ID="ID_535340952" CREATED="1758941294940" MODIFIED="1758941296359"/>
</node>
<node TEXT="1.3 Graphs Are Everywhere" ID="ID_1284007330" CREATED="1758938954456" MODIFIED="1758938961603">
<node TEXT="1736 to the Present Day" ID="ID_476811426" CREATED="1758941301460" MODIFIED="1758941307743"/>
<node TEXT="Uncover Patterns in your Data" ID="ID_1677546627" CREATED="1758941307940" MODIFIED="1758941314406"/>
<node TEXT="Knowledge Graphs &amp; Generative AI" ID="ID_1135835687" CREATED="1758941321124" MODIFIED="1758941329471"/>
<node TEXT="Routing" ID="ID_1048319255" CREATED="1758941361963" MODIFIED="1758941364789"/>
</node>
</node>
<node TEXT="2. Querying Graphs" FOLDED="true" POSITION="bottom_or_right" ID="ID_1877167235" CREATED="1758938962480" MODIFIED="1758938969256">
<node TEXT="2.1 Reading Graphs" ID="ID_416361397" CREATED="1758938969259" MODIFIED="1758938973611">
<node TEXT="Using Cypher" ID="ID_1595522536" CREATED="1758941381956" MODIFIED="1758941391055">
<node TEXT="&quot;movies&quot; graph: https://github.com/neo4j-graph-examples/movies" ID="ID_65710670" CREATED="1758941674051" MODIFIED="1758941689861" LINK="https://github.com/neo4j-graph-examples/movies"/>
</node>
<node TEXT="Explorer the Graph" ID="ID_169393369" CREATED="1758941396244" MODIFIED="1758941402927">
<node TEXT="People" ID="ID_1988044576" CREATED="1758941421868" MODIFIED="1758941425376"/>
<node TEXT="Movies" ID="ID_1197942224" CREATED="1758941428597" MODIFIED="1758941431040"/>
<node TEXT="User Ratings" ID="ID_760660066" CREATED="1758941434076" MODIFIED="1758941437040"/>
</node>
</node>
<node TEXT="2.2 Pattern Matching" ID="ID_425043506" CREATED="1758938973808" MODIFIED="1758938979881">
<node TEXT="Patterns" ID="ID_675450704" CREATED="1758941448139" MODIFIED="1758941455584">
<node TEXT="Nodes" ID="ID_47471897" CREATED="1758941489044" MODIFIED="1758941490816"/>
<node TEXT="Relationships" ID="ID_1363254898" CREATED="1758941490995" MODIFIED="1758941493206"/>
<node TEXT="Variables" ID="ID_1512136221" CREATED="1758941496869" MODIFIED="1758941499832"/>
</node>
<node TEXT="MATCH-ing" ID="ID_652546325" CREATED="1758941502812" MODIFIED="1758941505976"/>
</node>
<node TEXT="2.3 Creating Graphs" ID="ID_1375604677" CREATED="1758938980088" MODIFIED="1758938984923">
<node TEXT="The MERGE Clause" ID="ID_1737301414" CREATED="1758941530819" MODIFIED="1758941536783">
<node TEXT="Create a Movie node" ID="ID_776169473" CREATED="1758941578252" MODIFIED="1758941587415"/>
<node TEXT="Create a RATED relationship" ID="ID_1208797752" CREATED="1758941587564" MODIFIED="1758941596063"/>
</node>
</node>
</node>
<node TEXT="3. Exploring Neo4j" FOLDED="true" POSITION="bottom_or_right" ID="ID_852576041" CREATED="1758938985952" MODIFIED="1758938993361">
<node TEXT="3.1 Get Neo4j" ID="ID_205788607" CREATED="1758938993365" MODIFIED="1758939002588">
<node TEXT="Neo4j Community - Server and Desktop" ID="ID_108010029" CREATED="1758941616803" MODIFIED="1758941815499" LINK="https://neo4j.com/deployment-center/?gdb-selfmanaged&amp;community"/>
</node>
<node TEXT="3.2 Neo4j Tools" ID="ID_550067719" CREATED="1758939002760" MODIFIED="1758939007948">
<node TEXT="Console" ID="ID_1930588753" CREATED="1758941867306" MODIFIED="1758941871143"/>
<node TEXT="Import" ID="ID_948301347" CREATED="1758941871715" MODIFIED="1758941873613"/>
<node TEXT="Explore" ID="ID_1980484565" CREATED="1758941873788" MODIFIED="1758941875646"/>
<node TEXT="Query" ID="ID_1809869309" CREATED="1758941875923" MODIFIED="1758941878118"/>
</node>
<node TEXT="3.3 Congratulations and Next Steps" ID="ID_986304821" CREATED="1758939008090" MODIFIED="1758939019011"/>
</node>
<node TEXT="4. Course Summary" FOLDED="true" POSITION="bottom_or_right" ID="ID_1110223901" CREATED="1758939019896" MODIFIED="1758939024464">
<node TEXT="4.1 Course Summary" ID="ID_719388378" CREATED="1758939024468" MODIFIED="1758939029674"/>
<node TEXT="4.2 Share Your Achievement" ID="ID_135771524" CREATED="1758939029864" MODIFIED="1758939036506"/>
</node>
</node>
</map>
