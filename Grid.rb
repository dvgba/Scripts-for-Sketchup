# Carrega o Modulo do Sketchup
require 'sketchup.rb'

# Inicia o Modelo
model = Sketchup.active_model

# Seta a dimensão do grid
grid_size = 5.m

# Seta a quantidade de colunas e linhas
num_rows = 5
num_cols = 5

# Cria um grupo para o grid criado
group = model.entities.add_group

# Adiciona o grid ao grupo
(num_rows+1).times do |row|
  start_point = Geom::Point3d.new(0, row*grid_size, 0)
  end_point = Geom::Point3d.new(num_cols*grid_size, row*grid_size, 0)
  line = group.entities.add_line(start_point, end_point)
end
(num_cols+1).times do |col|
  start_point = Geom::Point3d.new(col*grid_size, 0, 0)
  end_point = Geom::Point3d.new(col*grid_size, num_rows*grid_size, 0)
  line = group.entities.add_line(start_point, end_point)
end

# Salva o Modelo
model.save('grid.skp')