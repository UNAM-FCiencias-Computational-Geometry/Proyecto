# -*- coding: utf-8 -*-


#
# Author: José Emiliano Cabrera Blancas (jemiliano.cabrera@gmail.com)
#

# Public: Inicializa la ventana y variables de processing
#
require File.expand_path(File.join(File.dirname(__FILE__), "../shared_libraries/algorithms"))

def setup
  background 255, 255, 255
  size(400, 400,P2D)

  # Genera un conjunto random de puntos dentro de la caja.

  rand_size = 7
  random_vertex = []

  rand_size.times.each do
    random_vertex << [rand(width).to_f, rand(height).to_f]
  end

  puts "Puntos"
  p random_vertex
  puts ""

  points = random_vertex.map do
    |x|
    Points.init_point(x[0], x[1], "")
  end


  list = List.init_double_linked_list(:point)

  points.each do
    |point|
    List.push_back(list, point)
  end

  voronoi = Algorithms.process_incremental(width, height, list)

  Algorithms.process_delauney(voronoi)

  read

  @index = -1

  @up = false

end

def draw
  if key_pressed?

    if @up

      if (key == "\n" or key == "\b")

        @index += 1 if (key == "\n" and (@index + 1) < @voronoi.size)

        @index -= 1  if (key == "\b" and @index >= 1)


        translate(0, height)
        draw_voronoi
      end

      if (key == " ")
        translate(0, height)
        draw_delauney
      end

      @up = false
    else
      @up = true
    end
  end
end

# Public: Metodo que dibuja las aristas y los vertices guardados en la estructura
#         que usaron en read
#
# Este metodo lo debes de modificar para que dibuje los puntos y aristas
def draw_voronoi
end

# Public: Metodo que dibuja las aristas y los vertices guardados en la estructura
#         que usaron en read
#
# Este metodo lo debes de modificar para que dibuje los puntos y aristas
def draw_delauney
end

# Public: Metodo que lee el archivo salida.txt y la guarda en una variable
#         de instancia. (Les recomiendo usar las clases Array y Hash.)
#
def read
end
