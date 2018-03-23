 #! /bin/bash
 gnuplot -persist <<"EOF"

 set xtics nomirror
 set ytics nomirror
 
 set key right top

 set style line 1 lc rgb 'green' pt 7 ps 0.5 pi -1
 set style line 2 lc rgb 'red' pt 7 ps 0.5 pi -1
 set style line 3 lc rgb 'blue' pt 7 ps 0.5 pi -1
 set pointintervalbox 100

 show timestamp
 set xlabel "time (seconds)"
 set ylabel "Segments (cwnd, ssthresh)"
 
 plot "/tmp/tcpprobe.out" using 1:7 title "snd cwnd" with points ls 1,\
      "/tmp/tcpprobe.out" using 1:($8>=2147483647 ? 0 : $8) title "snd ssthresh" with points ls 2,\
      "/tmp/tcpprobe.out" using 1:12 title "ca state" with points ls 3
