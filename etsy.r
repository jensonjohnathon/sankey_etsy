library(plotly)

labels <- c(
  "Marketplace (2,021)",          
  "Services (788)",              
  "Revenue (2,809)",              
  "Marketing (857)",            
  "Product Development (332)",    
  "General & Admin (271)",       
  "Estimated Costs (1,046)",      
  "Payment Handling (300)",
  "Infrastructure (646)",
  "Depreciation (100)",
  "Profit (303)"
)

colors <- c(
  "rgba(0,0,255,0.6)",     # Marketplace
  "rgba(0,0,255,0.6)",     # Services
  "rgba(0,0,255,0.6)",     # Revenue
  "rgba(255,0,0,0.6)",     # Marketing
  "rgba(255,0,0,0.6)",     # Product Development
  "rgba(255,0,0,0.6)",     # General & Admin
  "rgba(255,255,0,0.6)",   # Estimated Costs
  "rgba(255,0,0,0.6)",     # Payment Handling
  "rgba(255,0,0,0.6)",     # Infrastructure
  "rgba(255,0,0,0.6)",     # Depreciation
  "rgba(0,128,0,0.6)"      # Profit
)

link_colors <- c(
  "rgba(0,0,255,0.5)",    # Marketplace → Revenue
  "rgba(0,0,255,0.5)",    # Services → Revenue
  "rgba(255,0,0,0.4)",    # Revenue → Marketing
  "rgba(255,0,0,0.4)",    # Revenue → Product Development
  "rgba(255,0,0,0.4)",    # Revenue → General & Admin
  "rgba(0,0,255,0.4)",    # Revenue → Estimated Costs
  "rgba(255,0,0,0.4)",    # Estimated Costs → Payment Handling
  "rgba(255,0,0,0.4)",    # Estimated Costs → Infrastructure
  "rgba(255,0,0,0.4)",    # Estimated Costs → Depreciation
  "rgba(0,102,0,0.6)"     # Estimated Costs → Profit
)

fig <- plot_ly(
  type = "sankey",
  arrangement = "freeform",
  node = list(
    label = labels,
    color = colors,
    align = "right",
    pad = 15,
    thickness = 30
  ),
  link = list(
    source = c(0, 1, 2, 2, 2, 2, 6, 6, 6, 6),
    target = c(2, 2, 3, 4, 5, 6, 7, 8, 9, 10),
    value  = c(2021, 788, 857, 332, 271, 1349, 300, 646, 100, 303),
    color = link_colors
  )
) %>%
  layout(
    title = list(text = "Etsy Revenue Flow (2024)", font = list(size = 40)),
    font = list(size = 20),
    margin = list(t = 80, b = 80),
    annotations = list(
      list(
        text = "All figures in millions USD",
        showarrow = FALSE,
        xref = "paper",
        yref = "paper",
        x = 0.5,
        y = 0,
        font = list(size = 16),
        xanchor = 'center',
        yanchor = 'top'
      )
    )
  )

fig
