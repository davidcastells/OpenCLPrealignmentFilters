echo "1) KERNEL SHD_3"
echo "========================================================"
grep kernel_fmax shd_3/quartus_sh_compile.log
head -n 68 shd_3/top.flow.rpt | tail -n 30

echo "2) KERNEL KMERS"
echo "========================================================"
grep kernel_fmax kmers/quartus_sh_compile.log
head -n 68 kmers/top.flow.rpt | tail -n 30
