
import Makie:Theme

# Makie theme for reports
report_theme = Theme(;
                     figure_padding=30,
                     font="Linux Libertine",
                     fontsize=24,
                     Lines=(linewidth = 3,),
                     Axis = (
        ygridvisible = true,  
                          xgridvisible = true,
        xautolimitmargin=(0,0), 
    ),
                    )


# Makie theme for paper
paper_theme = Theme(;
                     figure_padding=30,
                     font="Linux Libertine",
                     fontsize=38,
                     Lines=(linewidth = 3,),
                     Axis=(ygridvisible = false,  
                          xgridvisible = false,),
                    )



import Makie
palette = Makie.default_palettes.color[]
