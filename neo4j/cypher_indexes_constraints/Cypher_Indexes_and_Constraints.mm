<map version="freeplane 1.12.1">
<!--To view this file, download free mind mapping software Freeplane from https://www.freeplane.org -->
<node TEXT="Cypher Indexes and Constraints&#xa;(Neo4j Graph Academy)" LOCALIZED_STYLE_REF="AutomaticLayout.level.root" FOLDED="false" ID="ID_1090958577" CREATED="1409300609620" MODIFIED="1766736044378" VGAP_QUANTITY="3 pt"><hook NAME="MapStyle" background="#d6e8e8ff" zoom="0.826">
    <properties show_icon_for_attributes="true" edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" show_tags="UNDER_NODES" show_note_icons="true" associatedTemplateLocation="template:/light_sky_element_template.mm" fit_to_viewport="false" show_icons="BESIDE_NODES"/>
    <tags category_separator="::"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="bottom_or_right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ID="ID_4172522" ICON_SIZE="12 pt" FORMAT_AS_HYPERLINK="false" COLOR="#051552" BACKGROUND_COLOR="#5cd5e8" STYLE="bubble" SHAPE_HORIZONTAL_MARGIN="8 pt" SHAPE_VERTICAL_MARGIN="5 pt" BORDER_WIDTH_LIKE_EDGE="false" BORDER_WIDTH="1.7 px" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#1164b0" BORDER_DASH_LIKE_EDGE="true" BORDER_DASH="SOLID" VGAP_QUANTITY="3 pt">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="200" DASH="" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_4172522" STARTINCLINATION="116.25 pt;0 pt;" ENDINCLINATION="116.25 pt;28.5 pt;" STARTARROW="NONE" ENDARROW="DEFAULT"/>
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
<node TEXT="1. Indexes and Constraints in Neo4j" FOLDED="true" POSITION="bottom_or_right" ID="ID_936933566" CREATED="1766736119713" MODIFIED="1766736127955">
<node TEXT="1.1 Constraints and Indexes in Neo4j" ID="ID_242000445" CREATED="1766736174193" MODIFIED="1766736182017">
<node TEXT="A constraint is implemented internally as an index and is used to constrain what is added to the graph." ID="ID_133593147" CREATED="1766737120380" MODIFIED="1766737793160">
<node TEXT="Three type of Constraints" ID="ID_1819908468" CREATED="1766738617443" MODIFIED="1766738624520">
<node TEXT="Uniqueness for a single node property value" POSITION="bottom_or_right" ID="ID_687937766" CREATED="1766737796200" MODIFIED="1766737825947"/>
<node TEXT="Existence for a property of a node or relationship" POSITION="bottom_or_right" ID="ID_1285660333" CREATED="1766737826120" MODIFIED="1766737836299"/>
<node TEXT="Existence and uniqueness for a set of node property value (called a Node key)" POSITION="bottom_or_right" ID="ID_496281459" CREATED="1766737836472" MODIFIED="1766737853994"/>
</node>
</node>
<node TEXT="An index in Neo4j is a data structure that allows the graph engine to retrieve data quickly." ID="ID_1443700301" CREATED="1766738272836" MODIFIED="1766738476537">
<node TEXT="After the data is loaded, creating indexes can make queries perform faster." ID="ID_212380497" CREATED="1766738561571" MODIFIED="1766738584228"/>
<node TEXT="Using indexes makes writing data slower, but retrieving is faster." ID="ID_1334452674" CREATED="1766738584403" MODIFIED="1766738599621"/>
<node TEXT="Type of indexes in Neo4j" ID="ID_613125490" CREATED="1766738631076" MODIFIED="1766738641219">
<node TEXT="RANGE" ID="ID_1560928689" CREATED="1766738641223" MODIFIED="1766738719272">
<icon BUILTIN="button_ok"/>
</node>
<node TEXT="LOOKUP" ID="ID_1965726357" CREATED="1766738644162" MODIFIED="1766738719274">
<icon BUILTIN="button_ok"/>
</node>
<node TEXT="TEXT" ID="ID_823226353" CREATED="1766738646498" MODIFIED="1766738719274">
<icon BUILTIN="button_ok"/>
</node>
<node TEXT="POINT" ID="ID_1853839953" CREATED="1766738648226" MODIFIED="1766738649364"/>
<node TEXT="Full-text" ID="ID_1815321537" CREATED="1766738649522" MODIFIED="1766738653220"/>
</node>
<node TEXT="The index on multiple properties or relationships called Composite Index." ID="ID_1298354475" CREATED="1766738666210" MODIFIED="1766738690870"/>
</node>
</node>
<node TEXT="1.2 Identifying What Constraints and Indexes to Create" ID="ID_1688858449" CREATED="1766736182191" MODIFIED="1766736193762">
<node TEXT="Steps of Creating Constraints and Indexes" ID="ID_1636507771" CREATED="1766752778305" MODIFIED="1766752795801">
<node TEXT="1) Identify constraints" ID="ID_1761460794" CREATED="1766752795803" MODIFIED="1766752805341"/>
<node TEXT="2) Create constraints" ID="ID_865110068" CREATED="1766752805785" MODIFIED="1766752817930"/>
<node TEXT="3) Load the data" ID="ID_310814504" CREATED="1766752818105" MODIFIED="1766752822372"/>
<node TEXT="4) Identify indexes" ID="ID_469322799" CREATED="1766752825609" MODIFIED="1766752835114"/>
<node TEXT="5) Create indexes" ID="ID_1695889144" CREATED="1766752835560" MODIFIED="1766752840802"/>
</node>
<node TEXT="When to create indexes and constraints?" ID="ID_135788748" CREATED="1766752714533" MODIFIED="1766752735923">
<node TEXT="Create the constraints before you load data into the graph" ID="ID_1385950185" CREATED="1766752735927" MODIFIED="1766752750270"/>
<node TEXT="Create the indexes after you load the data into the graph" ID="ID_495636228" CREATED="1766752750434" MODIFIED="1766752763940"/>
</node>
</node>
</node>
<node TEXT="2. Using Constraints in Neo4j" FOLDED="true" POSITION="bottom_or_right" ID="ID_567924869" CREATED="1766736128113" MODIFIED="1766736134213">
<node TEXT="2.1 Constraints in Neo4j" ID="ID_302713476" CREATED="1766752878999" MODIFIED="1766752887946">
<node TEXT="Uniqueness constraints" ID="ID_62610042" CREATED="1766753894199" MODIFIED="1766753899377">
<node TEXT="A graph data modeling best practice is to always identify a node with a given label in the graph where a node will typically represent the business entities in your application." POSITION="bottom_or_right" ID="ID_1103214996" CREATED="1766753368083" MODIFIED="1766753407045"/>
<node TEXT="Neo4j implements a uniqueness constraints as an index." POSITION="bottom_or_right" ID="ID_1838114360" CREATED="1766753495698" MODIFIED="1766753512356"/>
<node TEXT="MERGE is the best practice for creating nodes and relationships in the graph" POSITION="bottom_or_right" ID="ID_1459785714" CREATED="1766753785289" MODIFIED="1766753801989"/>
</node>
<node TEXT="Existence constraints" ID="ID_355541417" CREATED="1766753910735" MODIFIED="1766753925584"/>
<node TEXT="Key constraints" ID="ID_167887151" CREATED="1766754110357" MODIFIED="1766754114119">
<node TEXT="A key is a specialized type of constraint in the graph that enables your to define a set of properties for a node label or relationship type that must:" ID="ID_647244209" CREATED="1766754121964" MODIFIED="1766754162139">
<node TEXT="1) Exist for all nodes or relationships with taht label or type" ID="ID_523505670" CREATED="1766754162142" MODIFIED="1766754176501"/>
<node TEXT="2) Be unique for all values" ID="ID_939324315" CREATED="1766754176996" MODIFIED="1766754185707"/>
</node>
</node>
</node>
<node TEXT="2.2 Creating Uniqueness Constraints" ID="ID_7649270" CREATED="1766752888112" MODIFIED="1766752895499">
<node TEXT="Syntax (for a single property):" ID="ID_1972242250" CREATED="1766754591137" MODIFIED="1766754933690">
<node TEXT="CREATE CONSTRAINT &lt;constraint_name&gt; IF NOT EXISTS&#xa;FOR (x:&lt;node_label&gt;)&#xa;REQUIRE x.&lt;property_key&gt; IS UNIQUE" ID="ID_2342652" CREATED="1766754596719" MODIFIED="1766755066340">
<font SIZE="10"/>
</node>
</node>
<node TEXT="You typically create constraints before the data is loaded into the graph" ID="ID_1555725088" CREATED="1766754872760" MODIFIED="1766754893544"/>
<node TEXT="Syntax (for multiple properties):" ID="ID_366882706" CREATED="1766754898647" MODIFIED="1766754947911">
<node TEXT="CREATE CONSTRAINT &lt;constraint_name&gt; IF NOT EXISTS&#xa;FOR (x:&lt;node_label&gt;)&#xa;REQUIRE (x.&lt;property_key1&gt;, x.&lt;property_key2&gt;) IS UNIQUE" ID="ID_1394778544" CREATED="1766754947914" MODIFIED="1766755066328">
<font SIZE="10"/>
</node>
</node>
</node>
<node TEXT="2.3 Creating Existence Constraints for Node Properties" ID="ID_945499683" CREATED="1766752910199" MODIFIED="1766752920527">
<node TEXT="Existence constraints are only available in Enterprise Edition" ID="ID_1719439188" CREATED="1766756932573" MODIFIED="1766757030157"/>
<node TEXT="Syntax (on a node):" ID="ID_154489689" CREATED="1766757036357" MODIFIED="1766757053652">
<node TEXT="CREATE CONSTRAINT &lt;constraint_name&gt; IF NOT EXISTS&#xa;FOR (x:&lt;node_label&gt;)&#xa;REQUIRE x.&lt;property_key&gt; IS NOT NULL" ID="ID_1916990486" CREATED="1766757053654" MODIFIED="1766757093518"/>
</node>
<node TEXT="You typically create constraints before the data is loaded into the graph" ID="ID_1920008392" CREATED="1766757284445" MODIFIED="1766757304133"/>
</node>
<node TEXT="2.4 Creating Existing Constraints on Relationship Properties" ID="ID_821011649" CREATED="1766752920807" MODIFIED="1766752943600">
<node TEXT="Syntax (for a relationship)" ID="ID_187503837" CREATED="1766761314697" MODIFIED="1766761364584">
<node TEXT="CREATE CONSTRAINT &lt;constraint_name&gt; IF NOT EXISTS&#xa;FOR ()-[x:&lt;RELATIOINSHIP_TYPE&gt;]-()&#xa;REQUIRE x.&lt;property_key&gt; IS NOT NULL" ID="ID_654856167" CREATED="1766761364587" MODIFIED="1766761448092"/>
</node>
</node>
<node TEXT="2.5 Creating Node Key Constraints" ID="ID_177797768" CREATED="1766752945167" MODIFIED="1766752953351">
<node TEXT="A Node key is a specialized type of constraint for the properties of a node, it combines existence with uniqueness." ID="ID_542097668" CREATED="1766761911061" MODIFIED="1766761945392"/>
<node TEXT="Syntax (for a single property)" ID="ID_1142070707" CREATED="1766761957346" MODIFIED="1766761967210">
<node TEXT="CREATE CONSTRAINT &lt;constraint_name&gt; IF NOT EXISTS&#xa;FOR (x:&lt;node_label&gt;)&#xa;REQUIRE x.&lt;property_key&gt; IS NODE KEY" ID="ID_849163220" CREATED="1766761967213" MODIFIED="1766762106316"/>
</node>
<node TEXT="Syntax (for multiple properties)" ID="ID_1933227329" CREATED="1766762085763" MODIFIED="1766762094914">
<node TEXT="CREATE CONSTRAINT &lt;constraint_name&gt; IF NOT EXISTS&#xa;FOR (x:&lt;node_label&gt;)&#xa;REQUIRE (x.&lt;property_key1&gt;, x.&lt;property_key2&gt;) IS NODE KEY" ID="ID_1633018913" CREATED="1766762094917" MODIFIED="1766762163027"/>
</node>
</node>
<node TEXT="2.6 Managing Constraints in Neo4j" ID="ID_1583148804" CREATED="1766752954543" MODIFIED="1766752963250">
<node TEXT="Creating constraints (CREATE CONSTRAINT...)" ID="ID_1696800484" CREATED="1766762363224" MODIFIED="1766762379459"/>
<node TEXT="Listing constraints (SHOW CONSTRAINTS)" ID="ID_1648360756" CREATED="1766762379600" MODIFIED="1766762392027"/>
</node>
<node TEXT="2.7 Dropping Constraints" ID="ID_36500850" CREATED="1766752963406" MODIFIED="1766752968593">
<node TEXT="DROP CONSTRAINT &lt;constraint_name&gt;" POSITION="bottom_or_right" ID="ID_736550126" CREATED="1766762408481" MODIFIED="1766762420452"/>
<node TEXT="Creating list of constraints to drop" POSITION="bottom_or_right" ID="ID_1322782427" CREATED="1766762450152" MODIFIED="1766762459580">
<node TEXT="SHOW CONSTRAINTS YIELD name RETURN collect(&apos;DROP CONSTRAINT &apos; + name + &apos;;&apos;) AS Statements" ID="ID_29981924" CREATED="1766762475376" MODIFIED="1766762523667"/>
</node>
<node TEXT="Using APOC for dropping all indexes and constraints" POSITION="bottom_or_right" ID="ID_427327568" CREATED="1766762536432" MODIFIED="1766762549240">
<node TEXT="CALL apoc.schema.assert({}, {}, tru)" ID="ID_1860079770" CREATED="1766762549245" MODIFIED="1766762563156"/>
</node>
</node>
</node>
<node TEXT="3. Using Indexes in Neo4j" FOLDED="true" POSITION="bottom_or_right" ID="ID_1772466565" CREATED="1766736140224" MODIFIED="1766736145538">
<node TEXT="3.1 Indexes in Neo4j" POSITION="bottom_or_right" ID="ID_1606434730" CREATED="1766762392208" MODIFIED="1766762818834">
<node TEXT="Indexes are used to provide faster Cypher queries." ID="ID_787569994" CREATED="1766762985791" MODIFIED="1766762998691"/>
<node TEXT="An index in Neo4j is a data structure that allows the graph engine to retrieve data quickly." ID="ID_751401369" CREATED="1766763078847" MODIFIED="1766763098306"/>
<node TEXT="Using indexes makes writing data slower, but retrieving it faster." ID="ID_283984857" CREATED="1766763130438" MODIFIED="1766763148153"/>
<node TEXT="Types of Indexes" ID="ID_971257419" CREATED="1766763158943" MODIFIED="1766763166983">
<node TEXT="RANGE" ID="ID_463796942" CREATED="1766763173398" MODIFIED="1766763175114">
<node TEXT="A b-tree is a common implementation of an index that enables you to sort values." ID="ID_34785611" CREATED="1766763947709" MODIFIED="1766763969439"/>
<node TEXT="A RANGE index in Neo4j is a proprietary implementation of a b-tree." ID="ID_185338886" CREATED="1766763970565" MODIFIED="1766763988568"/>
<node TEXT="A RANGE index can speed up following Cypher code" ID="ID_525927559" CREATED="1766764110917" MODIFIED="1766764158614">
<node TEXT="Equality checks &quot;=&quot;" ID="ID_1412647587" CREATED="1766764158618" MODIFIED="1766764166489">
<node TEXT="For String properties, a TEXT index may perform better" ID="ID_1774204830" CREATED="1766764171565" MODIFIED="1766764184481"/>
</node>
<node TEXT="Range comparisons &gt;, &gt;=, &lt;, &lt;=" ID="ID_421126598" CREATED="1766764185429" MODIFIED="1766764198680"/>
<node TEXT="&quot;STARTS WITH&quot; string comparison" ID="ID_395578387" CREATED="1766764199525" MODIFIED="1766764217561">
<node TEXT="Recommend to use TEXT index for &quot;ENDS WITH&quot; and &quot;CONTAINS&quot;" POSITION="bottom_or_right" ID="ID_630563144" CREATED="1766764238589" MODIFIED="1766764254736"/>
</node>
<node TEXT="Existence check &quot;IS NOT NULL&quot;" ID="ID_1343787505" CREATED="1766764218044" MODIFIED="1766764226880"/>
</node>
<node TEXT="Uniqueness constraints defined as RANGE indexes" POSITION="bottom_or_right" ID="ID_1325878099" CREATED="1766763166987" MODIFIED="1766798220370"/>
</node>
<node TEXT="Composite" ID="ID_1554868108" CREATED="1766763175279" MODIFIED="1766763177594">
<node TEXT="A composite index combines values from multiple properties for a node label or for relationship type." ID="ID_247693158" CREATED="1766764311693" MODIFIED="1766764335145"/>
<node TEXT="You create composite indexes when multiple properties are always tested together in a query" ID="ID_1314317612" CREATED="1766764339693" MODIFIED="1766764365025"/>
</node>
<node TEXT="TEXT" ID="ID_957405409" CREATED="1766763177758" MODIFIED="1766763180945">
<node TEXT="A TEXT index supports node or relationship property types that must be strings." ID="ID_1396093753" CREATED="1766797229404" MODIFIED="1766797256194"/>
<node TEXT="A TEXT index can speed up following Cypher code:" ID="ID_1101041069" CREATED="1766797271942" MODIFIED="1766797294182">
<node TEXT="Equality checks: =" ID="ID_1371380003" CREATED="1766797294184" MODIFIED="1766797299945"/>
<node TEXT="String comparisons: ENDS WITH, CONTAINS" ID="ID_954020228" CREATED="1766797300527" MODIFIED="1766797316952">
<arrowlink DESTINATION="ID_630563144"/>
</node>
<node TEXT="List membership x.prop in [&quot;a&quot;, &quot;b&quot;, &quot;c&quot;]" ID="ID_205988504" CREATED="1766797320086" MODIFIED="1766797335385"/>
</node>
</node>
<node TEXT="LOOKUP" ID="ID_788901052" CREATED="1766797348350" MODIFIED="1766797354104">
<node TEXT="The two types of LOOKUP indexes are created automatically and are used to look up a node label or relationship type value" ID="ID_850688588" CREATED="1766797359686" MODIFIED="1766797388091"/>
</node>
<node TEXT="POINT" ID="ID_218744950" CREATED="1766763181214" MODIFIED="1766763183090"/>
<node TEXT="Full-text" ID="ID_1055466931" CREATED="1766763183358" MODIFIED="1766763186329"/>
</node>
<node TEXT="Using PROFILE to analyze queries that use indexes" ID="ID_267996602" CREATED="1766763202862" MODIFIED="1766763214450">
<node TEXT="At runtime, only one index is used by default" ID="ID_1223625103" CREATED="1766763326766" MODIFIED="1766763341112"/>
</node>
</node>
<node TEXT="3.2 Creating Single Property Indexes" POSITION="bottom_or_right" ID="ID_311695092" CREATED="1766762819006" MODIFIED="1766762836761">
<node TEXT="Syntax: for a single property of a node" ID="ID_463783425" CREATED="1766798265151" MODIFIED="1766798277238">
<node TEXT="CREATE INDEX &lt;index_name&gt; IF NOT EXISTS&#xa;FOR (x:&lt;node_label&gt;)&#xa;ON x.&lt;property_key&gt;" ID="ID_1607060317" CREATED="1766798277242" MODIFIED="1766798306315"/>
</node>
<node TEXT="Always profile before your deploy your application!" ID="ID_1830752318" CREATED="1766799242805" MODIFIED="1766799255625"/>
<node TEXT="Syntax: for a single property of a relationship" ID="ID_1480387334" CREATED="1766799480171" MODIFIED="1766799492227">
<node TEXT="CREATE INDEX &lt;index_name&gt; IF NOT EXISTS&#xa;FOR ()-[x:&lt;RELATIONSHIP_TYPE&gt;-()&#xa;ON (x.&lt;property_key&gt;)" ID="ID_452641005" CREATED="1766799492233" MODIFIED="1766799542599"/>
</node>
<node TEXT="Dropping indexes" ID="ID_776148822" CREATED="1766799568554" MODIFIED="1766799575251">
<node TEXT="DROP INDEX &lt;index_name&gt;" ID="ID_444251819" CREATED="1766799575257" MODIFIED="1766799583687"/>
</node>
</node>
<node TEXT="3.3 Creating a RANGE Index on a Node Property" POSITION="bottom_or_right" ID="ID_1838263042" CREATED="1766762837031" MODIFIED="1766762851880"/>
<node TEXT="3.4 Creating a RANGE Index on a Relationship Property" POSITION="bottom_or_right" ID="ID_1672130984" CREATED="1766762884575" MODIFIED="1766762897059"/>
<node TEXT="3.5 Creating Multi-Property Indexes" POSITION="bottom_or_right" ID="ID_943182062" CREATED="1766762852008" MODIFIED="1766762883691">
<node TEXT="A multi-property index (composite RANGE index) provides quick lookups for two or more properties of a node or relationship" POSITION="bottom_or_right" ID="ID_1797731454" CREATED="1766799728467" MODIFIED="1766800499020"/>
<node TEXT="Syntax: for multiple properties of a node" POSITION="bottom_or_right" ID="ID_158909232" CREATED="1766800572270" MODIFIED="1766800583085">
<node TEXT="CREATE INDEX &lt;index_name&gt; IF NOT EXISTS&#xa;FOR (x:&lt;node_label&gt;)&#xa;ON (x.&lt;property_key1&gt;, x.&lt;property_key2&gt;,...)" ID="ID_1647470630" CREATED="1766800583088" MODIFIED="1766800622920"/>
</node>
<node TEXT="If the query tests the existence of a property, it will not use this type of index." POSITION="bottom_or_right" ID="ID_1854606624" CREATED="1766800698131" MODIFIED="1766800716758"/>
<node TEXT="Syntax: for a multiple properties of a relationship" POSITION="bottom_or_right" ID="ID_652705435" CREATED="1766800793016" MODIFIED="1766800804945">
<node TEXT="CREATE INDEX &lt;index_name&gt; IF NOT EXISTS&#xa;FOR ()-[x:&lt;RELATIONSHIP_TYPE&gt;]-()&#xa;ON (x.&lt;property_key1&gt;, x.&lt;property_key2&gt;,...)" ID="ID_1157732052" CREATED="1766800804949" MODIFIED="1766800849707"/>
</node>
</node>
<node TEXT="3.6 Creating a Composite Index on a Node Property" POSITION="bottom_or_right" ID="ID_1995193974" CREATED="1766762897863" MODIFIED="1766762911633">
<node TEXT="Step 1: Profile this query and note the number of total db hits." ID="ID_1257460448" CREATED="1766806045856" MODIFIED="1766806104459"/>
<node TEXT="Step 2: Create a Composite index that will make this query faster" ID="ID_1757570182" CREATED="1766806104615" MODIFIED="1766806119564"/>
<node TEXT="Step 3: Repeat the query with a profile.0" ID="ID_495162561" CREATED="1766806123727" MODIFIED="1766806269138"/>
</node>
<node TEXT="3.7 Creating TEXT Indexes" POSITION="bottom_or_right" ID="ID_1208306943" CREATED="1766762911823" MODIFIED="1766762918603">
<node ID="ID_1572580850" CREATED="1766806309071" MODIFIED="1766806332253"><richcontent TYPE="NODE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      A TEXT index is designed for single properties of nodes or relationships that are <span style="font-weight: bold;">strings</span><span style="font-weight: normal;">.</span>
    </p>
  </body>
