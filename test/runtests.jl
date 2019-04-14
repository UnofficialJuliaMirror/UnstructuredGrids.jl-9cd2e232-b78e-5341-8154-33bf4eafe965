module UnstructuredGridsTests

using UnstructuredGrids
using Test

@testset "UnstructuredGrids.jl" begin

  a = [9,2,1,2,4,7,4]
  b = [1,9,2,1,2,4,7]

  rewind_ptrs!(a)
  @test a == b

  a = [3,2,4,2]
  b = [1,3,7,9]

  length_to_ptrs!(a)
  @test a == b

  include("Mock2D.jl")

  _vertex_to_cells_data, _vertex_to_cells_ptrs = face_to_cells(
    cell_to_vertices_data,cell_to_vertices_ptrs)

  @test _vertex_to_cells_data == vertex_to_cells_data
  @test _vertex_to_cells_ptrs == vertex_to_cells_ptrs

  _cell_to_faces_data, _cell_to_faces_ptrs = cell_to_faces(
    cell_to_vertices_data,
    cell_to_vertices_ptrs,
    ctype_to_lface_to_lvertices_data,
    ctype_to_lface_to_lvertices_ptrs,
    cell_to_ctype,
    vertex_to_cells_data,
    vertex_to_cells_ptrs)

  @test cell_to_faces_data == _cell_to_faces_data
  @test cell_to_faces_ptrs == _cell_to_faces_ptrs

end

end #module UnstructuredGridsTests
