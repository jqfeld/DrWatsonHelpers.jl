
using DrWatson
using Makie


struct WatsonSession
    name
end

const _current_session = Ref{Union{Nothing,WatsonSession}}(nothing)
current_session() = _current_session[]
current_session!(session::WatsonSession) = ( _current_session[] = session )
start_session(name::AbstractString) = current_session!(WatsonSession(name))

session_name(session) = session.name

function makeplot(name, fig; ending=".pdf")
    wsave(plotsdir(session_name(current_session()), name * ending), fig)
end

makeplot(name) = makeplot(name, current_figure())

