echo "1) KERNEL SHD_3_VAR"
echo "========================================================"
grep kernel_fmax shd_3_var/quartus_sh_compile.log
head -n 63 shd_3_var/top.flow.rpt | tail -n 25

echo "2) KERNEL SHD_3_100_100"
echo "========================================================"
grep kernel_fmax shd_3_100_100/quartus_sh_compile.log
head -n 63 shd_3_100_100/top.flow.rpt | tail -n 25

echo "3) KERNEL KMERS_VAR"
echo "========================================================"
grep kernel_fmax kmers_var/quartus_sh_compile.log
head -n 63 kmers_var/top.flow.rpt | tail -n 25

echo "4) KERNEL KMERS_100_100"
echo "========================================================"
grep kernel_fmax kmers_100_100/quartus_sh_compile.log
head -n 63 kmers_100_100/top.flow.rpt | tail -n 25

echo "5) KERNEL SHOUJI_3_VAR"
echo "========================================================"
grep kernel_fmax shouji_3_var/quartus_sh_compile.log
head -n 63 shouji_3_var/top.flow.rpt | tail -n 25

echo "6) KERNEL SHOUJI_3_100_100"
echo "========================================================"
grep kernel_fmax shouji_3_100_100/quartus_sh_compile.log
head -n 63 shouji_3_100_100/top.flow.rpt | tail -n 25

echo "7) KERNEL SNEAKY_3_VAR"
echo "========================================================"
grep kernel_fmax sneaky_3_var/quartus_sh_compile.log
head -n 63 sneaky_3_var/top.flow.rpt | tail -n 25

