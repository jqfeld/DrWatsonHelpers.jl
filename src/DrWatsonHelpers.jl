module DrWatsonHelpers

include("session.jl")
export current_session, start_session, makeplot

include("themes.jl")
export report_theme, paper_theme, palette

end # module
