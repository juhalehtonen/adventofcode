# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :day2, input: "62	1649	1731	76	51	1295	349	719	52	1984	2015	2171	981	1809	181	1715
161	99	1506	1658	84	78	533	242	1685	86	107	1548	670	960	1641	610
95	2420	2404	2293	542	2107	2198	121	109	209	2759	1373	1446	905	1837	111
552	186	751	527	696	164	114	530	558	307	252	200	481	142	205	479
581	1344	994	1413	120	112	656	1315	1249	193	1411	1280	110	103	74	1007
2536	5252	159	179	4701	1264	1400	2313	4237	161	142	4336	1061	3987	2268	4669
3270	1026	381	185	293	3520	1705	1610	3302	628	3420	524	3172	244	295	39
4142	1835	4137	3821	3730	2094	468	141	150	3982	147	4271	1741	2039	4410	179
1796	83	2039	1252	84	1641	2165	1218	1936	335	1807	2268	66	102	1977	2445
96	65	201	275	257	282	233	60	57	200	216	134	72	105	81	212
3218	5576	5616	5253	178	3317	6147	5973	2424	274	4878	234	200	4781	5372	276
4171	2436	134	3705	3831	3952	2603	115	660	125	610	152	4517	587	1554	619
2970	128	2877	1565	1001	167	254	2672	59	473	2086	181	1305	162	1663	2918
271	348	229	278	981	1785	2290	516	473	2037	737	2291	2521	1494	1121	244
2208	2236	1451	621	1937	1952	865	61	1934	49	1510	50	1767	59	194	1344
94	2312	2397	333	1192	106	2713	2351	2650	2663	703	157	89	510	1824	125"

config :day2, testinput1: "5	1	9	5
7	5	3
2	4	6	8"

config :day2, testinput2: "5	9	2	8
9	4	7	3
3	8	6	5"

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :day2, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:day2, :key)
#
# You can also configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"
