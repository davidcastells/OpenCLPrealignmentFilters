echo "1) KERNEL SHD_3_VAR"
echo "========================================================"
grep "Kernel fmax"  shd_3_var/acl_quartus_report.txt
head -n 61 shd_3_var/top.flow.rpt | tail -n 22

echo "2) KERNEL SHD_3_100_100"
echo "========================================================"
grep "Kernel fmax" shd_3_100_100/acl_quartus_report.txt
head -n 61 shd_3_100_100/top.flow.rpt | tail -n 22

echo "3) KERNEL KMERS_VAR"
echo "========================================================"
grep "Kernel fmax"  kmers_var/acl_quartus_report.txt
head -n 61 kmers_var/top.flow.rpt | tail -n 22

echo "4) KERNEL KMERS_100_100"
echo "========================================================"
grep "Kernel fmax"  kmers_100_100/acl_quartus_report.txt
head -n 61 kmers_100_100/top.flow.rpt | tail -n 22

echo "5) KERNEL SHOUJI_3_VAR"
echo "========================================================"
grep "Kernel fmax"  shouji_3_var/acl_quartus_report.txt
head -n 61 shouji_3_var/top.flow.rpt | tail -n 22

echo "6) KERNEL SHOUJI_3_100_100"
echo "========================================================"
grep "Kernel fmax" shouji_3_100_100/acl_quartus_report.txt
head -n 61 shouji_3_100_100/top.flow.rpt | tail -n 22

echo "7) KERNEL SNEAKY_3_VAR"
echo "========================================================"
grep "Kernel fmax"  sneaky_3_var/acl_quartus_report.txt
head -n 61 sneaky_3_var/top.flow.rpt | tail -n 22

echo "8) KERNEL SNEAKY_3_100_100"
echo "========================================================"
grep "Kernel fmax" sneaky_3_100_100/acl_quartus_report.txt
head -n 61 sneaky_3_100_100/top.flow.rpt | tail -n 22
