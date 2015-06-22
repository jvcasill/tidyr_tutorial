## @knitr load
library(tidyr); library(dplyr); 
library(DiagrammeR); library(ggplot2)


## @knitr pipeline1

diagram1 <- "
graph LR
A[1. Collect data]-->B(2. tidy data) 
B-->C{3. transform data}
C-->D(4a. visualize data)
D-->C
C-->E(4b. analyze data)
E-->C
D-->F[New insight]
E-->F

style A fill:#DCEBE3
style B fill:#77DFC9
style C fill:#DEDBBA
style D fill:#F8F0CC
style E fill:#F8F0CC
style F fill:#DCEBE3
"

mermaid(diagram1, height = 200) 


## @knitr pipeline2

diagram2 <- "
graph LR
F(tidyr)-->G{dplyr}
G-->H(ggplot2/ggvis)

style F fill:#77DFC9
style G fill:#DEDBBA
style H fill:#F8F0CC
"
mermaid(diagram2, height = 70)



## @knitr pipeline3
type_1_nodes <-
  create_nodes(nodes = c("a", "b", "c", "d", "e", "f"),
               label = c("1. Collect data", "2. tidy data", "3. transform data", "4a. visualize data", "4b. analyze data", "New insight"),
               style = "filled",
               color = "darkgrey",
               shape = c("circle", "circle",
                         "circle", "triangle", "triangle"))

type_2_nodes <-
  create_nodes(nodes = c("g", "h", "i"),
               label = c("tidyr", "dplyr", "ggplot2/ggvis"),
               style = "filled",
               color = "lightblue",
               peripheries = c(2, 2, 2))

all_nodes <- combine_nodes(type_1_nodes, type_2_nodes)

type_1_edges <-
  create_edges(edge_from = c("a", "b", "c", "c", "d", "e"),
               edge_to = c("b", "c", "d", "e", "f", "f"))

type_2_edges <-
  create_edges(edge_from = c("b", "c", "d"),
               edge_to = c("g", "h", "i"),
               arrowhead = "dot",
               color = "red")

all_edges <- combine_edges(type_1_edges, type_2_edges)

create_graph(nodes_df = all_nodes,
             edges_df = all_edges,
             node_attrs = "fontname = Helvetica",
             edge_attrs = c("color = gray", "penwidth = 4")) %>% 
             render_graph





