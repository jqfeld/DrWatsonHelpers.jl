module DrWatsonHelpers

export msave, make_metadata

import DrWatson: projectname, gitdescribe, wsave
import Dates: today
default_metadata() = Dict(
    :project => projectname(),
    :gitcommit => gitdescribe(),
    :date => today()
)
function make_metadata(_::Any)
    Dict{Symbol,Any}()
    # default_metadata()
end

import DifferentialEquations: ODESolution

function make_metadata(sol::ODESolution)
    # metadata = default_metadata()
    metadata = Dict(
            :initial_values => Dict( sol.prob.f.syms .=> sol.prob.u0),
            :parameters => Dict(sol.prob.f.paramsyms .=> sol.prob.p),
        )
    return metadata
end

function make_metadata(dict::Dict)
    ks = keys(dict)
    vs = values(dict)
    metadata = Dict(ks .=> make_metadata.(vs))
end

import DrWatson: wsave
import YAML
function msave(path, obj; metadata=nothing )
    metadata = metadata === nothing ? default_metadata() : merge(metadata, default_metadata())
    # merge!(metadata, make_metadata(obj))
    wsave(path, obj)
    YAML.write_file(path * ".yml", metadata)
end

end # module