</html>
</richcontent>
</node>
<node TEXT="TEXT indexes cannot be used for existence checks like RANGE indexes can." ID="ID_1534515389" CREATED="1766806356503" MODIFIED="1766806378096"/>
<node ID="ID_483394978" CREATED="1766806388278" MODIFIED="1766806423194"><richcontent TYPE="NODE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      You should <span style="font-weight: bold;">only</span><span style="font-weight: normal;">&#xa0;create a TEXT index if you want to optimize ENDS WITH or CONTAINS tests which are faster with TEXT indexes.</span>
    </p>
  </body>
</html>
</richcontent>
<node TEXT="In all other cases, you should use a RANGE index." ID="ID_320495319" CREATED="1766806423200" MODIFIED="1766806432744"/>
</node>
<node TEXT="Syntax: for node property" ID="ID_1446711512" CREATED="1766806439094" MODIFIED="1766806445415">
<node TEXT="CREATE TEXT INDEX &lt;index_name&gt; IF NOT EXISTS&#xa;FOR (x:&lt;node_label&gt;)&#xa;ON x.&lt;property_key&gt;" ID="ID_1077662194" CREATED="1766806445420" MODIFIED="1766806476859"/>
</node>
<node TEXT="TEXT index usage may yield higher total db hits, but lower elapsed times.&#xa;使用 TEXT 索引可能会产生更高的数据库总命中次数，但耗时更短。" ID="ID_1435890053" CREATED="1766806654967" MODIFIED="1766806700817"/>
<node TEXT="Why use a TEXT index?" ID="ID_841818208" CREATED="1766806789678" MODIFIED="1766806796935">
<node TEXT="TEXT indexes perform better than RANGE indexes if there are many duplicate properties" ID="ID_282746057" CREATED="1766806796940" MODIFIED="1766806814986"/>
<node TEXT="TEXT indexes take up less space in the graph" ID="ID_1953292281" CREATED="1766806815158" MODIFIED="1766806826153"/>
</node>
<node TEXT="Syntax: for a relationship property" ID="ID_1638251528" CREATED="1766806852726" MODIFIED="1766806859423">
<node TEXT="CREATE TEXT INDEX &lt;index_name&gt; IF NOT EXISTS&#xa;FOR ()-[x:RELATIONSHIP_TYPE]-()&#xa;ON (x.&lt;property_key&gt;)" ID="ID_148822433" CREATED="1766806859428" MODIFIED="1766806901153"/>
</node>
</node>
<node TEXT="3.8 Using a TEXT index" POSITION="bottom_or_right" ID="ID_1279579003" CREATED="1766762918760" MODIFIED="1766762924779"/>
</node>
<node TEXT="4 Using Full-text Indexes in Neo4j" FOLDED="true" POSITION="bottom_or_right" ID="ID_1937938993" CREATED="1766762924959" MODIFIED="1766807601110">
<node TEXT="A full-text index is based upon string values only, but provides additional search capabilities that you do not get from RANGE or TEXT indexes." ID="ID_220650570" CREATED="1766807381493" MODIFIED="1766807421730"/>
<node TEXT="A full-text schema index can be used for:" ID="ID_197200566" CREATED="1766807425150" MODIFIED="1766807435325">
<node TEXT="Node or relationship properties" ID="ID_1936770830" CREATED="1766807435327" MODIFIED="1766807442523"/>
<node TEXT="Single property or multiple properties" ID="ID_1337710715" CREATED="1766807442661" MODIFIED="1766807452409"/>
<node TEXT="Single or multiple types of nodes (labels)" ID="ID_897088954" CREATED="1766807452588" MODIFIED="1766807462103"/>
<node TEXT="Single or multiple types of relationships" ID="ID_176834568" CREATED="1766807462285" MODIFIED="1766807474176"/>
</node>
<node TEXT="You must explicitly specify the full-text indexes use whereas regular indexes are automatically used" ID="ID_1526712389" CREATED="1766807487381" MODIFIED="1766807523447"/>
<node TEXT="4.1 Full-text Indexes in Neo4j" POSITION="bottom_or_right" ID="ID_174751735" CREATED="1766762943695" MODIFIED="1766807646063">
<node TEXT="Full-text indexes are useful in applications that must parse property values for evaluating whether the property satisfies the criteria." POSITION="bottom_or_right" ID="ID_640817603" CREATED="1766736145696" MODIFIED="1766807733422"/>
<node POSITION="bottom_or_right" ID="ID_1851240387" CREATED="1766807743620" MODIFIED="1766807778440"><richcontent TYPE="NODE">

