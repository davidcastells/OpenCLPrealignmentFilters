echo "1) KERNEL SHD_3_VAR"
echo "========================================================"
grep kernel_fmax shd_3_var/quartus_sh_compile.log
head -n 68 shd_3_var/top.flow.rpt | tail -n 30

echo "2) KERNEL SHD_3_100_100"
echo "========================================================"
grep kernel_fmax shd_3_100_100/quartus_sh_compile.log
head -n 68 shd_3_100_100/top.flow.rpt | tail -n 30

echo "3) KERNEL KMERS_VAR"
echo "========================================================"
grep kernel_fmax kmers_var/quartus_sh_compile.log
head -n 68 kmers_var/top.flow.rpt | tail -n 30

echo "4) KERNEL KMERS_100_100"
echo "========================================================"
grep kernel_fmax kmers_100_100/quartus_sh_compile.log
head -n 68 kmers_100_100/top.flow.rpt | tail -n 30
