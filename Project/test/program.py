program=open("Program.txt","rU")

lines=program.readlines()
pgm=[]
#print lines

code=[]
tags={}
for i in range(len(lines)):
    if(lines[i].strip('\n')!=''):
        pgm.append(lines[i].strip('\n'))

for i in range(len(pgm)):
    pgm[i]=pgm[i].strip(';')

pc=0
for i in range(len(pgm)):
    if(pgm[i].find(':')==-1):
        pc=pc+1
        code.append(pgm[i])
    else:
        tags[pgm[i].strip(':')]=pc

ans=''
ALU3in={
'ADD':'00001',
'SUB':'00010',
'MUL':'00011',
'MOD':'01001',
'AND':'01010',
'OR':'01011',
'XOR':'01100',
}
ALU1in={
'INC':'00101',
'DEC':'00110',
'LSL':'00111',
'RSL':'01000',
}
jumps={
'BEQ':'000',
'BLT':'001',
'BG':'00000',
'BNC':'10000',
'BZ':'00100',
}
ans=""
i=0
for line in code:
    instr=''
    vals=line.split(' ')
    func=vals[0]
    args=vals[1].split(',')
    if(func=='LDI'):
        instr=instr+"17'b01110"
        instr=instr+('{0:04b}'.format(int(args[0].strip('R'))))
        instr=instr+('{0:08b}'.format(int(args[1].strip('#'))))
    elif(func=='MOV'):
        instr=instr+"17'b10000"
        instr=instr+('{0:04b}'.format(int(args[0].strip('R'))))
        instr=instr+('{0:04b}'.format(int(args[1].strip('R').strip(';'))))
        instr=instr+"x"*4
    elif(ALU3in.has_key(func)):
        instr=instr+"17'b"+ALU3in[func]
        instr=instr+('{0:04b}'.format(int(args[0].strip('R'))))
        instr=instr+('{0:04b}'.format(int(args[1].strip('R'))))
        instr=instr+('{0:04b}'.format(int(args[2].strip('R').strip(';'))))
    elif(ALU1in.has_key(func)):
        instr=instr+"17'b"+ALU1in[func]
        instr=instr+('{0:04b}'.format(int(args[0].strip('R'))))
        instr=instr+'x'*8
    elif(func=="CMP"):
        instr=instr+"17'b00100"
        instr=instr+('{0:04b}'.format(int(args[0].strip('R'))))
        instr=instr+('{0:04b}'.format(int(args[1].strip('R'))))
        instr=instr+"x"*4
    elif(func=="STR"):
        instr=instr+"17'b01111"
        instr=instr+('{0:04b}'.format(int(args[0].strip('R'))))
        instr=instr+('{0:08b}'.format(int(args[1].strip('#').strip(';'))))
    elif(func=='LDIN'):
        instr=instr+"17'b01110"
        instr=instr+('{0:04b}'.format(int(args[0].strip('R'))))
        instr=instr+('{0:08b}'.format(int(args[1].strip('#').strip(';'))))
    elif(jumps.has_key(func)):
        instr=instr+"17'b11111"
        instr=instr+jumps[func]
        instr=instr+('{0:05b}'.format(int(tags[args[0].strip(";")])))
        #print '{0:05b}'.format(int(tags[args[0].strip(";")]))
        instr=instr+"x"*4
    instr="`WR("+str(i)+","+instr+");"
    ans+=instr
    i+=1
f2=open("def.v","w")
f2.write('`define init '+ans+'\n')
#f2.write('`define prgsize '+'{0:05b}'.format(len(code)))
print '`define init `'+ans
#print '`define prgsize '+'{0:05b}'.format(len(code))
