
O
Command: %s
53*	vivadotcl2

opt_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-349h px� 
�
�The version limit for your license is '%s' and will expire in %s days. A version limit expiration means that, although you may be able to continue to use the current version of tools or IP with this license, you will not be eligible for any updates or new releases.
519*common2
2019.082default:default2
-1152default:defaultZ17-1223h px� 
n
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_design2default:defaultZ4-22h px� 
R

Starting %s Task
103*constraints2
DRC2default:defaultZ18-103h px� 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px� 
U
DRC finished with %s
272*project2
0 Errors2default:defaultZ1-461h px� 
d
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.12 ; elapsed = 00:00:00.16 . Memory (MB): peak = 1217.988 ; gain = 37.016 ; free physical = 7676 ; free virtual = 404152default:defaulth px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
a

Starting %s Task
103*constraints2&
Logic Optimization2default:defaultZ18-103h px� 
A
,Implement Debug Cores | Checksum: 1be2df187
*commonh px� 
i

Phase %s%s
101*constraints2
1 2default:default2
Retarget2default:defaultZ18-101h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
K
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49h px� 
<
'Phase 1 Retarget | Checksum: 1898605d6
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.21 ; elapsed = 00:00:00.20 . Memory (MB): peak = 1616.480 ; gain = 0.000 ; free physical = 7326 ; free virtual = 400992default:defaulth px� 
u

Phase %s%s
101*constraints2
2 2default:default2(
Constant Propagation2default:defaultZ18-101h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
J
Eliminated %s cells.
10*opt2
472default:defaultZ31-10h px� 
G
2Phase 2 Constant Propagation | Checksum: c5aa0d54
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.66 ; elapsed = 00:00:00.64 . Memory (MB): peak = 1616.480 ; gain = 0.000 ; free physical = 7325 ; free virtual = 400982default:defaulth px� 
f

Phase %s%s
101*constraints2
3 2default:default2
Sweep2default:defaultZ18-101h px� 
V
 Eliminated %s unconnected nets.
12*opt2
2242default:defaultZ31-12h px� 
W
!Eliminated %s unconnected cells.
11*opt2
2732default:defaultZ31-11h px� 
8
#Phase 3 Sweep | Checksum: fe5d34d6
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:01 ; elapsed = 00:00:01 . Memory (MB): peak = 1616.480 ; gain = 0.000 ; free physical = 7325 ; free virtual = 400982default:defaulth px� 
a

Starting %s Task
103*constraints2&
Connectivity Check2default:defaultZ18-103h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 1616.480 ; gain = 0.000 ; free physical = 7325 ; free virtual = 400982default:defaulth px� 
I
4Ending Logic Optimization Task | Checksum: fe5d34d6
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:01 ; elapsed = 00:00:01 . Memory (MB): peak = 1616.480 ; gain = 0.000 ; free physical = 7325 ; free virtual = 400982default:defaulth px� 
a

Starting %s Task
103*constraints2&
Power Optimization2default:defaultZ18-103h px� 
s
7Will skip clock gating for clocks with period < %s ns.
114*pwropt2
2.002default:defaultZ34-132h px� 
I
4Ending Power Optimization Task | Checksum: fe5d34d6
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.01 ; elapsed = 00:00:00.03 . Memory (MB): peak = 1616.480 ; gain = 0.000 ; free physical = 7324 ; free virtual = 400982default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
212default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px� 
\
%s completed successfully
29*	vivadotcl2

opt_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2 
opt_design: 2default:default2
00:00:152default:default2
00:00:162default:default2
1616.4802default:default2
443.5122default:default2
73242default:default2
400982default:defaultZ17-722h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:00.152default:default2
00:00:00.052default:default2
1648.4962default:default2
0.0002default:default2
73202default:default2
400962default:defaultZ17-722h px� 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
168*coretcl2�
x/home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.runs/impl_1/Exercise01b_wrapper_drc_opted.rptx/home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.runs/impl_1/Exercise01b_wrapper_drc_opted.rpt2default:default8Z2-168h px� 


End Record