<html>
  <head>
    
  </head>
  <body>
    <p>
      Full-text indexes rely on <span style="font-weight: bold;">Apache Lucene</span><span style="font-weight: normal;">&#xa0;&#xa0;for their implementation which makes their parsing capabilities very powerful.</span>
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node TEXT="4.2 Creating and Using Full-text Indexes" POSITION="bottom_or_right" ID="ID_1808817897" CREATED="1766762953030" MODIFIED="1766807650326">
<node TEXT="A full-text index is designed for queries that need to search string properties using possibly complex search predicates." ID="ID_68895029" CREATED="1766808047523" MODIFIED="1766808077005"/>
<node TEXT="Syntax: for a node property" ID="ID_1628424071" CREATED="1766808160999" MODIFIED="1766808169968">
<node TEXT="CREATE FULLTEXT INDEX &lt;index_name&gt; IF NOT EXISTS&#xa;FOR (x:&lt;node_label&gt;)&#xa;ON EACH [x.&lt;property_key&gt;]" ID="ID_169884534" CREATED="1766808169971" MODIFIED="1766808209496"/>
</node>
<node TEXT="Syntax: querying relationships with full-text index" ID="ID_1073951223" CREATED="1766812766044" MODIFIED="1766812780269">
<node TEXT="CALL db.index.fulltext.queryRelationships&#xa;(&quot;&lt;index_name&gt;&quot;, &quot;&lt;lucene_query&gt;&quot;)&#xa;YIELD relationship&#xa;RETURN relationship.&lt;property&gt;" ID="ID_489839243" CREATED="1766812780274" MODIFIED="1766812818751"/>
</node>
<node TEXT="Syntax: creating a full-text index for multiple node labels and properties" ID="ID_1350682921" CREATED="1766813003402" MODIFIED="1766813024275">
<node TEXT="CREATE FULLTEXT INDEX &lt;index_name&gt; IF NOT EXISTS&#xa;(x:&lt;node_label1&gt; | &lt;node_label2&gt; | ...)&#xa;ON EACH [x.&lt;property_key1&gt;, x.&lt;property_key2&gt;,...]" ID="ID_888149116" CREATED="1766813024278" MODIFIED="1766813077619"/>
</node>
</node>
<node TEXT="4.3 Using a full-text Index on a Relationship Property" POSITION="bottom_or_right" ID="ID_1384140254" CREATED="1766762963622" MODIFIED="1766807654911">
<node TEXT="Step 1: Create the full-text index" ID="ID_70753747" CREATED="1766813948173" MODIFIED="1766813957823"/>
<node TEXT="Step 2: Query the graph with the full-text index" ID="ID_738686184" CREATED="1766813958004" MODIFIED="1766813970757"/>
</node>
</node>
<node TEXT="5. Index Usage in Neo4j" POSITION="bottom_or_right" ID="ID_1637802720" CREATED="1766736153472" MODIFIED="1766736162513">
<node TEXT="5.1 Controlling Index Usage" ID="ID_1739824030" CREATED="1766814126187" MODIFIED="1766814134975">
<node TEXT="A MATCH clause will use a single index by default." ID="ID_1382180989" CREATED="1766814270930" MODIFIED="1766814285565"/>
</node>
<node TEXT="5.2 Using Query Hints" ID="ID_680303896" CREATED="1766814135131" MODIFIED="1766814140149"/>
<node TEXT="5.3 Getting the Most Out of Indexes" ID="ID_1324121116" CREATED="1766814140301" MODIFIED="1766814148732"/>
</node>
</node>
</map>
