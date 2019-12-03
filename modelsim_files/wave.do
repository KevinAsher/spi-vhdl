onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_spi_master_top/u_spi_master_top/i_CLK
add wave -noupdate /tb_spi_master_top/u_spi_master_top/o_CLK
add wave -noupdate /tb_spi_master_top/w_MISO
add wave -noupdate -format Literal /tb_spi_master_top/w_MOSI
add wave -noupdate /tb_spi_master_top/w_RST
add wave -noupdate /tb_spi_master_top/w_SS
add wave -noupdate /tb_spi_master_top/w_START
add wave -noupdate /tb_spi_master_top/u_spi_master_top/u_SPI_MASTER_CONTROL/w_ESTADO_ATUAL
add wave -noupdate /tb_spi_master_top/u_spi_master_top/u_SPI_MASTER_DATAPATH/u_register_16_bits_in_8_bits_out/o_Read_DATA
add wave -noupdate /tb_spi_master_top/u_spi_master_top/u_SPI_MASTER_DATAPATH/u_mux/o_Data
add wave -noupdate /tb_spi_master_top/u_spi_master_top/u_SPI_MASTER_DATAPATH/u_mux/i_Data
add wave -noupdate /tb_spi_master_top/u_spi_master_top/u_SPI_MASTER_DATAPATH/u_mux/i_Sel
add wave -noupdate /tb_spi_master_top/u_spi_master_top/u_SPI_MASTER_DATAPATH/u_mux/i_par
add wave -noupdate /tb_spi_master_top/u_spi_master_top/u_SPI_MASTER_DATAPATH/u_adder/i_Increment
add wave -noupdate /tb_spi_master_top/u_spi_master_top/u_SPI_MASTER_DATAPATH/u_adder/i_Reset
add wave -noupdate /tb_spi_master_top/u_spi_master_top/u_SPI_MASTER_DATAPATH/u_adder/o_Contador
add wave -noupdate /tb_spi_master_top/u_spi_master_top/u_SPI_MASTER_DATAPATH/u_adder/o_Sinalizador
add wave -noupdate /tb_spi_master_top/u_spi_master_top/u_SPI_MASTER_DATAPATH/u_adder/r_COUNT
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {101483461 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 95
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits sec
update
WaveRestoreZoom {0 ps} {315 us}
