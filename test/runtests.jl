module UnstructuredGridsTests

using Test

@testset "UnstructuredGrids.jl" begin

  @testset "Kernels" begin include("KernelsTests.jl") end
  @testset "Factories" begin include("FactoriesTests.jl") end
  #@testset "Core" begin include("CoreTests.jl") end
  @testset "CoreNew" begin include("CoreNewTests.jl") end
  @testset "VTK" begin include("VTKTests.jl") end

end

end #module UnstructuredGridsTests
