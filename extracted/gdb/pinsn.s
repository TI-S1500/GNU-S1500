#NO_APP
	.file	"pinsn.c"
.globl _m68k_opcodes
.text
LC0:
	.ascii "abcd\0"
LC1:
	.ascii "DsDd\0"
LC2:
	.ascii "-s-d\0"
LC3:
	.ascii "addal\0"
LC4:
	.ascii "*lAd\0"
LC5:
	.ascii "addaw\0"
LC6:
	.ascii "*wAd\0"
LC7:
	.ascii "addib\0"
LC8:
	.ascii "#b$b\0"
LC9:
	.ascii "addil\0"
LC10:
	.ascii "#l$l\0"
LC11:
	.ascii "addiw\0"
LC12:
	.ascii "#w$w\0"
LC13:
	.ascii "addqb\0"
LC14:
	.ascii "Qd$b\0"
LC15:
	.ascii "addql\0"
LC16:
	.ascii "Qd%l\0"
LC17:
	.ascii "addqw\0"
LC18:
	.ascii "Qd%w\0"
LC19:
	.ascii "addb\0"
LC20:
	.ascii ";bDd\0"
LC21:
	.ascii "Dd~b\0"
LC22:
	.ascii "addw\0"
LC23:
	.ascii "*wDd\0"
LC24:
	.ascii "Dd~w\0"
LC25:
	.ascii "addl\0"
LC26:
	.ascii "*lDd\0"
LC27:
	.ascii "Dd~l\0"
LC28:
	.ascii "addxb\0"
LC29:
	.ascii "addxl\0"
LC30:
	.ascii "addxw\0"
LC31:
	.ascii "andib\0"
LC32:
	.ascii "#bCb\0"
LC33:
	.ascii "andiw\0"
LC34:
	.ascii "#wSw\0"
LC35:
	.ascii "andil\0"
LC36:
	.ascii "andb\0"
LC37:
	.ascii "andw\0"
LC38:
	.ascii ";wDd\0"
LC39:
	.ascii "andl\0"
LC40:
	.ascii ";lDd\0"
LC41:
	.ascii "aslb\0"
LC42:
	.ascii "QdDs\0"
LC43:
	.ascii "DdDs\0"
LC44:
	.ascii "asll\0"
LC45:
	.ascii "aslw\0"
LC46:
	.ascii "~s\0"
LC47:
	.ascii "asrb\0"
LC48:
	.ascii "asrl\0"
LC49:
	.ascii "asrw\0"
LC50:
	.ascii "bhi\0"
LC51:
	.ascii "Bg\0"
LC52:
	.ascii "bls\0"
LC53:
	.ascii "bcc\0"
LC54:
	.ascii "bcs\0"
LC55:
	.ascii "bne\0"
LC56:
	.ascii "beq\0"
LC57:
	.ascii "bvc\0"
LC58:
	.ascii "bvs\0"
LC59:
	.ascii "bpl\0"
LC60:
	.ascii "bmi\0"
LC61:
	.ascii "bge\0"
LC62:
	.ascii "blt\0"
LC63:
	.ascii "bgt\0"
LC64:
	.ascii "ble\0"
LC65:
	.ascii "bchg\0"
LC66:
	.ascii "Dd$s\0"
LC67:
	.ascii "#b$s\0"
LC68:
	.ascii "bclr\0"
LC69:
	.ascii "bfchg\0"
LC70:
	.ascii "?sO2O3\0"
LC71:
	.ascii "bfclr\0"
LC72:
	.ascii "bfexts\0"
LC73:
	.ascii "/sO2O3D1\0"
LC74:
	.ascii "bfextu\0"
LC75:
	.ascii "bfffo\0"
LC76:
	.ascii "bfins\0"
LC77:
	.ascii "D1?sO2O3\0"
LC78:
	.ascii "bfset\0"
LC79:
	.ascii "bftst\0"
LC80:
	.ascii "/sO2O3\0"
LC81:
	.ascii "bset\0"
LC82:
	.ascii "btst\0"
LC83:
	.ascii "Dd@s\0"
LC84:
	.ascii "#b@s\0"
LC85:
	.ascii "bkpt\0"
LC86:
	.ascii "Qs\0"
LC87:
	.ascii "bra\0"
LC88:
	.ascii "bsr\0"
LC89:
	.ascii "callm\0"
LC90:
	.ascii "#b!s\0"
LC91:
	.ascii "cas2l\0"
LC92:
	.ascii "D3D6D2D5R1R4\0"
LC93:
	.ascii "cas2w\0"
LC94:
	.ascii "casb\0"
LC95:
	.ascii "D3D2~s\0"
LC96:
	.ascii "casl\0"
LC97:
	.ascii "casw\0"
LC98:
	.ascii "chk2b\0"
LC99:
	.ascii "!sR1\0"
LC100:
	.ascii "chk2l\0"
LC101:
	.ascii "chk2w\0"
LC102:
	.ascii "chkl\0"
LC103:
	.ascii "chkw\0"
LC104:
	.ascii "clrb\0"
LC105:
	.ascii "$s\0"
LC106:
	.ascii "clrl\0"
LC107:
	.ascii "clrw\0"
LC108:
	.ascii "cmp2b\0"
LC109:
	.ascii "cmp2l\0"
LC110:
	.ascii "cmp2w\0"
LC111:
	.ascii "cmpal\0"
LC112:
	.ascii "cmpaw\0"
LC113:
	.ascii "cmpib\0"
LC114:
	.ascii "#b;b\0"
LC115:
	.ascii "cmpil\0"
LC116:
	.ascii "#l;l\0"
LC117:
	.ascii "cmpiw\0"
LC118:
	.ascii "#w;w\0"
LC119:
	.ascii "cmpb\0"
LC120:
	.ascii "cmpw\0"
LC121:
	.ascii "cmpl\0"
LC122:
	.ascii "cmpmb\0"
LC123:
	.ascii "+s+d\0"
LC124:
	.ascii "cmpml\0"
LC125:
	.ascii "cmpmw\0"
LC126:
	.ascii "dbcc\0"
LC127:
	.ascii "DsBw\0"
LC128:
	.ascii "dbcs\0"
LC129:
	.ascii "dbeq\0"
LC130:
	.ascii "dbf\0"
LC131:
	.ascii "dbge\0"
LC132:
	.ascii "dbgt\0"
LC133:
	.ascii "dbhi\0"
LC134:
	.ascii "dble\0"
LC135:
	.ascii "dbls\0"
LC136:
	.ascii "dblt\0"
LC137:
	.ascii "dbmi\0"
LC138:
	.ascii "dbne\0"
LC139:
	.ascii "dbpl\0"
LC140:
	.ascii "dbra\0"
LC141:
	.ascii "dbt\0"
LC142:
	.ascii "dbvc\0"
LC143:
	.ascii "dbvs\0"
LC144:
	.ascii "divsl\0"
LC145:
	.ascii ";lD3D1\0"
LC146:
	.ascii ";lDD\0"
LC147:
	.ascii "divsll\0"
LC148:
	.ascii "divsw\0"
LC149:
	.ascii "divs\0"
LC150:
	.ascii "divul\0"
LC151:
	.ascii "divull\0"
LC152:
	.ascii "divuw\0"
LC153:
	.ascii "divu\0"
LC154:
	.ascii "eorb\0"
LC155:
	.ascii "#bCs\0"
LC156:
	.ascii "eorib\0"
LC157:
	.ascii "eoril\0"
LC158:
	.ascii "#l$s\0"
LC159:
	.ascii "eoriw\0"
LC160:
	.ascii "#w$s\0"
LC161:
	.ascii "#wSs\0"
LC162:
	.ascii "eorl\0"
LC163:
	.ascii "eorw\0"
LC164:
	.ascii "exg\0"
LC165:
	.ascii "AdAs\0"
LC166:
	.ascii "DdAs\0"
LC167:
	.ascii "AsDd\0"
LC168:
	.ascii "extw\0"
LC169:
	.ascii "Ds\0"
LC170:
	.ascii "extl\0"
LC171:
	.ascii "extbl\0"
LC172:
	.ascii "extb.l\0"
LC173:
	.ascii "illegal\0"
LC174:
	.ascii "\0"
LC175:
	.ascii "jmp\0"
LC176:
	.ascii "!s\0"
LC177:
	.ascii "jsr\0"
LC178:
	.ascii "lea\0"
LC179:
	.ascii "!sAd\0"
LC180:
	.ascii "linkw\0"
LC181:
	.ascii "As#w\0"
LC182:
	.ascii "linkl\0"
LC183:
	.ascii "As#l\0"
LC184:
	.ascii "link\0"
LC185:
	.ascii "lslb\0"
LC186:
	.ascii "lslw\0"
LC187:
	.ascii "lsll\0"
LC188:
	.ascii "lsrb\0"
LC189:
	.ascii "lsrl\0"
LC190:
	.ascii "lsrw\0"
LC191:
	.ascii "moveal\0"
LC192:
	.ascii "moveaw\0"
LC193:
	.ascii "moveb\0"
LC194:
	.ascii ";b$d\0"
LC195:
	.ascii "movec\0"
LC196:
	.ascii "R1Jj\0"
LC197:
	.ascii "R1#j\0"
LC198:
	.ascii "JjR1\0"
LC199:
	.ascii "#jR1\0"
LC200:
	.ascii "movel\0"
LC201:
	.ascii "*l$d\0"
LC202:
	.ascii "AsUd\0"
LC203:
	.ascii "UdAs\0"
LC204:
	.ascii "MsDd\0"
LC205:
	.ascii "moveml\0"
LC206:
	.ascii "#w&s\0"
LC207:
	.ascii "#w-s\0"
LC208:
	.ascii "!s#w\0"
LC209:
	.ascii "+s#w\0"
LC210:
	.ascii "movemw\0"
LC211:
	.ascii "movepl\0"
LC212:
	.ascii "dsDd\0"
LC213:
	.ascii "Ddds\0"
LC214:
	.ascii "movepw\0"
LC215:
	.ascii "moveq\0"
LC216:
	.ascii "movew\0"
LC217:
	.ascii "*w$d\0"
LC218:
	.ascii "Ss$s\0"
LC219:
	.ascii "Cs$s\0"
LC220:
	.ascii ";wCd\0"
LC221:
	.ascii ";wSd\0"
LC222:
	.ascii "movesb\0"
LC223:
	.ascii "~sR1\0"
LC224:
	.ascii "R1~s\0"
LC225:
	.ascii "movesl\0"
LC226:
	.ascii "movesw\0"
LC227:
	.ascii "mulsl\0"
LC228:
	.ascii ";lD1\0"
LC229:
	.ascii "mulsw\0"
LC230:
	.ascii "muls\0"
LC231:
	.ascii "mulul\0"
LC232:
	.ascii "muluw\0"
LC233:
	.ascii "mulu\0"
LC234:
	.ascii "nbcd\0"
LC235:
	.ascii "negb\0"
LC236:
	.ascii "negl\0"
LC237:
	.ascii "negw\0"
LC238:
	.ascii "negxb\0"
LC239:
	.ascii "negxl\0"
LC240:
	.ascii "negxw\0"
LC241:
	.ascii "nop\0"
LC242:
	.ascii "notb\0"
LC243:
	.ascii "notl\0"
LC244:
	.ascii "notw\0"
LC245:
	.ascii "orb\0"
LC246:
	.ascii "Dd~s\0"
LC247:
	.ascii "orib\0"
LC248:
	.ascii "oril\0"
LC249:
	.ascii "oriw\0"
LC250:
	.ascii "orl\0"
LC251:
	.ascii "orw\0"
LC252:
	.ascii "pack\0"
LC253:
	.ascii "DsDd#w\0"
LC254:
	.ascii "-s-d#w\0"
LC255:
	.ascii "pea\0"
LC256:
	.ascii "reset\0"
LC257:
	.ascii "rolb\0"
LC258:
	.ascii "roll\0"
LC259:
	.ascii "rolw\0"
LC260:
	.ascii "rorb\0"
LC261:
	.ascii "rorl\0"
LC262:
	.ascii "rorw\0"
LC263:
	.ascii "roxlb\0"
LC264:
	.ascii "roxll\0"
LC265:
	.ascii "roxlw\0"
LC266:
	.ascii "roxrb\0"
LC267:
	.ascii "roxrl\0"
LC268:
	.ascii "roxrw\0"
LC269:
	.ascii "rtd\0"
LC270:
	.ascii "#w\0"
LC271:
	.ascii "rte\0"
LC272:
	.ascii "rtm\0"
LC273:
	.ascii "Rs\0"
LC274:
	.ascii "rtr\0"
LC275:
	.ascii "rts\0"
LC276:
	.ascii "scc\0"
LC277:
	.ascii "scs\0"
LC278:
	.ascii "seq\0"
LC279:
	.ascii "sf\0"
LC280:
	.ascii "sge\0"
LC281:
	.ascii "sgt\0"
LC282:
	.ascii "shi\0"
LC283:
	.ascii "sle\0"
LC284:
	.ascii "sls\0"
LC285:
	.ascii "slt\0"
LC286:
	.ascii "smi\0"
LC287:
	.ascii "sne\0"
LC288:
	.ascii "spl\0"
LC289:
	.ascii "st\0"
LC290:
	.ascii "svc\0"
LC291:
	.ascii "svs\0"
LC292:
	.ascii "sbcd\0"
LC293:
	.ascii "stop\0"
LC294:
	.ascii "subal\0"
LC295:
	.ascii "subaw\0"
LC296:
	.ascii "subb\0"
LC297:
	.ascii "Qd%s\0"
LC298:
	.ascii "subib\0"
LC299:
	.ascii "subil\0"
LC300:
	.ascii "subiw\0"
LC301:
	.ascii "subl\0"
LC302:
	.ascii "subqb\0"
LC303:
	.ascii "subql\0"
LC304:
	.ascii "subqw\0"
LC305:
	.ascii "subw\0"
LC306:
	.ascii "subxb\0"
LC307:
	.ascii "subxl\0"
LC308:
	.ascii "subxw\0"
LC309:
	.ascii "swap\0"
LC310:
	.ascii "tas\0"
LC311:
	.ascii "trap\0"
LC312:
	.ascii "Ts\0"
LC313:
	.ascii "trapcc\0"
LC314:
	.ascii "trapcs\0"
LC315:
	.ascii "trapeq\0"
LC316:
	.ascii "trapf\0"
LC317:
	.ascii "trapge\0"
LC318:
	.ascii "trapgt\0"
LC319:
	.ascii "traphi\0"
LC320:
	.ascii "traple\0"
LC321:
	.ascii "trapls\0"
LC322:
	.ascii "traplt\0"
LC323:
	.ascii "trapmi\0"
LC324:
	.ascii "trapne\0"
LC325:
	.ascii "trappl\0"
LC326:
	.ascii "trapt\0"
LC327:
	.ascii "trapvc\0"
LC328:
	.ascii "trapvs\0"
LC329:
	.ascii "trapcc.w\0"
LC330:
	.ascii "trapcs.w\0"
LC331:
	.ascii "trapeq.w\0"
LC332:
	.ascii "trapf.w\0"
LC333:
	.ascii "trapge.w\0"
LC334:
	.ascii "trapgt.w\0"
LC335:
	.ascii "traphi.w\0"
LC336:
	.ascii "traple.w\0"
LC337:
	.ascii "trapls.w\0"
LC338:
	.ascii "traplt.w\0"
LC339:
	.ascii "trapmi.w\0"
LC340:
	.ascii "trapne.w\0"
LC341:
	.ascii "trappl.w\0"
LC342:
	.ascii "trapt.w\0"
LC343:
	.ascii "trapvc.w\0"
LC344:
	.ascii "trapvs.w\0"
LC345:
	.ascii "trapcc.l\0"
LC346:
	.ascii "trapcs.l\0"
LC347:
	.ascii "trapeq.l\0"
LC348:
	.ascii "trapf.l\0"
LC349:
	.ascii "trapge.l\0"
LC350:
	.ascii "trapgt.l\0"
LC351:
	.ascii "traphi.l\0"
LC352:
	.ascii "traple.l\0"
LC353:
	.ascii "trapls.l\0"
LC354:
	.ascii "traplt.l\0"
LC355:
	.ascii "trapmi.l\0"
LC356:
	.ascii "trapne.l\0"
LC357:
	.ascii "trappl.l\0"
LC358:
	.ascii "trapt.l\0"
LC359:
	.ascii "trapvc.l\0"
LC360:
	.ascii "trapvs.l\0"
LC361:
	.ascii "trapv\0"
LC362:
	.ascii "tstb\0"
LC363:
	.ascii ";b\0"
LC364:
	.ascii "tstw\0"
LC365:
	.ascii "*w\0"
LC366:
	.ascii "tstl\0"
LC367:
	.ascii "*l\0"
LC368:
	.ascii "unlk\0"
LC369:
	.ascii "As\0"
LC370:
	.ascii "unpk\0"
LC371:
	.ascii "fabsb\0"
LC372:
	.ascii "Ii;bF7\0"
LC373:
	.ascii "fabsd\0"
LC374:
	.ascii "Ii;FF7\0"
LC375:
	.ascii "fabsl\0"
LC376:
	.ascii "Ii;lF7\0"
LC377:
	.ascii "fabsp\0"
LC378:
	.ascii "Ii;pF7\0"
LC379:
	.ascii "fabss\0"
LC380:
	.ascii "Ii;fF7\0"
LC381:
	.ascii "fabsw\0"
LC382:
	.ascii "Ii;wF7\0"
LC383:
	.ascii "fabsx\0"
LC384:
	.ascii "IiF8F7\0"
LC385:
	.ascii "Ii;xF7\0"
LC386:
	.ascii "IiFt\0"
LC387:
	.ascii "facosb\0"
LC388:
	.ascii "facosd\0"
LC389:
	.ascii "facosl\0"
LC390:
	.ascii "facosp\0"
LC391:
	.ascii "facoss\0"
LC392:
	.ascii "facosw\0"
LC393:
	.ascii "facosx\0"
LC394:
	.ascii "faddb\0"
LC395:
	.ascii "faddd\0"
LC396:
	.ascii "faddl\0"
LC397:
	.ascii "faddp\0"
LC398:
	.ascii "fadds\0"
LC399:
	.ascii "faddw\0"
LC400:
	.ascii "faddx\0"
LC401:
	.ascii "fasinb\0"
LC402:
	.ascii "fasind\0"
LC403:
	.ascii "fasinl\0"
LC404:
	.ascii "fasinp\0"
LC405:
	.ascii "fasins\0"
LC406:
	.ascii "fasinw\0"
LC407:
	.ascii "fasinx\0"
LC408:
	.ascii "fatanb\0"
LC409:
	.ascii "fatand\0"
LC410:
	.ascii "fatanl\0"
LC411:
	.ascii "fatanp\0"
LC412:
	.ascii "fatans\0"
LC413:
	.ascii "fatanw\0"
LC414:
	.ascii "fatanx\0"
LC415:
	.ascii "fatanhb\0"
LC416:
	.ascii "fatanhd\0"
LC417:
	.ascii "fatanhl\0"
LC418:
	.ascii "fatanhp\0"
LC419:
	.ascii "fatanhs\0"
LC420:
	.ascii "fatanhw\0"
LC421:
	.ascii "fatanhx\0"
LC422:
	.ascii "fbeq\0"
LC423:
	.ascii "IdBc\0"
LC424:
	.ascii "fbf\0"
LC425:
	.ascii "fbge\0"
LC426:
	.ascii "fbgl\0"
LC427:
	.ascii "fbgle\0"
LC428:
	.ascii "fbgt\0"
LC429:
	.ascii "fble\0"
LC430:
	.ascii "fblt\0"
LC431:
	.ascii "fbne\0"
LC432:
	.ascii "fbnge\0"
LC433:
	.ascii "fbngl\0"
LC434:
	.ascii "fbngle\0"
LC435:
	.ascii "fbngt\0"
LC436:
	.ascii "fbnle\0"
LC437:
	.ascii "fbnlt\0"
LC438:
	.ascii "fboge\0"
LC439:
	.ascii "fbogl\0"
LC440:
	.ascii "fbogt\0"
LC441:
	.ascii "fbole\0"
LC442:
	.ascii "fbolt\0"
LC443:
	.ascii "fbor\0"
LC444:
	.ascii "fbseq\0"
LC445:
	.ascii "fbsf\0"
LC446:
	.ascii "fbsne\0"
LC447:
	.ascii "fbst\0"
LC448:
	.ascii "fbt\0"
LC449:
	.ascii "fbueq\0"
LC450:
	.ascii "fbuge\0"
LC451:
	.ascii "fbugt\0"
LC452:
	.ascii "fbule\0"
LC453:
	.ascii "fbult\0"
LC454:
	.ascii "fbun\0"
LC455:
	.ascii "fcmpb\0"
LC456:
	.ascii "fcmpd\0"
LC457:
	.ascii "fcmpl\0"
LC458:
	.ascii "fcmpp\0"
LC459:
	.ascii "fcmps\0"
LC460:
	.ascii "fcmpw\0"
LC461:
	.ascii "fcmpx\0"
LC462:
	.ascii "fcosb\0"
LC463:
	.ascii "fcosd\0"
LC464:
	.ascii "fcosl\0"
LC465:
	.ascii "fcosp\0"
LC466:
	.ascii "fcoss\0"
LC467:
	.ascii "fcosw\0"
LC468:
	.ascii "fcosx\0"
LC469:
	.ascii "fcoshb\0"
LC470:
	.ascii "fcoshd\0"
LC471:
	.ascii "fcoshl\0"
LC472:
	.ascii "fcoshp\0"
LC473:
	.ascii "fcoshs\0"
LC474:
	.ascii "fcoshw\0"
LC475:
	.ascii "fcoshx\0"
LC476:
	.ascii "fdbeq\0"
LC477:
	.ascii "IiDsBw\0"
LC478:
	.ascii "fdbf\0"
LC479:
	.ascii "fdbge\0"
LC480:
	.ascii "fdbgl\0"
LC481:
	.ascii "fdbgle\0"
LC482:
	.ascii "fdbgt\0"
LC483:
	.ascii "fdble\0"
LC484:
	.ascii "fdblt\0"
LC485:
	.ascii "fdbne\0"
LC486:
	.ascii "fdbnge\0"
LC487:
	.ascii "fdbngl\0"
LC488:
	.ascii "fdbngle\0"
LC489:
	.ascii "fdbngt\0"
LC490:
	.ascii "fdbnle\0"
LC491:
	.ascii "fdbnlt\0"
LC492:
	.ascii "fdboge\0"
LC493:
	.ascii "fdbogl\0"
LC494:
	.ascii "fdbogt\0"
LC495:
	.ascii "fdbole\0"
LC496:
	.ascii "fdbolt\0"
LC497:
	.ascii "fdbor\0"
LC498:
	.ascii "fdbseq\0"
LC499:
	.ascii "fdbsf\0"
LC500:
	.ascii "fdbsne\0"
LC501:
	.ascii "fdbst\0"
LC502:
	.ascii "fdbt\0"
LC503:
	.ascii "fdbueq\0"
LC504:
	.ascii "fdbuge\0"
LC505:
	.ascii "fdbugt\0"
LC506:
	.ascii "fdbule\0"
LC507:
	.ascii "fdbult\0"
LC508:
	.ascii "fdbun\0"
LC509:
	.ascii "fdivb\0"
LC510:
	.ascii "fdivd\0"
LC511:
	.ascii "fdivl\0"
LC512:
	.ascii "fdivp\0"
LC513:
	.ascii "fdivs\0"
LC514:
	.ascii "fdivw\0"
LC515:
	.ascii "fdivx\0"
LC516:
	.ascii "fetoxb\0"
LC517:
	.ascii "fetoxd\0"
LC518:
	.ascii "fetoxl\0"
LC519:
	.ascii "fetoxp\0"
LC520:
	.ascii "fetoxs\0"
LC521:
	.ascii "fetoxw\0"
LC522:
	.ascii "fetoxx\0"
LC523:
	.ascii "fetoxm1b\0"
LC524:
	.ascii "fetoxm1d\0"
LC525:
	.ascii "fetoxm1l\0"
LC526:
	.ascii "fetoxm1p\0"
LC527:
	.ascii "fetoxm1s\0"
LC528:
	.ascii "fetoxm1w\0"
LC529:
	.ascii "fetoxm1x\0"
LC530:
	.ascii "fgetexpb\0"
LC531:
	.ascii "fgetexpd\0"
LC532:
	.ascii "fgetexpl\0"
LC533:
	.ascii "fgetexpp\0"
LC534:
	.ascii "fgetexps\0"
LC535:
	.ascii "fgetexpw\0"
LC536:
	.ascii "fgetexpx\0"
LC537:
	.ascii "fgetmanb\0"
LC538:
	.ascii "fgetmand\0"
LC539:
	.ascii "fgetmanl\0"
LC540:
	.ascii "fgetmanp\0"
LC541:
	.ascii "fgetmans\0"
LC542:
	.ascii "fgetmanw\0"
LC543:
	.ascii "fgetmanx\0"
LC544:
	.ascii "fintb\0"
LC545:
	.ascii "fintd\0"
LC546:
	.ascii "fintl\0"
LC547:
	.ascii "fintp\0"
LC548:
	.ascii "fints\0"
LC549:
	.ascii "fintw\0"
LC550:
	.ascii "fintx\0"
LC551:
	.ascii "fintrzb\0"
LC552:
	.ascii "fintrzd\0"
LC553:
	.ascii "fintrzl\0"
LC554:
	.ascii "fintrzp\0"
LC555:
	.ascii "fintrzs\0"
LC556:
	.ascii "fintrzw\0"
LC557:
	.ascii "fintrzx\0"
LC558:
	.ascii "flog10b\0"
LC559:
	.ascii "flog10d\0"
LC560:
	.ascii "flog10l\0"
LC561:
	.ascii "flog10p\0"
LC562:
	.ascii "flog10s\0"
LC563:
	.ascii "flog10w\0"
LC564:
	.ascii "flog10x\0"
LC565:
	.ascii "flog2b\0"
LC566:
	.ascii "flog2d\0"
LC567:
	.ascii "flog2l\0"
LC568:
	.ascii "flog2p\0"
LC569:
	.ascii "flog2s\0"
LC570:
	.ascii "flog2w\0"
LC571:
	.ascii "flog2x\0"
LC572:
	.ascii "flognb\0"
LC573:
	.ascii "flognd\0"
LC574:
	.ascii "flognl\0"
LC575:
	.ascii "flognp\0"
LC576:
	.ascii "flogns\0"
LC577:
	.ascii "flognw\0"
LC578:
	.ascii "flognx\0"
LC579:
	.ascii "flognp1b\0"
LC580:
	.ascii "flognp1d\0"
LC581:
	.ascii "flognp1l\0"
LC582:
	.ascii "flognp1p\0"
LC583:
	.ascii "flognp1s\0"
LC584:
	.ascii "flognp1w\0"
LC585:
	.ascii "flognp1x\0"
LC586:
	.ascii "fmodb\0"
LC587:
	.ascii "fmodd\0"
LC588:
	.ascii "fmodl\0"
LC589:
	.ascii "fmodp\0"
LC590:
	.ascii "fmods\0"
LC591:
	.ascii "fmodw\0"
LC592:
	.ascii "fmodx\0"
LC593:
	.ascii "fmoveb\0"
LC594:
	.ascii "IiF7@b\0"
LC595:
	.ascii "fmoved\0"
LC596:
	.ascii "IiF7@F\0"
LC597:
	.ascii "fmovel\0"
LC598:
	.ascii "IiF7@l\0"
LC599:
	.ascii "Iis8%l\0"
LC600:
	.ascii "Ii*ls8\0"
LC601:
	.ascii "fmovep\0"
LC602:
	.ascii "IiF7@pkC\0"
LC603:
	.ascii "IiF7@pDk\0"
LC604:
	.ascii "fmoves\0"
LC605:
	.ascii "IiF7@f\0"
LC606:
	.ascii "fmovew\0"
LC607:
	.ascii "IiF7@w\0"
LC608:
	.ascii "fmovex\0"
LC609:
	.ascii "IiF7@x\0"
LC610:
	.ascii "fmovecrx\0"
LC611:
	.ascii "Ii#CF7\0"
LC612:
	.ascii "fmovecr\0"
LC613:
	.ascii "fmovemx\0"
LC614:
	.ascii "Id#3-s\0"
LC615:
	.ascii "IiDk-s\0"
LC616:
	.ascii "Id#3&s\0"
LC617:
	.ascii "IiDk&s\0"
LC618:
	.ascii "Id+s#3\0"
LC619:
	.ascii "Ii+sDk\0"
LC620:
	.ascii "Id&s#3\0"
LC621:
	.ascii "Ii&sDk\0"
LC622:
	.ascii "fmoveml\0"
LC623:
	.ascii "Ii#8%s\0"
LC624:
	.ascii "Ii%s#8\0"
LC625:
	.ascii "fmulb\0"
LC626:
	.ascii "fmuld\0"
LC627:
	.ascii "fmull\0"
LC628:
	.ascii "fmulp\0"
LC629:
	.ascii "fmuls\0"
LC630:
	.ascii "fmulw\0"
LC631:
	.ascii "fmulx\0"
LC632:
	.ascii "fnegb\0"
LC633:
	.ascii "fnegd\0"
LC634:
	.ascii "fnegl\0"
LC635:
	.ascii "fnegp\0"
LC636:
	.ascii "fnegs\0"
LC637:
	.ascii "fnegw\0"
LC638:
	.ascii "fnegx\0"
LC639:
	.ascii "fnop\0"
LC640:
	.ascii "Ii\0"
LC641:
	.ascii "fremb\0"
LC642:
	.ascii "fremd\0"
LC643:
	.ascii "freml\0"
LC644:
	.ascii "fremp\0"
LC645:
	.ascii "frems\0"
LC646:
	.ascii "fremw\0"
LC647:
	.ascii "fremx\0"
LC648:
	.ascii "frestore\0"
LC649:
	.ascii "Id&s\0"
LC650:
	.ascii "Id+s\0"
LC651:
	.ascii "fsave\0"
LC652:
	.ascii "Id-s\0"
LC653:
	.ascii "fsincosb\0"
LC654:
	.ascii "Ii;bF7FC\0"
LC655:
	.ascii "fsincosd\0"
LC656:
	.ascii "Ii;FF7FC\0"
LC657:
	.ascii "fsincosl\0"
LC658:
	.ascii "Ii;lF7FC\0"
LC659:
	.ascii "fsincosp\0"
LC660:
	.ascii "Ii;pF7FC\0"
LC661:
	.ascii "fsincoss\0"
LC662:
	.ascii "Ii;fF7FC\0"
LC663:
	.ascii "fsincosw\0"
LC664:
	.ascii "Ii;wF7FC\0"
LC665:
	.ascii "fsincosx\0"
LC666:
	.ascii "IiF8F7FC\0"
LC667:
	.ascii "Ii;xF7FC\0"
LC668:
	.ascii "fscaleb\0"
LC669:
	.ascii "fscaled\0"
LC670:
	.ascii "fscalel\0"
LC671:
	.ascii "fscalep\0"
LC672:
	.ascii "fscales\0"
LC673:
	.ascii "fscalew\0"
LC674:
	.ascii "fscalex\0"
LC675:
	.ascii "fseq\0"
LC676:
	.ascii "Ii@s\0"
LC677:
	.ascii "fsf\0"
LC678:
	.ascii "fsge\0"
LC679:
	.ascii "fsgl\0"
LC680:
	.ascii "fsgle\0"
LC681:
	.ascii "fsgt\0"
LC682:
	.ascii "fsle\0"
LC683:
	.ascii "fslt\0"
LC684:
	.ascii "fsne\0"
LC685:
	.ascii "fsnge\0"
LC686:
	.ascii "fsngl\0"
LC687:
	.ascii "fsngle\0"
LC688:
	.ascii "fsngt\0"
LC689:
	.ascii "fsnle\0"
LC690:
	.ascii "fsnlt\0"
LC691:
	.ascii "fsoge\0"
LC692:
	.ascii "fsogl\0"
LC693:
	.ascii "fsogt\0"
LC694:
	.ascii "fsole\0"
LC695:
	.ascii "fsolt\0"
LC696:
	.ascii "fsor\0"
LC697:
	.ascii "fsseq\0"
LC698:
	.ascii "fssf\0"
LC699:
	.ascii "fssne\0"
LC700:
	.ascii "fsst\0"
LC701:
	.ascii "fst\0"
LC702:
	.ascii "fsueq\0"
LC703:
	.ascii "fsuge\0"
LC704:
	.ascii "fsugt\0"
LC705:
	.ascii "fsule\0"
LC706:
	.ascii "fsult\0"
LC707:
	.ascii "fsun\0"
LC708:
	.ascii "fsgldivb\0"
LC709:
	.ascii "fsgldivd\0"
LC710:
	.ascii "fsgldivl\0"
LC711:
	.ascii "fsgldivp\0"
LC712:
	.ascii "fsgldivs\0"
LC713:
	.ascii "fsgldivw\0"
LC714:
	.ascii "fsgldivx\0"
LC715:
	.ascii "fsglmulb\0"
LC716:
	.ascii "fsglmuld\0"
LC717:
	.ascii "fsglmull\0"
LC718:
	.ascii "fsglmulp\0"
LC719:
	.ascii "fsglmuls\0"
LC720:
	.ascii "fsglmulw\0"
LC721:
	.ascii "fsglmulx\0"
LC722:
	.ascii "fsinb\0"
LC723:
	.ascii "fsind\0"
LC724:
	.ascii "fsinl\0"
LC725:
	.ascii "fsinp\0"
LC726:
	.ascii "fsins\0"
LC727:
	.ascii "fsinw\0"
LC728:
	.ascii "fsinx\0"
LC729:
	.ascii "fsinhb\0"
LC730:
	.ascii "fsinhd\0"
LC731:
	.ascii "fsinhl\0"
LC732:
	.ascii "fsinhp\0"
LC733:
	.ascii "fsinhs\0"
LC734:
	.ascii "fsinhw\0"
LC735:
	.ascii "fsinhx\0"
LC736:
	.ascii "fsqrtb\0"
LC737:
	.ascii "fsqrtd\0"
LC738:
	.ascii "fsqrtl\0"
LC739:
	.ascii "fsqrtp\0"
LC740:
	.ascii "fsqrts\0"
LC741:
	.ascii "fsqrtw\0"
LC742:
	.ascii "fsqrtx\0"
LC743:
	.ascii "fsubb\0"
LC744:
	.ascii "fsubd\0"
LC745:
	.ascii "fsubl\0"
LC746:
	.ascii "fsubp\0"
LC747:
	.ascii "fsubs\0"
LC748:
	.ascii "fsubw\0"
LC749:
	.ascii "fsubx\0"
LC750:
	.ascii "ftanb\0"
LC751:
	.ascii "ftand\0"
LC752:
	.ascii "ftanl\0"
LC753:
	.ascii "ftanp\0"
LC754:
	.ascii "ftans\0"
LC755:
	.ascii "ftanw\0"
LC756:
	.ascii "ftanx\0"
LC757:
	.ascii "ftanhb\0"
LC758:
	.ascii "ftanhd\0"
LC759:
	.ascii "ftanhl\0"
LC760:
	.ascii "ftanhp\0"
LC761:
	.ascii "ftanhs\0"
LC762:
	.ascii "ftanhw\0"
LC763:
	.ascii "ftanhx\0"
LC764:
	.ascii "ftentoxb\0"
LC765:
	.ascii "ftentoxd\0"
LC766:
	.ascii "ftentoxl\0"
LC767:
	.ascii "ftentoxp\0"
LC768:
	.ascii "ftentoxs\0"
LC769:
	.ascii "ftentoxw\0"
LC770:
	.ascii "ftentoxx\0"
LC771:
	.ascii "ftrapeq\0"
LC772:
	.ascii "ftrapf\0"
LC773:
	.ascii "ftrapge\0"
LC774:
	.ascii "ftrapgl\0"
LC775:
	.ascii "ftrapgle\0"
LC776:
	.ascii "ftrapgt\0"
LC777:
	.ascii "ftraple\0"
LC778:
	.ascii "ftraplt\0"
LC779:
	.ascii "ftrapne\0"
LC780:
	.ascii "ftrapnge\0"
LC781:
	.ascii "ftrapngl\0"
LC782:
	.ascii "ftrapngle\0"
LC783:
	.ascii "ftrapngt\0"
LC784:
	.ascii "ftrapnle\0"
LC785:
	.ascii "ftrapnlt\0"
LC786:
	.ascii "ftrapoge\0"
LC787:
	.ascii "ftrapogl\0"
LC788:
	.ascii "ftrapogt\0"
LC789:
	.ascii "ftrapole\0"
LC790:
	.ascii "ftrapolt\0"
LC791:
	.ascii "ftrapor\0"
LC792:
	.ascii "ftrapseq\0"
LC793:
	.ascii "ftrapsf\0"
LC794:
	.ascii "ftrapsne\0"
LC795:
	.ascii "ftrapst\0"
LC796:
	.ascii "ftrapt\0"
LC797:
	.ascii "ftrapueq\0"
LC798:
	.ascii "ftrapuge\0"
LC799:
	.ascii "ftrapugt\0"
LC800:
	.ascii "ftrapule\0"
LC801:
	.ascii "ftrapult\0"
LC802:
	.ascii "ftrapun\0"
LC803:
	.ascii "ftrapeqw\0"
LC804:
	.ascii "Ii^w\0"
LC805:
	.ascii "ftrapfw\0"
LC806:
	.ascii "ftrapgew\0"
LC807:
	.ascii "ftrapglw\0"
LC808:
	.ascii "ftrapglew\0"
LC809:
	.ascii "ftrapgtw\0"
LC810:
	.ascii "ftraplew\0"
LC811:
	.ascii "ftrapltw\0"
LC812:
	.ascii "ftrapnew\0"
LC813:
	.ascii "ftrapngew\0"
LC814:
	.ascii "ftrapnglw\0"
LC815:
	.ascii "ftrapnglew\0"
LC816:
	.ascii "ftrapngtw\0"
LC817:
	.ascii "ftrapnlew\0"
LC818:
	.ascii "ftrapnltw\0"
LC819:
	.ascii "ftrapogew\0"
LC820:
	.ascii "ftrapoglw\0"
LC821:
	.ascii "ftrapogtw\0"
LC822:
	.ascii "ftrapolew\0"
LC823:
	.ascii "ftrapoltw\0"
LC824:
	.ascii "ftraporw\0"
LC825:
	.ascii "ftrapseqw\0"
LC826:
	.ascii "ftrapsfw\0"
LC827:
	.ascii "ftrapsnew\0"
LC828:
	.ascii "ftrapstw\0"
LC829:
	.ascii "ftraptw\0"
LC830:
	.ascii "ftrapueqw\0"
LC831:
	.ascii "ftrapugew\0"
LC832:
	.ascii "ftrapugtw\0"
LC833:
	.ascii "ftrapulew\0"
LC834:
	.ascii "ftrapultw\0"
LC835:
	.ascii "ftrapunw\0"
LC836:
	.ascii "ftrapeql\0"
LC837:
	.ascii "Ii^l\0"
LC838:
	.ascii "ftrapfl\0"
LC839:
	.ascii "ftrapgel\0"
LC840:
	.ascii "ftrapgll\0"
LC841:
	.ascii "ftrapglel\0"
LC842:
	.ascii "ftrapgtl\0"
LC843:
	.ascii "ftraplel\0"
LC844:
	.ascii "ftrapltl\0"
LC845:
	.ascii "ftrapnel\0"
LC846:
	.ascii "ftrapngel\0"
LC847:
	.ascii "ftrapngll\0"
LC848:
	.ascii "ftrapnglel\0"
LC849:
	.ascii "ftrapngtl\0"
LC850:
	.ascii "ftrapnlel\0"
LC851:
	.ascii "ftrapnltl\0"
LC852:
	.ascii "ftrapogel\0"
LC853:
	.ascii "ftrapogll\0"
LC854:
	.ascii "ftrapogtl\0"
LC855:
	.ascii "ftrapolel\0"
LC856:
	.ascii "ftrapoltl\0"
LC857:
	.ascii "ftraporl\0"
LC858:
	.ascii "ftrapseql\0"
LC859:
	.ascii "ftrapsfl\0"
LC860:
	.ascii "ftrapsnel\0"
LC861:
	.ascii "ftrapstl\0"
LC862:
	.ascii "ftraptl\0"
LC863:
	.ascii "ftrapueql\0"
LC864:
	.ascii "ftrapugel\0"
LC865:
	.ascii "ftrapugtl\0"
LC866:
	.ascii "ftrapulel\0"
LC867:
	.ascii "ftrapultl\0"
LC868:
	.ascii "ftrapunl\0"
LC869:
	.ascii "ftstb\0"
LC870:
	.ascii "Ii;b\0"
LC871:
	.ascii "ftstd\0"
LC872:
	.ascii "Ii;F\0"
LC873:
	.ascii "ftstl\0"
LC874:
	.ascii "Ii;l\0"
LC875:
	.ascii "ftstp\0"
LC876:
	.ascii "Ii;p\0"
LC877:
	.ascii "ftsts\0"
LC878:
	.ascii "Ii;f\0"
LC879:
	.ascii "ftstw\0"
LC880:
	.ascii "Ii;w\0"
LC881:
	.ascii "ftstx\0"
LC882:
	.ascii "IiF8\0"
LC883:
	.ascii "Ii;x\0"
LC884:
	.ascii "ftwotoxb\0"
LC885:
	.ascii "ftwotoxd\0"
LC886:
	.ascii "ftwotoxl\0"
LC887:
	.ascii "ftwotoxp\0"
LC888:
	.ascii "ftwotoxs\0"
LC889:
	.ascii "ftwotoxw\0"
LC890:
	.ascii "ftwotoxx\0"
LC891:
	.ascii "jbsr\0"
LC892:
	.ascii "jra\0"
LC893:
	.ascii "jhi\0"
LC894:
	.ascii "jls\0"
LC895:
	.ascii "jcc\0"
LC896:
	.ascii "jcs\0"
LC897:
	.ascii "jne\0"
LC898:
	.ascii "jeq\0"
LC899:
	.ascii "jvc\0"
LC900:
	.ascii "jvs\0"
LC901:
	.ascii "jpl\0"
LC902:
	.ascii "jmi\0"
LC903:
	.ascii "jge\0"
LC904:
	.ascii "jlt\0"
LC905:
	.ascii "jgt\0"
LC906:
	.ascii "jle\0"
LC907:
	.ascii "movql\0"
LC908:
	.ascii "moveql\0"
LC909:
	.ascii "moval\0"
LC910:
	.ascii "movaw\0"
LC911:
	.ascii "movb\0"
LC912:
	.ascii "movl\0"
LC913:
	.ascii "movml\0"
LC914:
	.ascii "movmw\0"
LC915:
	.ascii "movpl\0"
LC916:
	.ascii "movpw\0"
LC917:
	.ascii "movq\0"
LC918:
	.ascii "movw\0"
LC919:
	.ascii "movsb\0"
LC920:
	.ascii "movsl\0"
LC921:
	.ascii "movsw\0"
.data
	.even
_m68k_opcodes:
	.long LC0
	.long -1056964608
	.long -235405312
	.long LC1
	.long LC0
	.long -1056440320
	.long -235405312
	.long LC2
	.long LC3
	.long -775946240
	.long -239075328
	.long LC4
	.long LC5
	.long -792723456
	.long -239075328
	.long LC6
	.long LC7
	.long 100663296
	.long -4194304
	.long LC8
	.long LC9
	.long 109051904
	.long -4194304
	.long LC10
	.long LC11
	.long 104857600
	.long -4194304
	.long LC12
	.long LC13
	.long 1342177280
	.long -239075328
	.long LC14
	.long LC15
	.long 1350565888
	.long -239075328
	.long LC16
	.long LC17
	.long 1346371584
	.long -239075328
	.long LC18
	.long LC19
	.long 100663296
	.long -4194304
	.long LC8
	.long LC19
	.long 1342177280
	.long -239075328
	.long LC14
	.long LC19
	.long -805306368
	.long -239075328
	.long LC20
	.long LC19
	.long -788529152
	.long -239075328
	.long LC21
	.long LC22
	.long 104857600
	.long -4194304
	.long LC12
	.long LC22
	.long -792723456
	.long -239075328
	.long LC6
	.long LC22
	.long 1346371584
	.long -239075328
	.long LC18
	.long LC22
	.long -801112064
	.long -239075328
	.long LC23
	.long LC22
	.long -784334848
	.long -239075328
	.long LC24
	.long LC25
	.long 109051904
	.long -4194304
	.long LC10
	.long LC25
	.long -775946240
	.long -239075328
	.long LC4
	.long LC25
	.long 1350565888
	.long -239075328
	.long LC16
	.long LC25
	.long -796917760
	.long -239075328
	.long LC26
	.long LC25
	.long -780140544
	.long -239075328
	.long LC27
	.long LC28
	.long -788529152
	.long -235405312
	.long LC1
	.long LC28
	.long -788004864
	.long -235405312
	.long LC2
	.long LC29
	.long -780140544
	.long -235405312
	.long LC1
	.long LC29
	.long -779616256
	.long -235405312
	.long LC2
	.long LC30
	.long -784334848
	.long -235405312
	.long LC1
	.long LC30
	.long -783810560
	.long -235405312
	.long LC2
	.long LC31
	.long 33554432
	.long -4194304
	.long LC8
	.long LC31
	.long 37486592
	.long -65536
	.long LC32
	.long LC33
	.long 37748736
	.long -4194304
	.long LC12
	.long LC33
	.long 41680896
	.long -65536
	.long LC34
	.long LC35
	.long 41943040
	.long -4194304
	.long LC10
	.long LC36
	.long 33554432
	.long -4194304
	.long LC8
	.long LC36
	.long 37486592
	.long -65536
	.long LC32
	.long LC36
	.long -1073741824
	.long -239075328
	.long LC20
	.long LC36
	.long -1056964608
	.long -239075328
	.long LC21
	.long LC37
	.long 37748736
	.long -4194304
	.long LC12
	.long LC37
	.long 41680896
	.long -65536
	.long LC34
	.long LC37
	.long -1069547520
	.long -239075328
	.long LC38
	.long LC37
	.long -1052770304
	.long -239075328
	.long LC24
	.long LC39
	.long 41943040
	.long -4194304
	.long LC10
	.long LC39
	.long -1065353216
	.long -239075328
	.long LC40
	.long LC39
	.long -1048576000
	.long -239075328
	.long LC27
	.long LC41
	.long -520093696
	.long -235405312
	.long LC42
	.long LC41
	.long -517996544
	.long -235405312
	.long LC43
	.long LC44
	.long -511705088
	.long -235405312
	.long LC42
	.long LC44
	.long -509607936
	.long -235405312
	.long LC43
	.long LC45
	.long -515899392
	.long -235405312
	.long LC42
	.long LC45
	.long -513802240
	.long -235405312
	.long LC43
	.long LC45
	.long -507510784
	.long -4194304
	.long LC46
	.long LC47
	.long -536870912
	.long -235405312
	.long LC42
	.long LC47
	.long -534773760
	.long -235405312
	.long LC43
	.long LC48
	.long -528482304
	.long -235405312
	.long LC42
	.long LC48
	.long -526385152
	.long -235405312
	.long LC43
	.long LC49
	.long -532676608
	.long -235405312
	.long LC42
	.long LC49
	.long -530579456
	.long -235405312
	.long LC43
	.long LC49
	.long -524288000
	.long -4194304
	.long LC46
	.long LC50
	.long 1644167168
	.long -16777216
	.long LC51
	.long LC52
	.long 1660944384
	.long -16777216
	.long LC51
	.long LC53
	.long 1677721600
	.long -16777216
	.long LC51
	.long LC54
	.long 1694498816
	.long -16777216
	.long LC51
	.long LC55
	.long 1711276032
	.long -16777216
	.long LC51
	.long LC56
	.long 1728053248
	.long -16777216
	.long LC51
	.long LC57
	.long 1744830464
	.long -16777216
	.long LC51
	.long LC58
	.long 1761607680
	.long -16777216
	.long LC51
	.long LC59
	.long 1778384896
	.long -16777216
	.long LC51
	.long LC60
	.long 1795162112
	.long -16777216
	.long LC51
	.long LC61
	.long 1811939328
	.long -16777216
	.long LC51
	.long LC62
	.long 1828716544
	.long -16777216
	.long LC51
	.long LC63
	.long 1845493760
	.long -16777216
	.long LC51
	.long LC64
	.long 1862270976
	.long -16777216
	.long LC51
	.long LC65
	.long 20971520
	.long -239075328
	.long LC66
	.long LC65
	.long 138412032
	.long -4194304
	.long LC67
	.long LC68
	.long 25165824
	.long -239075328
	.long LC66
	.long LC68
	.long 142606336
	.long -4194304
	.long LC67
	.long LC69
	.long -356515840
	.long -4132864
	.long LC70
	.long LC71
	.long -322961408
	.long -4132864
	.long LC70
	.long LC72
	.long -339738624
	.long -4161536
	.long LC73
	.long LC74
	.long -373293056
	.long -4161536
	.long LC73
	.long LC75
	.long -306184192
	.long -4161536
	.long LC73
	.long LC76
	.long -272629760
	.long -4161536
	.long LC77
	.long LC78
	.long -289406976
	.long -4132864
	.long LC70
	.long LC79
	.long -390070272
	.long -4132864
	.long LC80
	.long LC81
	.long 29360128
	.long -239075328
	.long LC66
	.long LC81
	.long 146800640
	.long -4194304
	.long LC67
	.long LC82
	.long 16777216
	.long -239075328
	.long LC83
	.long LC82
	.long 134217728
	.long -4194304
	.long LC84
	.long LC85
	.long 1212678144
	.long -524288
	.long LC86
	.long LC87
	.long 1610612736
	.long -16777216
	.long LC51
	.long LC88
	.long 1627389952
	.long -16777216
	.long LC51
	.long LC89
	.long 113246208
	.long -4194304
	.long LC90
	.long LC91
	.long 251396096
	.long -29128
	.long LC92
	.long LC93
	.long 217841664
	.long -29128
	.long LC92
	.long LC94
	.long 180355072
	.long -4129224
	.long LC95
	.long LC96
	.long 247463936
	.long -4129224
	.long LC95
	.long LC97
	.long 213909504
	.long -4129224
	.long LC95
	.long LC98
	.long 12584960
	.long -4190209
	.long LC99
	.long LC100
	.long 79693824
	.long -4190209
	.long LC99
	.long LC101
	.long 46139392
	.long -4190209
	.long LC99
	.long LC102
	.long 1090519040
	.long -239075328
	.long LC40
	.long LC103
	.long 1098907648
	.long -239075328
	.long LC38
	.long LC104
	.long 1107296256
	.long -4194304
	.long LC105
	.long LC106
	.long 1115684864
	.long -4194304
	.long LC105
	.long LC107
	.long 1111490560
	.long -4194304
	.long LC105
	.long LC108
	.long 12582912
	.long -4190209
	.long LC99
	.long LC109
	.long 79691776
	.long -4190209
	.long LC99
	.long LC110
	.long 46137344
	.long -4190209
	.long LC99
	.long LC111
	.long -1312817152
	.long -239075328
	.long LC4
	.long LC112
	.long -1329594368
	.long -239075328
	.long LC6
	.long LC113
	.long 201326592
	.long -4194304
	.long LC114
	.long LC115
	.long 209715200
	.long -4194304
	.long LC116
	.long LC117
	.long 205520896
	.long -4194304
	.long LC118
	.long LC119
	.long 201326592
	.long -4194304
	.long LC114
	.long LC119
	.long -1342177280
	.long -239075328
	.long LC20
	.long LC120
	.long 205520896
	.long -4194304
	.long LC118
	.long LC120
	.long -1337982976
	.long -239075328
	.long LC23
	.long LC120
	.long -1329594368
	.long -239075328
	.long LC6
	.long LC121
	.long 209715200
	.long -4194304
	.long LC116
	.long LC121
	.long -1333788672
	.long -239075328
	.long LC26
	.long LC121
	.long -1312817152
	.long -239075328
	.long LC4
	.long LC122
	.long -1324875776
	.long -235405312
	.long LC123
	.long LC124
	.long -1316487168
	.long -235405312
	.long LC123
	.long LC125
	.long -1320681472
	.long -235405312
	.long LC123
	.long LC126
	.long 1422393344
	.long -524288
	.long LC127
	.long LC128
	.long 1439170560
	.long -524288
	.long LC127
	.long LC129
	.long 1472724992
	.long -524288
	.long LC127
	.long LC130
	.long 1372061696
	.long -524288
	.long LC127
	.long LC131
	.long 1556611072
	.long -524288
	.long LC127
	.long LC132
	.long 1590165504
	.long -524288
	.long LC127
	.long LC133
	.long 1388838912
	.long -524288
	.long LC127
	.long LC134
	.long 1606942720
	.long -524288
	.long LC127
	.long LC135
	.long 1405616128
	.long -524288
	.long LC127
	.long LC136
	.long 1573388288
	.long -524288
	.long LC127
	.long LC137
	.long 1539833856
	.long -524288
	.long LC127
	.long LC138
	.long 1455947776
	.long -524288
	.long LC127
	.long LC139
	.long 1523056640
	.long -524288
	.long LC127
	.long LC140
	.long 1372061696
	.long -524288
	.long LC127
	.long LC141
	.long 1355284480
	.long -524288
	.long LC127
	.long LC142
	.long 1489502208
	.long -524288
	.long LC127
	.long LC143
	.long 1506279424
	.long -524288
	.long LC127
	.long LC144
	.long 1279265792
	.long -4157448
	.long LC145
	.long LC144
	.long 1279264768
	.long -4157448
	.long LC146
	.long LC147
	.long 1279264768
	.long -4157448
	.long LC145
	.long LC148
	.long -2118123520
	.long -239075328
	.long LC38
	.long LC149
	.long -2118123520
	.long -239075328
	.long LC38
	.long LC150
	.long 1279263744
	.long -4157448
	.long LC145
	.long LC150
	.long 1279262720
	.long -4157448
	.long LC146
	.long LC151
	.long 1279262720
	.long -4157448
	.long LC145
	.long LC152
	.long -2134900736
	.long -239075328
	.long LC38
	.long LC153
	.long -2134900736
	.long -239075328
	.long LC38
	.long LC154
	.long 167772160
	.long -4194304
	.long LC67
	.long LC154
	.long 171704320
	.long -65536
	.long LC155
	.long LC154
	.long -1325400064
	.long -239075328
	.long LC66
	.long LC156
	.long 167772160
	.long -4194304
	.long LC67
	.long LC156
	.long 171704320
	.long -65536
	.long LC155
	.long LC157
	.long 176160768
	.long -4194304
	.long LC158
	.long LC159
	.long 171966464
	.long -4194304
	.long LC160
	.long LC159
	.long 175898624
	.long -65536
	.long LC161
	.long LC162
	.long 176160768
	.long -4194304
	.long LC158
	.long LC162
	.long -1317011456
	.long -239075328
	.long LC66
	.long LC163
	.long 171966464
	.long -4194304
	.long LC160
	.long LC163
	.long 175898624
	.long -65536
	.long LC161
	.long LC163
	.long -1321205760
	.long -239075328
	.long LC66
	.long LC164
	.long -1052770304
	.long -235405312
	.long LC43
	.long LC164
	.long -1052246016
	.long -235405312
	.long LC165
	.long LC164
	.long -1048051712
	.long -235405312
	.long LC166
	.long LC164
	.long -1048051712
	.long -235405312
	.long LC167
	.long LC168
	.long 1216348160
	.long -524288
	.long LC169
	.long LC170
	.long 1220542464
	.long -524288
	.long LC169
	.long LC171
	.long 1237319680
	.long -524288
	.long LC169
	.long LC172
	.long 1237319680
	.long -524288
	.long LC169
	.long LC173
	.long 1258029056
	.long -65536
	.long LC174
	.long LC175
	.long 1321205760
	.long -4194304
	.long LC176
	.long LC177
	.long 1317011456
	.long -4194304
	.long LC176
	.long LC178
	.long 1103101952
	.long -239075328
	.long LC179
	.long LC180
	.long 1313865728
	.long -524288
	.long LC181
	.long LC182
	.long 1208483840
	.long -524288
	.long LC183
	.long LC184
	.long 1313865728
	.long -524288
	.long LC181
	.long LC184
	.long 1208483840
	.long -524288
	.long LC183
	.long LC185
	.long -519569408
	.long -235405312
	.long LC42
	.long LC185
	.long -517472256
	.long -235405312
	.long LC43
	.long LC186
	.long -515375104
	.long -235405312
	.long LC42
	.long LC186
	.long -513277952
	.long -235405312
	.long LC43
	.long LC186
	.long -473956352
	.long -4194304
	.long LC46
	.long LC187
	.long -511180800
	.long -235405312
	.long LC42
	.long LC187
	.long -509083648
	.long -235405312
	.long LC43
	.long LC188
	.long -536346624
	.long -235405312
	.long LC42
	.long LC188
	.long -534249472
	.long -235405312
	.long LC43
	.long LC189
	.long -527958016
	.long -235405312
	.long LC42
	.long LC189
	.long -525860864
	.long -235405312
	.long LC43
	.long LC190
	.long -532152320
	.long -235405312
	.long LC42
	.long LC190
	.long -530055168
	.long -235405312
	.long LC43
	.long LC190
	.long -490733568
	.long -4194304
	.long LC46
	.long LC191
	.long 541065216
	.long -239075328
	.long LC4
	.long LC192
	.long 809500672
	.long -239075328
	.long LC6
	.long LC193
	.long 268435456
	.long -268435456
	.long LC194
	.long LC195
	.long 1316683776
	.long -65536
	.long LC196
	.long LC195
	.long 1316683776
	.long -65536
	.long LC197
	.long LC195
	.long 1316618240
	.long -65536
	.long LC198
	.long LC195
	.long 1316618240
	.long -65536
	.long LC199
	.long LC200
	.long 536870912
	.long -268435456
	.long LC201
	.long LC200
	.long 541065216
	.long -239075328
	.long LC4
	.long LC200
	.long 1314914304
	.long -524288
	.long LC202
	.long LC200
	.long 1315438592
	.long -524288
	.long LC203
	.long LC200
	.long 1879048192
	.long -251658240
	.long LC204
	.long LC205
	.long 1220542464
	.long -4194304
	.long LC206
	.long LC205
	.long 1222639616
	.long -524288
	.long LC207
	.long LC205
	.long 1287651328
	.long -4194304
	.long LC208
	.long LC205
	.long 1289224192
	.long -524288
	.long LC209
	.long LC210
	.long 1216348160
	.long -4194304
	.long LC206
	.long LC210
	.long 1218445312
	.long -524288
	.long LC207
	.long LC210
	.long 1283457024
	.long -4194304
	.long LC208
	.long LC210
	.long 1285029888
	.long -524288
	.long LC209
	.long LC211
	.long 21495808
	.long -235405312
	.long LC212
	.long LC211
	.long 29884416
	.long -235405312
	.long LC213
	.long LC214
	.long 17301504
	.long -235405312
	.long LC212
	.long LC214
	.long 25690112
	.long -235405312
	.long LC213
	.long LC215
	.long 1879048192
	.long -251658240
	.long LC204
	.long LC216
	.long 805306368
	.long -268435456
	.long LC217
	.long LC216
	.long 809500672
	.long -239075328
	.long LC6
	.long LC216
	.long 1086324736
	.long -4194304
	.long LC218
	.long LC216
	.long 1119879168
	.long -4194304
	.long LC219
	.long LC216
	.long 1153433600
	.long -4194304
	.long LC220
	.long LC216
	.long 1186988032
	.long -4194304
	.long LC221
	.long LC222
	.long 234881024
	.long -4190209
	.long LC223
	.long LC222
	.long 234883072
	.long -4190209
	.long LC224
	.long LC225
	.long 243269632
	.long -4190209
	.long LC223
	.long LC225
	.long 243271680
	.long -4190209
	.long LC224
	.long LC226
	.long 239075328
	.long -4190209
	.long LC223
	.long LC226
	.long 239077376
	.long -4190209
	.long LC224
	.long LC227
	.long 1275070464
	.long -4157448
	.long LC228
	.long LC227
	.long 1275071488
	.long -4157448
	.long LC145
	.long LC229
	.long -1044381696
	.long -239075328
	.long LC38
	.long LC230
	.long -1044381696
	.long -239075328
	.long LC38
	.long LC231
	.long 1275068416
	.long -4157448
	.long LC228
	.long LC231
	.long 1275069440
	.long -4157448
	.long LC145
	.long LC232
	.long -1061158912
	.long -239075328
	.long LC38
	.long LC233
	.long -1061158912
	.long -239075328
	.long LC38
	.long LC234
	.long 1207959552
	.long -4194304
	.long LC105
	.long LC235
	.long 1140850688
	.long -4194304
	.long LC105
	.long LC236
	.long 1149239296
	.long -4194304
	.long LC105
	.long LC237
	.long 1145044992
	.long -4194304
	.long LC105
	.long LC238
	.long 1073741824
	.long -4194304
	.long LC105
	.long LC239
	.long 1082130432
	.long -4194304
	.long LC105
	.long LC240
	.long 1077936128
	.long -4194304
	.long LC105
	.long LC241
	.long 1316028416
	.long -65536
	.long LC174
	.long LC242
	.long 1174405120
	.long -4194304
	.long LC105
	.long LC243
	.long 1182793728
	.long -4194304
	.long LC105
	.long LC244
	.long 1178599424
	.long -4194304
	.long LC105
	.long LC245
	.long 0
	.long -4194304
	.long LC67
	.long LC245
	.long 3932160
	.long -65536
	.long LC155
	.long LC245
	.long -2147483648
	.long -239075328
	.long LC20
	.long LC245
	.long -2130706432
	.long -239075328
	.long LC246
	.long LC247
	.long 0
	.long -4194304
	.long LC67
	.long LC247
	.long 3932160
	.long -65536
	.long LC155
	.long LC248
	.long 8388608
	.long -4194304
	.long LC158
	.long LC249
	.long 4194304
	.long -4194304
	.long LC160
	.long LC249
	.long 8126464
	.long -65536
	.long LC161
	.long LC250
	.long 8388608
	.long -4194304
	.long LC158
	.long LC250
	.long -2139095040
	.long -239075328
	.long LC40
	.long LC250
	.long -2122317824
	.long -239075328
	.long LC246
	.long LC251
	.long 4194304
	.long -4194304
	.long LC160
	.long LC251
	.long 8126464
	.long -65536
	.long LC161
	.long LC251
	.long -2143289344
	.long -239075328
	.long LC38
	.long LC251
	.long -2126512128
	.long -239075328
	.long LC246
	.long LC252
	.long -2126512128
	.long -235405312
	.long LC253
	.long LC252
	.long -2125987840
	.long -235405312
	.long LC254
	.long LC255
	.long 1212153856
	.long -4194304
	.long LC176
	.long LC256
	.long 1315962880
	.long -65536
	.long LC174
	.long LC257
	.long -518520832
	.long -235405312
	.long LC42
	.long LC257
	.long -516423680
	.long -235405312
	.long LC43
	.long LC258
	.long -510132224
	.long -235405312
	.long LC42
	.long LC258
	.long -508035072
	.long -235405312
	.long LC43
	.long LC259
	.long -514326528
	.long -235405312
	.long LC42
	.long LC259
	.long -512229376
	.long -235405312
	.long LC43
	.long LC259
	.long -406847488
	.long -4194304
	.long LC46
	.long LC260
	.long -535298048
	.long -235405312
	.long LC42
	.long LC260
	.long -533200896
	.long -235405312
	.long LC43
	.long LC261
	.long -526909440
	.long -235405312
	.long LC42
	.long LC261
	.long -524812288
	.long -235405312
	.long LC43
	.long LC262
	.long -531103744
	.long -235405312
	.long LC42
	.long LC262
	.long -529006592
	.long -235405312
	.long LC43
	.long LC262
	.long -423624704
	.long -4194304
	.long LC46
	.long LC263
	.long -519045120
	.long -235405312
	.long LC42
	.long LC263
	.long -516947968
	.long -235405312
	.long LC43
	.long LC264
	.long -510656512
	.long -235405312
	.long LC42
	.long LC264
	.long -508559360
	.long -235405312
	.long LC43
	.long LC265
	.long -514850816
	.long -235405312
	.long LC42
	.long LC265
	.long -512753664
	.long -235405312
	.long LC43
	.long LC265
	.long -440401920
	.long -4194304
	.long LC46
	.long LC266
	.long -535822336
	.long -235405312
	.long LC42
	.long LC266
	.long -533725184
	.long -235405312
	.long LC43
	.long LC267
	.long -527433728
	.long -235405312
	.long LC42
	.long LC267
	.long -525336576
	.long -235405312
	.long LC43
	.long LC268
	.long -531628032
	.long -235405312
	.long LC42
	.long LC268
	.long -529530880
	.long -235405312
	.long LC43
	.long LC268
	.long -457179136
	.long -4194304
	.long LC46
	.long LC269
	.long 1316225024
	.long -65536
	.long LC270
	.long LC271
	.long 1316159488
	.long -65536
	.long LC174
	.long LC272
	.long 113246208
	.long -1048576
	.long LC273
	.long LC274
	.long 1316421632
	.long -65536
	.long LC174
	.long LC275
	.long 1316290560
	.long -65536
	.long LC174
	.long LC276
	.long 1421869056
	.long -4194304
	.long LC105
	.long LC277
	.long 1438646272
	.long -4194304
	.long LC105
	.long LC278
	.long 1472200704
	.long -4194304
	.long LC105
	.long LC279
	.long 1371537408
	.long -4194304
	.long LC105
	.long LC280
	.long 1556086784
	.long -4194304
	.long LC105
	.long LC281
	.long 1589641216
	.long -4194304
	.long LC105
	.long LC282
	.long 1388314624
	.long -4194304
	.long LC105
	.long LC283
	.long 1606418432
	.long -4194304
	.long LC105
	.long LC284
	.long 1405091840
	.long -4194304
	.long LC105
	.long LC285
	.long 1572864000
	.long -4194304
	.long LC105
	.long LC286
	.long 1539309568
	.long -4194304
	.long LC105
	.long LC287
	.long 1455423488
	.long -4194304
	.long LC105
	.long LC288
	.long 1522532352
	.long -4194304
	.long LC105
	.long LC289
	.long 1354760192
	.long -4194304
	.long LC105
	.long LC290
	.long 1488977920
	.long -4194304
	.long LC105
	.long LC291
	.long 1505755136
	.long -4194304
	.long LC105
	.long LC292
	.long -2130706432
	.long -235405312
	.long LC1
	.long LC292
	.long -2130182144
	.long -235405312
	.long LC2
	.long LC293
	.long 1316093952
	.long -65536
	.long LC270
	.long LC294
	.long -1849688064
	.long -239075328
	.long LC4
	.long LC295
	.long -1866465280
	.long -239075328
	.long LC6
	.long LC296
	.long 67108864
	.long -4194304
	.long LC67
	.long LC296
	.long 1358954496
	.long -239075328
	.long LC297
	.long LC296
	.long -1879048192
	.long -239075328
	.long LC20
	.long LC296
	.long -1862270976
	.long -239075328
	.long LC246
	.long LC298
	.long 67108864
	.long -4194304
	.long LC67
	.long LC299
	.long 75497472
	.long -4194304
	.long LC158
	.long LC300
	.long 71303168
	.long -4194304
	.long LC160
	.long LC301
	.long 75497472
	.long -4194304
	.long LC158
	.long LC301
	.long 1367343104
	.long -239075328
	.long LC297
	.long LC301
	.long -1870659584
	.long -239075328
	.long LC26
	.long LC301
	.long -1853882368
	.long -239075328
	.long LC246
	.long LC301
	.long -1849688064
	.long -239075328
	.long LC4
	.long LC302
	.long 1358954496
	.long -239075328
	.long LC297
	.long LC303
	.long 1367343104
	.long -239075328
	.long LC297
	.long LC304
	.long 1363148800
	.long -239075328
	.long LC297
	.long LC305
	.long 71303168
	.long -4194304
	.long LC160
	.long LC305
	.long 1363148800
	.long -239075328
	.long LC297
	.long LC305
	.long -1874853888
	.long -239075328
	.long LC23
	.long LC305
	.long -1866465280
	.long -239075328
	.long LC6
	.long LC305
	.long -1858076672
	.long -239075328
	.long LC246
	.long LC306
	.long -1862270976
	.long -235405312
	.long LC1
	.long LC306
	.long -1861746688
	.long -235405312
	.long LC2
	.long LC307
	.long -1853882368
	.long -235405312
	.long LC1
	.long LC307
	.long -1853358080
	.long -235405312
	.long LC2
	.long LC308
	.long -1858076672
	.long -235405312
	.long LC1
	.long LC308
	.long -1857552384
	.long -235405312
	.long LC2
	.long LC309
	.long 1212153856
	.long -524288
	.long LC169
	.long LC310
	.long 1254096896
	.long -4194304
	.long LC105
	.long LC311
	.long 1312817152
	.long -1048576
	.long LC312
	.long LC313
	.long 1425801216
	.long -65536
	.long LC174
	.long LC314
	.long 1442578432
	.long -65536
	.long LC174
	.long LC315
	.long 1476132864
	.long -65536
	.long LC174
	.long LC316
	.long 1375469568
	.long -65536
	.long LC174
	.long LC317
	.long 1560018944
	.long -65536
	.long LC174
	.long LC318
	.long 1593573376
	.long -65536
	.long LC174
	.long LC319
	.long 1392246784
	.long -65536
	.long LC174
	.long LC320
	.long 1610350592
	.long -65536
	.long LC174
	.long LC321
	.long 1409024000
	.long -65536
	.long LC174
	.long LC322
	.long 1576796160
	.long -65536
	.long LC174
	.long LC323
	.long 1543241728
	.long -65536
	.long LC174
	.long LC324
	.long 1459355648
	.long -65536
	.long LC174
	.long LC325
	.long 1526464512
	.long -65536
	.long LC174
	.long LC326
	.long 1358692352
	.long -65536
	.long LC174
	.long LC327
	.long 1492910080
	.long -65536
	.long LC174
	.long LC328
	.long 1509687296
	.long -65536
	.long LC174
	.long LC329
	.long 1425670144
	.long -65536
	.long LC174
	.long LC330
	.long 1442447360
	.long -65536
	.long LC174
	.long LC331
	.long 1476001792
	.long -65536
	.long LC174
	.long LC332
	.long 1375338496
	.long -65536
	.long LC174
	.long LC333
	.long 1559887872
	.long -65536
	.long LC174
	.long LC334
	.long 1593442304
	.long -65536
	.long LC174
	.long LC335
	.long 1392115712
	.long -65536
	.long LC174
	.long LC336
	.long 1610219520
	.long -65536
	.long LC174
	.long LC337
	.long 1408892928
	.long -65536
	.long LC174
	.long LC338
	.long 1576665088
	.long -65536
	.long LC174
	.long LC339
	.long 1543110656
	.long -65536
	.long LC174
	.long LC340
	.long 1459224576
	.long -65536
	.long LC174
	.long LC341
	.long 1526333440
	.long -65536
	.long LC174
	.long LC342
	.long 1358561280
	.long -65536
	.long LC174
	.long LC343
	.long 1492779008
	.long -65536
	.long LC174
	.long LC344
	.long 1509556224
	.long -65536
	.long LC174
	.long LC345
	.long 1425735680
	.long -65536
	.long LC174
	.long LC346
	.long 1442512896
	.long -65536
	.long LC174
	.long LC347
	.long 1476067328
	.long -65536
	.long LC174
	.long LC348
	.long 1375404032
	.long -65536
	.long LC174
	.long LC349
	.long 1559953408
	.long -65536
	.long LC174
	.long LC350
	.long 1593507840
	.long -65536
	.long LC174
	.long LC351
	.long 1392181248
	.long -65536
	.long LC174
	.long LC352
	.long 1610285056
	.long -65536
	.long LC174
	.long LC353
	.long 1408958464
	.long -65536
	.long LC174
	.long LC354
	.long 1576730624
	.long -65536
	.long LC174
	.long LC355
	.long 1543176192
	.long -65536
	.long LC174
	.long LC356
	.long 1459290112
	.long -65536
	.long LC174
	.long LC357
	.long 1526398976
	.long -65536
	.long LC174
	.long LC358
	.long 1358626816
	.long -65536
	.long LC174
	.long LC359
	.long 1492844544
	.long -65536
	.long LC174
	.long LC360
	.long 1509621760
	.long -65536
	.long LC174
	.long LC361
	.long 1316356096
	.long -65536
	.long LC174
	.long LC362
	.long 1241513984
	.long -4194304
	.long LC363
	.long LC364
	.long 1245708288
	.long -4194304
	.long LC365
	.long LC366
	.long 1249902592
	.long -4194304
	.long LC367
	.long LC368
	.long 1314390016
	.long -524288
	.long LC369
	.long LC370
	.long -2122317824
	.long -235405312
	.long LC253
	.long LC370
	.long -2121793536
	.long -235405312
	.long LC254
	.long LC371
	.long -268412904
	.long -239010689
	.long LC372
	.long LC373
	.long -268413928
	.long -239010689
	.long LC374
	.long LC375
	.long -268419048
	.long -239010689
	.long LC376
	.long LC377
	.long -268415976
	.long -239010689
	.long LC378
	.long LC379
	.long -268418024
	.long -239010689
	.long LC380
	.long LC381
	.long -268414952
	.long -239010689
	.long LC382
	.long LC383
	.long -268435432
	.long -239017857
	.long LC384
	.long LC383
	.long -268417000
	.long -239010689
	.long LC385
	.long LC383
	.long -268435432
	.long -239017857
	.long LC386
	.long LC387
	.long -268412900
	.long -239010689
	.long LC372
	.long LC388
	.long -268413924
	.long -239010689
	.long LC374
	.long LC389
	.long -268419044
	.long -239010689
	.long LC376
	.long LC390
	.long -268415972
	.long -239010689
	.long LC378
	.long LC391
	.long -268418020
	.long -239010689
	.long LC380
	.long LC392
	.long -268414948
	.long -239010689
	.long LC382
	.long LC393
	.long -268435428
	.long -239017857
	.long LC384
	.long LC393
	.long -268416996
	.long -239010689
	.long LC385
	.long LC393
	.long -268435428
	.long -239017857
	.long LC386
	.long LC394
	.long -268412894
	.long -239010689
	.long LC372
	.long LC395
	.long -268413918
	.long -239010689
	.long LC374
	.long LC396
	.long -268419038
	.long -239010689
	.long LC376
	.long LC397
	.long -268415966
	.long -239010689
	.long LC378
	.long LC398
	.long -268418014
	.long -239010689
	.long LC380
	.long LC399
	.long -268414942
	.long -239010689
	.long LC382
	.long LC400
	.long -268435422
	.long -239017857
	.long LC384
	.long LC400
	.long -268416990
	.long -239010689
	.long LC385
	.long LC401
	.long -268412916
	.long -239010689
	.long LC372
	.long LC402
	.long -268413940
	.long -239010689
	.long LC374
	.long LC403
	.long -268419060
	.long -239010689
	.long LC376
	.long LC404
	.long -268415988
	.long -239010689
	.long LC378
	.long LC405
	.long -268418036
	.long -239010689
	.long LC380
	.long LC406
	.long -268414964
	.long -239010689
	.long LC382
	.long LC407
	.long -268435444
	.long -239017857
	.long LC384
	.long LC407
	.long -268417012
	.long -239010689
	.long LC385
	.long LC407
	.long -268435444
	.long -239017857
	.long LC386
	.long LC408
	.long -268412918
	.long -239010689
	.long LC372
	.long LC409
	.long -268413942
	.long -239010689
	.long LC374
	.long LC410
	.long -268419062
	.long -239010689
	.long LC376
	.long LC411
	.long -268415990
	.long -239010689
	.long LC378
	.long LC412
	.long -268418038
	.long -239010689
	.long LC380
	.long LC413
	.long -268414966
	.long -239010689
	.long LC382
	.long LC414
	.long -268435446
	.long -239017857
	.long LC384
	.long LC414
	.long -268417014
	.long -239010689
	.long LC385
	.long LC414
	.long -268435446
	.long -239017857
	.long LC386
	.long LC415
	.long -268412915
	.long -239010689
	.long LC372
	.long LC416
	.long -268413939
	.long -239010689
	.long LC374
	.long LC417
	.long -268419059
	.long -239010689
	.long LC376
	.long LC418
	.long -268415987
	.long -239010689
	.long LC378
	.long LC419
	.long -268418035
	.long -239010689
	.long LC380
	.long LC420
	.long -268414963
	.long -239010689
	.long LC382
	.long LC421
	.long -268435443
	.long -239017857
	.long LC384
	.long LC421
	.long -268417011
	.long -239010689
	.long LC385
	.long LC421
	.long -268435443
	.long -239017857
	.long LC386
	.long LC422
	.long -259981312
	.long -239140864
	.long LC423
	.long LC424
	.long -260046848
	.long -239140864
	.long LC423
	.long LC425
	.long -258801664
	.long -239140864
	.long LC423
	.long LC426
	.long -258605056
	.long -239140864
	.long LC423
	.long LC427
	.long -258539520
	.long -239140864
	.long LC423
	.long LC428
	.long -258867200
	.long -239140864
	.long LC423
	.long LC429
	.long -258670592
	.long -239140864
	.long LC423
	.long LC430
	.long -258736128
	.long -239140864
	.long LC423
	.long LC431
	.long -259129344
	.long -239140864
	.long LC423
	.long LC432
	.long -258211840
	.long -239140864
	.long LC423
	.long LC433
	.long -258408448
	.long -239140864
	.long LC423
	.long LC434
	.long -258473984
	.long -239140864
	.long LC423
	.long LC435
	.long -258146304
	.long -239140864
	.long LC423
	.long LC436
	.long -258342912
	.long -239140864
	.long LC423
	.long LC437
	.long -258277376
	.long -239140864
	.long LC423
	.long LC438
	.long -259850240
	.long -239140864
	.long LC423
	.long LC439
	.long -259653632
	.long -239140864
	.long LC423
	.long LC440
	.long -259915776
	.long -239140864
	.long LC423
	.long LC441
	.long -259719168
	.long -239140864
	.long LC423
	.long LC442
	.long -259784704
	.long -239140864
	.long LC423
	.long LC443
	.long -259588096
	.long -239140864
	.long LC423
	.long LC444
	.long -258932736
	.long -239140864
	.long LC423
	.long LC445
	.long -258998272
	.long -239140864
	.long LC423
	.long LC446
	.long -258080768
	.long -239140864
	.long LC423
	.long LC447
	.long -258015232
	.long -239140864
	.long LC423
	.long LC448
	.long -259063808
	.long -239140864
	.long LC423
	.long LC449
	.long -259457024
	.long -239140864
	.long LC423
	.long LC450
	.long -259325952
	.long -239140864
	.long LC423
	.long LC451
	.long -259391488
	.long -239140864
	.long LC423
	.long LC452
	.long -259194880
	.long -239140864
	.long LC423
	.long LC453
	.long -259260416
	.long -239140864
	.long LC423
	.long LC454
	.long -259522560
	.long -239140864
	.long LC423
	.long LC455
	.long -268412872
	.long -239010689
	.long LC372
	.long LC456
	.long -268413896
	.long -239010689
	.long LC374
	.long LC457
	.long -268419016
	.long -239010689
	.long LC376
	.long LC458
	.long -268415944
	.long -239010689
	.long LC378
	.long LC459
	.long -268417992
	.long -239010689
	.long LC380
	.long LC460
	.long -268414920
	.long -239010689
	.long LC382
	.long LC461
	.long -268435400
	.long -239017857
	.long LC384
	.long LC461
	.long -268416968
	.long -239010689
	.long LC385
	.long LC462
	.long -268412899
	.long -239010689
	.long LC372
	.long LC463
	.long -268413923
	.long -239010689
	.long LC374
	.long LC464
	.long -268419043
	.long -239010689
	.long LC376
	.long LC465
	.long -268415971
	.long -239010689
	.long LC378
	.long LC466
	.long -268418019
	.long -239010689
	.long LC380
	.long LC467
	.long -268414947
	.long -239010689
	.long LC382
	.long LC468
	.long -268435427
	.long -239017857
	.long LC384
	.long LC468
	.long -268416995
	.long -239010689
	.long LC385
	.long LC468
	.long -268435427
	.long -239017857
	.long LC386
	.long LC469
	.long -268412903
	.long -239010689
	.long LC372
	.long LC470
	.long -268413927
	.long -239010689
	.long LC374
	.long LC471
	.long -268419047
	.long -239010689
	.long LC376
	.long LC472
	.long -268415975
	.long -239010689
	.long LC378
	.long LC473
	.long -268418023
	.long -239010689
	.long LC380
	.long LC474
	.long -268414951
	.long -239010689
	.long LC382
	.long LC475
	.long -268435431
	.long -239017857
	.long LC384
	.long LC475
	.long -268416999
	.long -239010689
	.long LC385
	.long LC475
	.long -268435431
	.long -239017857
	.long LC386
	.long LC476
	.long -263716863
	.long -235339777
	.long LC477
	.long LC478
	.long -263716864
	.long -235339777
	.long LC477
	.long LC479
	.long -263716845
	.long -235339777
	.long LC477
	.long LC480
	.long -263716842
	.long -235339777
	.long LC477
	.long LC481
	.long -263716841
	.long -235339777
	.long LC477
	.long LC482
	.long -263716846
	.long -235339777
	.long LC477
	.long LC483
	.long -263716843
	.long -235339777
	.long LC477
	.long LC484
	.long -263716844
	.long -235339777
	.long LC477
	.long LC485
	.long -263716850
	.long -235339777
	.long LC477
	.long LC486
	.long -263716836
	.long -235339777
	.long LC477
	.long LC487
	.long -263716839
	.long -235339777
	.long LC477
	.long LC488
	.long -263716840
	.long -235339777
	.long LC477
	.long LC489
	.long -263716835
	.long -235339777
	.long LC477
	.long LC490
	.long -263716838
	.long -235339777
	.long LC477
	.long LC491
	.long -263716837
	.long -235339777
	.long LC477
	.long LC492
	.long -263716861
	.long -235339777
	.long LC477
	.long LC493
	.long -263716858
	.long -235339777
	.long LC477
	.long LC494
	.long -263716862
	.long -235339777
	.long LC477
	.long LC495
	.long -263716859
	.long -235339777
	.long LC477
	.long LC496
	.long -263716860
	.long -235339777
	.long LC477
	.long LC497
	.long -263716857
	.long -235339777
	.long LC477
	.long LC498
	.long -263716847
	.long -235339777
	.long LC477
	.long LC499
	.long -263716848
	.long -235339777
	.long LC477
	.long LC500
	.long -263716834
	.long -235339777
	.long LC477
	.long LC501
	.long -263716833
	.long -235339777
	.long LC477
	.long LC502
	.long -263716849
	.long -235339777
	.long LC477
	.long LC503
	.long -263716855
	.long -235339777
	.long LC477
	.long LC504
	.long -263716853
	.long -235339777
	.long LC477
	.long LC505
	.long -263716854
	.long -235339777
	.long LC477
	.long LC506
	.long -263716851
	.long -235339777
	.long LC477
	.long LC507
	.long -263716852
	.long -235339777
	.long LC477
	.long LC508
	.long -263716856
	.long -235339777
	.long LC477
	.long LC509
	.long -268412896
	.long -239010689
	.long LC372
	.long LC510
	.long -268413920
	.long -239010689
	.long LC374
	.long LC511
	.long -268419040
	.long -239010689
	.long LC376
	.long LC512
	.long -268415968
	.long -239010689
	.long LC378
	.long LC513
	.long -268418016
	.long -239010689
	.long LC380
	.long LC514
	.long -268414944
	.long -239010689
	.long LC382
	.long LC515
	.long -268435424
	.long -239017857
	.long LC384
	.long LC515
	.long -268416992
	.long -239010689
	.long LC385
	.long LC516
	.long -268412912
	.long -239010689
	.long LC372
	.long LC517
	.long -268413936
	.long -239010689
	.long LC374
	.long LC518
	.long -268419056
	.long -239010689
	.long LC376
	.long LC519
	.long -268415984
	.long -239010689
	.long LC378
	.long LC520
	.long -268418032
	.long -239010689
	.long LC380
	.long LC521
	.long -268414960
	.long -239010689
	.long LC382
	.long LC522
	.long -268435440
	.long -239017857
	.long LC384
	.long LC522
	.long -268417008
	.long -239010689
	.long LC385
	.long LC522
	.long -268435440
	.long -239017857
	.long LC386
	.long LC523
	.long -268412920
	.long -239010689
	.long LC372
	.long LC524
	.long -268413944
	.long -239010689
	.long LC374
	.long LC525
	.long -268419064
	.long -239010689
	.long LC376
	.long LC526
	.long -268415992
	.long -239010689
	.long LC378
	.long LC527
	.long -268418040
	.long -239010689
	.long LC380
	.long LC528
	.long -268414968
	.long -239010689
	.long LC382
	.long LC529
	.long -268435448
	.long -239017857
	.long LC384
	.long LC529
	.long -268417016
	.long -239010689
	.long LC385
	.long LC529
	.long -268435448
	.long -239017857
	.long LC386
	.long LC530
	.long -268412898
	.long -239010689
	.long LC372
	.long LC531
	.long -268413922
	.long -239010689
	.long LC374
	.long LC532
	.long -268419042
	.long -239010689
	.long LC376
	.long LC533
	.long -268415970
	.long -239010689
	.long LC378
	.long LC534
	.long -268418018
	.long -239010689
	.long LC380
	.long LC535
	.long -268414946
	.long -239010689
	.long LC382
	.long LC536
	.long -268435426
	.long -239017857
	.long LC384
	.long LC536
	.long -268416994
	.long -239010689
	.long LC385
	.long LC536
	.long -268435426
	.long -239017857
	.long LC386
	.long LC537
	.long -268412897
	.long -239010689
	.long LC372
	.long LC538
	.long -268413921
	.long -239010689
	.long LC374
	.long LC539
	.long -268419041
	.long -239010689
	.long LC376
	.long LC540
	.long -268415969
	.long -239010689
	.long LC378
	.long LC541
	.long -268418017
	.long -239010689
	.long LC380
	.long LC542
	.long -268414945
	.long -239010689
	.long LC382
	.long LC543
	.long -268435425
	.long -239017857
	.long LC384
	.long LC543
	.long -268416993
	.long -239010689
	.long LC385
	.long LC543
	.long -268435425
	.long -239017857
	.long LC386
	.long LC544
	.long -268412927
	.long -239010689
	.long LC372
	.long LC545
	.long -268413951
	.long -239010689
	.long LC374
	.long LC546
	.long -268419071
	.long -239010689
	.long LC376
	.long LC547
	.long -268415999
	.long -239010689
	.long LC378
	.long LC548
	.long -268418047
	.long -239010689
	.long LC380
	.long LC549
	.long -268414975
	.long -239010689
	.long LC382
	.long LC550
	.long -268435455
	.long -239017857
	.long LC384
	.long LC550
	.long -268417023
	.long -239010689
	.long LC385
	.long LC550
	.long -268435455
	.long -239017857
	.long LC386
	.long LC551
	.long -268412925
	.long -239010689
	.long LC372
	.long LC552
	.long -268413949
	.long -239010689
	.long LC374
	.long LC553
	.long -268419069
	.long -239010689
	.long LC376
	.long LC554
	.long -268415997
	.long -239010689
	.long LC378
	.long LC555
	.long -268418045
	.long -239010689
	.long LC380
	.long LC556
	.long -268414973
	.long -239010689
	.long LC382
	.long LC557
	.long -268435453
	.long -239017857
	.long LC384
	.long LC557
	.long -268417021
	.long -239010689
	.long LC385
	.long LC557
	.long -268435453
	.long -239017857
	.long LC386
	.long LC558
	.long -268412907
	.long -239010689
	.long LC372
	.long LC559
	.long -268413931
	.long -239010689
	.long LC374
	.long LC560
	.long -268419051
	.long -239010689
	.long LC376
	.long LC561
	.long -268415979
	.long -239010689
	.long LC378
	.long LC562
	.long -268418027
	.long -239010689
	.long LC380
	.long LC563
	.long -268414955
	.long -239010689
	.long LC382
	.long LC564
	.long -268435435
	.long -239017857
	.long LC384
	.long LC564
	.long -268417003
	.long -239010689
	.long LC385
	.long LC564
	.long -268435435
	.long -239017857
	.long LC386
	.long LC565
	.long -268412906
	.long -239010689
	.long LC372
	.long LC566
	.long -268413930
	.long -239010689
	.long LC374
	.long LC567
	.long -268419050
	.long -239010689
	.long LC376
	.long LC568
	.long -268415978
	.long -239010689
	.long LC378
	.long LC569
	.long -268418026
	.long -239010689
	.long LC380
	.long LC570
	.long -268414954
	.long -239010689
	.long LC382
	.long LC571
	.long -268435434
	.long -239017857
	.long LC384
	.long LC571
	.long -268417002
	.long -239010689
	.long LC385
	.long LC571
	.long -268435434
	.long -239017857
	.long LC386
	.long LC572
	.long -268412908
	.long -239010689
	.long LC372
	.long LC573
	.long -268413932
	.long -239010689
	.long LC374
	.long LC574
	.long -268419052
	.long -239010689
	.long LC376
	.long LC575
	.long -268415980
	.long -239010689
	.long LC378
	.long LC576
	.long -268418028
	.long -239010689
	.long LC380
	.long LC577
	.long -268414956
	.long -239010689
	.long LC382
	.long LC578
	.long -268435436
	.long -239017857
	.long LC384
	.long LC578
	.long -268417004
	.long -239010689
	.long LC385
	.long LC578
	.long -268435436
	.long -239017857
	.long LC386
	.long LC579
	.long -268412922
	.long -239010689
	.long LC372
	.long LC580
	.long -268413946
	.long -239010689
	.long LC374
	.long LC581
	.long -268419066
	.long -239010689
	.long LC376
	.long LC582
	.long -268415994
	.long -239010689
	.long LC378
	.long LC583
	.long -268418042
	.long -239010689
	.long LC380
	.long LC584
	.long -268414970
	.long -239010689
	.long LC382
	.long LC585
	.long -268435450
	.long -239017857
	.long LC384
	.long LC585
	.long -268417018
	.long -239010689
	.long LC385
	.long LC585
	.long -268435450
	.long -239017857
	.long LC386
	.long LC586
	.long -268412895
	.long -239010689
	.long LC372
	.long LC587
	.long -268413919
	.long -239010689
	.long LC374
	.long LC588
	.long -268419039
	.long -239010689
	.long LC376
	.long LC589
	.long -268415967
	.long -239010689
	.long LC378
	.long LC590
	.long -268418015
	.long -239010689
	.long LC380
	.long LC591
	.long -268414943
	.long -239010689
	.long LC382
	.long LC592
	.long -268435423
	.long -239017857
	.long LC384
	.long LC592
	.long -268416991
	.long -239010689
	.long LC385
	.long LC593
	.long -268412928
	.long -239010689
	.long LC372
	.long LC593
	.long -268404736
	.long -239010689
	.long LC594
	.long LC595
	.long -268413952
	.long -239010689
	.long LC374
	.long LC595
	.long -268405760
	.long -239010689
	.long LC596
	.long LC597
	.long -268419072
	.long -239010689
	.long LC376
	.long LC597
	.long -268410880
	.long -239010689
	.long LC598
	.long LC597
	.long -268394496
	.long -239016961
	.long LC599
	.long LC597
	.long -268402688
	.long -239016961
	.long LC600
	.long LC601
	.long -268407808
	.long -239010816
	.long LC602
	.long LC601
	.long -268403712
	.long -239010801
	.long LC603
	.long LC604
	.long -268418048
	.long -239010689
	.long LC380
	.long LC604
	.long -268409856
	.long -239010689
	.long LC605
	.long LC606
	.long -268414976
	.long -239010689
	.long LC382
	.long LC606
	.long -268406784
	.long -239010689
	.long LC607
	.long LC608
	.long -268435456
	.long -239017857
	.long LC384
	.long LC608
	.long -268417024
	.long -239010689
	.long LC385
	.long LC608
	.long -268408832
	.long -239010689
	.long LC609
	.long LC610
	.long -268411904
	.long -234882048
	.long LC611
	.long LC612
	.long -268411904
	.long -234882048
	.long LC611
	.long LC613
	.long -266280960
	.long -235340032
	.long LC614
	.long LC613
	.long -266278912
	.long -235339889
	.long LC615
	.long LC613
	.long -268374016
	.long -239010048
	.long LC616
	.long LC613
	.long -268371968
	.long -239009905
	.long LC617
	.long LC613
	.long -266809344
	.long -235340032
	.long LC618
	.long LC613
	.long -266807296
	.long -235339889
	.long LC619
	.long LC613
	.long -268382208
	.long -239010048
	.long LC620
	.long LC613
	.long -268380160
	.long -239009905
	.long LC621
	.long LC622
	.long -268394496
	.long -239016961
	.long LC623
	.long LC622
	.long -268402688
	.long -239016961
	.long LC624
	.long LC625
	.long -268412893
	.long -239010689
	.long LC372
	.long LC626
	.long -268413917
	.long -239010689
	.long LC374
	.long LC627
	.long -268419037
	.long -239010689
	.long LC376
	.long LC628
	.long -268415965
	.long -239010689
	.long LC378
	.long LC629
	.long -268418013
	.long -239010689
	.long LC380
	.long LC630
	.long -268414941
	.long -239010689
	.long LC382
	.long LC631
	.long -268435421
	.long -239017857
	.long LC384
	.long LC631
	.long -268416989
	.long -239010689
	.long LC385
	.long LC632
	.long -268412902
	.long -239010689
	.long LC372
	.long LC633
	.long -268413926
	.long -239010689
	.long LC374
	.long LC634
	.long -268419046
	.long -239010689
	.long LC376
	.long LC635
	.long -268415974
	.long -239010689
	.long LC378
	.long LC636
	.long -268418022
	.long -239010689
	.long LC380
	.long LC637
	.long -268414950
	.long -239010689
	.long LC382
	.long LC638
	.long -268435430
	.long -239017857
	.long LC384
	.long LC638
	.long -268416998
	.long -239010689
	.long LC385
	.long LC638
	.long -268435430
	.long -239017857
	.long LC386
	.long LC639
	.long -226492416
	.long -1
	.long LC640
	.long LC641
	.long -268412891
	.long -239010689
	.long LC372
	.long LC642
	.long -268413915
	.long -239010689
	.long LC374
	.long LC643
	.long -268419035
	.long -239010689
	.long LC376
	.long LC644
	.long -268415963
	.long -239010689
	.long LC378
	.long LC645
	.long -268418011
	.long -239010689
	.long LC380
	.long LC646
	.long -268414939
	.long -239010689
	.long LC382
	.long LC647
	.long -268435419
	.long -239017857
	.long LC384
	.long LC647
	.long -268416987
	.long -239010689
	.long LC385
	.long LC648
	.long -247463936
	.long -239075328
	.long LC649
	.long LC648
	.long -245891072
	.long -235405312
	.long LC650
	.long LC651
	.long -251658240
	.long -239075328
	.long LC649
	.long LC651
	.long -249561088
	.long -235405312
	.long LC652
	.long LC653
	.long -268412880
	.long -239010696
	.long LC654
	.long LC655
	.long -268413904
	.long -239010696
	.long LC656
	.long LC657
	.long -268419024
	.long -239010696
	.long LC658
	.long LC659
	.long -268415952
	.long -239010696
	.long LC660
	.long LC661
	.long -268418000
	.long -239010696
	.long LC662
	.long LC663
	.long -268414928
	.long -239010696
	.long LC664
	.long LC665
	.long -268435408
	.long -239017864
	.long LC666
	.long LC665
	.long -268416976
	.long -239010696
	.long LC667
	.long LC668
	.long -268412890
	.long -239010689
	.long LC372
	.long LC669
	.long -268413914
	.long -239010689
	.long LC374
	.long LC670
	.long -268419034
	.long -239010689
	.long LC376
	.long LC671
	.long -268415962
	.long -239010689
	.long LC378
	.long LC672
	.long -268418010
	.long -239010689
	.long LC380
	.long LC673
	.long -268414938
	.long -239010689
	.long LC382
	.long LC674
	.long -268435418
	.long -239017857
	.long LC384
	.long LC674
	.long -268416986
	.long -239010689
	.long LC385
	.long LC675
	.long -264241151
	.long -239009793
	.long LC676
	.long LC677
	.long -264241152
	.long -239009793
	.long LC676
	.long LC678
	.long -264241133
	.long -239009793
	.long LC676
	.long LC679
	.long -264241130
	.long -239009793
	.long LC676
	.long LC680
	.long -264241129
	.long -239009793
	.long LC676
	.long LC681
	.long -264241134
	.long -239009793
	.long LC676
	.long LC682
	.long -264241131
	.long -239009793
	.long LC676
	.long LC683
	.long -264241132
	.long -239009793
	.long LC676
	.long LC684
	.long -264241138
	.long -239009793
	.long LC676
	.long LC685
	.long -264241124
	.long -239009793
	.long LC676
	.long LC686
	.long -264241127
	.long -239009793
	.long LC676
	.long LC687
	.long -264241128
	.long -239009793
	.long LC676
	.long LC688
	.long -264241123
	.long -239009793
	.long LC676
	.long LC689
	.long -264241126
	.long -239009793
	.long LC676
	.long LC690
	.long -264241125
	.long -239009793
	.long LC676
	.long LC691
	.long -264241149
	.long -239009793
	.long LC676
	.long LC692
	.long -264241146
	.long -239009793
	.long LC676
	.long LC693
	.long -264241150
	.long -239009793
	.long LC676
	.long LC694
	.long -264241147
	.long -239009793
	.long LC676
	.long LC695
	.long -264241148
	.long -239009793
	.long LC676
	.long LC696
	.long -264241145
	.long -239009793
	.long LC676
	.long LC697
	.long -264241135
	.long -239009793
	.long LC676
	.long LC698
	.long -264241136
	.long -239009793
	.long LC676
	.long LC699
	.long -264241122
	.long -239009793
	.long LC676
	.long LC700
	.long -264241121
	.long -239009793
	.long LC676
	.long LC701
	.long -264241137
	.long -239009793
	.long LC676
	.long LC702
	.long -264241143
	.long -239009793
	.long LC676
	.long LC703
	.long -264241141
	.long -239009793
	.long LC676
	.long LC704
	.long -264241142
	.long -239009793
	.long LC676
	.long LC705
	.long -264241139
	.long -239009793
	.long LC676
	.long LC706
	.long -264241140
	.long -239009793
	.long LC676
	.long LC707
	.long -264241144
	.long -239009793
	.long LC676
	.long LC708
	.long -268412892
	.long -239010689
	.long LC372
	.long LC709
	.long -268413916
	.long -239010689
	.long LC374
	.long LC710
	.long -268419036
	.long -239010689
	.long LC376
	.long LC711
	.long -268415964
	.long -239010689
	.long LC378
	.long LC712
	.long -268418012
	.long -239010689
	.long LC380
	.long LC713
	.long -268414940
	.long -239010689
	.long LC382
	.long LC714
	.long -268435420
	.long -239017857
	.long LC384
	.long LC714
	.long -268416988
	.long -239010689
	.long LC385
	.long LC715
	.long -268412889
	.long -239010689
	.long LC372
	.long LC716
	.long -268413913
	.long -239010689
	.long LC374
	.long LC717
	.long -268419033
	.long -239010689
	.long LC376
	.long LC718
	.long -268415961
	.long -239010689
	.long LC378
	.long LC719
	.long -268418009
	.long -239010689
	.long LC380
	.long LC720
	.long -268414937
	.long -239010689
	.long LC382
	.long LC721
	.long -268435417
	.long -239017857
	.long LC384
	.long LC721
	.long -268416985
	.long -239010689
	.long LC385
	.long LC722
	.long -268412914
	.long -239010689
	.long LC372
	.long LC723
	.long -268413938
	.long -239010689
	.long LC374
	.long LC724
	.long -268419058
	.long -239010689
	.long LC376
	.long LC725
	.long -268415986
	.long -239010689
	.long LC378
	.long LC726
	.long -268418034
	.long -239010689
	.long LC380
	.long LC727
	.long -268414962
	.long -239010689
	.long LC382
	.long LC728
	.long -268435442
	.long -239017857
	.long LC384
	.long LC728
	.long -268417010
	.long -239010689
	.long LC385
	.long LC728
	.long -268435442
	.long -239017857
	.long LC386
	.long LC729
	.long -268412926
	.long -239010689
	.long LC372
	.long LC730
	.long -268413950
	.long -239010689
	.long LC374
	.long LC731
	.long -268419070
	.long -239010689
	.long LC376
	.long LC732
	.long -268415998
	.long -239010689
	.long LC378
	.long LC733
	.long -268418046
	.long -239010689
	.long LC380
	.long LC734
	.long -268414974
	.long -239010689
	.long LC382
	.long LC735
	.long -268435454
	.long -239017857
	.long LC384
	.long LC735
	.long -268417022
	.long -239010689
	.long LC385
	.long LC735
	.long -268435454
	.long -239017857
	.long LC386
	.long LC736
	.long -268412924
	.long -239010689
	.long LC372
	.long LC737
	.long -268413948
	.long -239010689
	.long LC374
	.long LC738
	.long -268419068
	.long -239010689
	.long LC376
	.long LC739
	.long -268415996
	.long -239010689
	.long LC378
	.long LC740
	.long -268418044
	.long -239010689
	.long LC380
	.long LC741
	.long -268414972
	.long -239010689
	.long LC382
	.long LC742
	.long -268435452
	.long -239017857
	.long LC384
	.long LC742
	.long -268417020
	.long -239010689
	.long LC385
	.long LC742
	.long -268435452
	.long -239017857
	.long LC386
	.long LC743
	.long -268412888
	.long -239010689
	.long LC372
	.long LC744
	.long -268413912
	.long -239010689
	.long LC374
	.long LC745
	.long -268419032
	.long -239010689
	.long LC376
	.long LC746
	.long -268415960
	.long -239010689
	.long LC378
	.long LC747
	.long -268418008
	.long -239010689
	.long LC380
	.long LC748
	.long -268414936
	.long -239010689
	.long LC382
	.long LC749
	.long -268435416
	.long -239017857
	.long LC384
	.long LC749
	.long -268416984
	.long -239010689
	.long LC385
	.long LC750
	.long -268412913
	.long -239010689
	.long LC372
	.long LC751
	.long -268413937
	.long -239010689
	.long LC374
	.long LC752
	.long -268419057
	.long -239010689
	.long LC376
	.long LC753
	.long -268415985
	.long -239010689
	.long LC378
	.long LC754
	.long -268418033
	.long -239010689
	.long LC380
	.long LC755
	.long -268414961
	.long -239010689
	.long LC382
	.long LC756
	.long -268435441
	.long -239017857
	.long LC384
	.long LC756
	.long -268417009
	.long -239010689
	.long LC385
	.long LC756
	.long -268435441
	.long -239017857
	.long LC386
	.long LC757
	.long -268412919
	.long -239010689
	.long LC372
	.long LC758
	.long -268413943
	.long -239010689
	.long LC374
	.long LC759
	.long -268419063
	.long -239010689
	.long LC376
	.long LC760
	.long -268415991
	.long -239010689
	.long LC378
	.long LC761
	.long -268418039
	.long -239010689
	.long LC380
	.long LC762
	.long -268414967
	.long -239010689
	.long LC382
	.long LC763
	.long -268435447
	.long -239017857
	.long LC384
	.long LC763
	.long -268417015
	.long -239010689
	.long LC385
	.long LC763
	.long -268435447
	.long -239017857
	.long LC386
	.long LC764
	.long -268412910
	.long -239010689
	.long LC372
	.long LC765
	.long -268413934
	.long -239010689
	.long LC374
	.long LC766
	.long -268419054
	.long -239010689
	.long LC376
	.long LC767
	.long -268415982
	.long -239010689
	.long LC378
	.long LC768
	.long -268418030
	.long -239010689
	.long LC380
	.long LC769
	.long -268414958
	.long -239010689
	.long LC382
	.long LC770
	.long -268435438
	.long -239017857
	.long LC384
	.long LC770
	.long -268417006
	.long -239010689
	.long LC385
	.long LC770
	.long -268435438
	.long -239017857
	.long LC386
	.long LC771
	.long -260308991
	.long -234881025
	.long LC640
	.long LC772
	.long -260308992
	.long -234881025
	.long LC640
	.long LC773
	.long -260308973
	.long -234881025
	.long LC640
	.long LC774
	.long -260308970
	.long -234881025
	.long LC640
	.long LC775
	.long -260308969
	.long -234881025
	.long LC640
	.long LC776
	.long -260308974
	.long -234881025
	.long LC640
	.long LC777
	.long -260308971
	.long -234881025
	.long LC640
	.long LC778
	.long -260308972
	.long -234881025
	.long LC640
	.long LC779
	.long -260308978
	.long -234881025
	.long LC640
	.long LC780
	.long -260308964
	.long -234881025
	.long LC640
	.long LC781
	.long -260308967
	.long -234881025
	.long LC640
	.long LC782
	.long -260308968
	.long -234881025
	.long LC640
	.long LC783
	.long -260308963
	.long -234881025
	.long LC640
	.long LC784
	.long -260308966
	.long -234881025
	.long LC640
	.long LC785
	.long -260308965
	.long -234881025
	.long LC640
	.long LC786
	.long -260308989
	.long -234881025
	.long LC640
	.long LC787
	.long -260308986
	.long -234881025
	.long LC640
	.long LC788
	.long -260308990
	.long -234881025
	.long LC640
	.long LC789
	.long -260308987
	.long -234881025
	.long LC640
	.long LC790
	.long -260308988
	.long -234881025
	.long LC640
	.long LC791
	.long -260308985
	.long -234881025
	.long LC640
	.long LC792
	.long -260308975
	.long -234881025
	.long LC640
	.long LC793
	.long -260308976
	.long -234881025
	.long LC640
	.long LC794
	.long -260308962
	.long -234881025
	.long LC640
	.long LC795
	.long -260308961
	.long -234881025
	.long LC640
	.long LC796
	.long -260308977
	.long -234881025
	.long LC640
	.long LC797
	.long -260308983
	.long -234881025
	.long LC640
	.long LC798
	.long -260308981
	.long -234881025
	.long LC640
	.long LC799
	.long -260308982
	.long -234881025
	.long LC640
	.long LC800
	.long -260308979
	.long -234881025
	.long LC640
	.long LC801
	.long -260308980
	.long -234881025
	.long LC640
	.long LC802
	.long -260308984
	.long -234881025
	.long LC640
	.long LC803
	.long -260440063
	.long -234881025
	.long LC804
	.long LC805
	.long -260440064
	.long -234881025
	.long LC804
	.long LC806
	.long -260440045
	.long -234881025
	.long LC804
	.long LC807
	.long -260440042
	.long -234881025
	.long LC804
	.long LC808
	.long -260440041
	.long -234881025
	.long LC804
	.long LC809
	.long -260440046
	.long -234881025
	.long LC804
	.long LC810
	.long -260440043
	.long -234881025
	.long LC804
	.long LC811
	.long -260440044
	.long -234881025
	.long LC804
	.long LC812
	.long -260440050
	.long -234881025
	.long LC804
	.long LC813
	.long -260440036
	.long -234881025
	.long LC804
	.long LC814
	.long -260440039
	.long -234881025
	.long LC804
	.long LC815
	.long -260440040
	.long -234881025
	.long LC804
	.long LC816
	.long -260440035
	.long -234881025
	.long LC804
	.long LC817
	.long -260440038
	.long -234881025
	.long LC804
	.long LC818
	.long -260440037
	.long -234881025
	.long LC804
	.long LC819
	.long -260440061
	.long -234881025
	.long LC804
	.long LC820
	.long -260440058
	.long -234881025
	.long LC804
	.long LC821
	.long -260440062
	.long -234881025
	.long LC804
	.long LC822
	.long -260440059
	.long -234881025
	.long LC804
	.long LC823
	.long -260440060
	.long -234881025
	.long LC804
	.long LC824
	.long -260440057
	.long -234881025
	.long LC804
	.long LC825
	.long -260440047
	.long -234881025
	.long LC804
	.long LC826
	.long -260440048
	.long -234881025
	.long LC804
	.long LC827
	.long -260440034
	.long -234881025
	.long LC804
	.long LC828
	.long -260440033
	.long -234881025
	.long LC804
	.long LC829
	.long -260440049
	.long -234881025
	.long LC804
	.long LC830
	.long -260440055
	.long -234881025
	.long LC804
	.long LC831
	.long -260440053
	.long -234881025
	.long LC804
	.long LC832
	.long -260440054
	.long -234881025
	.long LC804
	.long LC833
	.long -260440051
	.long -234881025
	.long LC804
	.long LC834
	.long -260440052
	.long -234881025
	.long LC804
	.long LC835
	.long -260440056
	.long -234881025
	.long LC804
	.long LC836
	.long -260374527
	.long -234881025
	.long LC837
	.long LC838
	.long -260374528
	.long -234881025
	.long LC837
	.long LC839
	.long -260374509
	.long -234881025
	.long LC837
	.long LC840
	.long -260374506
	.long -234881025
	.long LC837
	.long LC841
	.long -260374505
	.long -234881025
	.long LC837
	.long LC842
	.long -260374510
	.long -234881025
	.long LC837
	.long LC843
	.long -260374507
	.long -234881025
	.long LC837
	.long LC844
	.long -260374508
	.long -234881025
	.long LC837
	.long LC845
	.long -260374514
	.long -234881025
	.long LC837
	.long LC846
	.long -260374500
	.long -234881025
	.long LC837
	.long LC847
	.long -260374503
	.long -234881025
	.long LC837
	.long LC848
	.long -260374504
	.long -234881025
	.long LC837
	.long LC849
	.long -260374499
	.long -234881025
	.long LC837
	.long LC850
	.long -260374502
	.long -234881025
	.long LC837
	.long LC851
	.long -260374501
	.long -234881025
	.long LC837
	.long LC852
	.long -260374525
	.long -234881025
	.long LC837
	.long LC853
	.long -260374522
	.long -234881025
	.long LC837
	.long LC854
	.long -260374526
	.long -234881025
	.long LC837
	.long LC855
	.long -260374523
	.long -234881025
	.long LC837
	.long LC856
	.long -260374524
	.long -234881025
	.long LC837
	.long LC857
	.long -260374521
	.long -234881025
	.long LC837
	.long LC858
	.long -260374511
	.long -234881025
	.long LC837
	.long LC859
	.long -260374512
	.long -234881025
	.long LC837
	.long LC860
	.long -260374498
	.long -234881025
	.long LC837
	.long LC861
	.long -260374497
	.long -234881025
	.long LC837
	.long LC862
	.long -260374513
	.long -234881025
	.long LC837
	.long LC863
	.long -260374519
	.long -234881025
	.long LC837
	.long LC864
	.long -260374517
	.long -234881025
	.long LC837
	.long LC865
	.long -260374518
	.long -234881025
	.long LC837
	.long LC866
	.long -260374515
	.long -234881025
	.long LC837
	.long LC867
	.long -260374516
	.long -234881025
	.long LC837
	.long LC868
	.long -260374520
	.long -234881025
	.long LC837
	.long LC869
	.long -268412870
	.long -239010689
	.long LC870
	.long LC871
	.long -268413894
	.long -239010689
	.long LC872
	.long LC873
	.long -268419014
	.long -239010689
	.long LC874
	.long LC875
	.long -268415942
	.long -239010689
	.long LC876
	.long LC877
	.long -268417990
	.long -239010689
	.long LC878
	.long LC879
	.long -268414918
	.long -239010689
	.long LC880
	.long LC881
	.long -268435398
	.long -239017857
	.long LC882
	.long LC881
	.long -268416966
	.long -239010689
	.long LC883
	.long LC884
	.long -268412911
	.long -239010689
	.long LC372
	.long LC885
	.long -268413935
	.long -239010689
	.long LC374
	.long LC886
	.long -268419055
	.long -239010689
	.long LC376
	.long LC887
	.long -268415983
	.long -239010689
	.long LC378
	.long LC888
	.long -268418031
	.long -239010689
	.long LC380
	.long LC889
	.long -268414959
	.long -239010689
	.long LC382
	.long LC890
	.long -268435439
	.long -239017857
	.long LC384
	.long LC890
	.long -268417007
	.long -239010689
	.long LC385
	.long LC890
	.long -268435439
	.long -239017857
	.long LC386
	.long LC891
	.long 1627389952
	.long -16777216
	.long LC51
	.long LC891
	.long 1317011456
	.long -4194304
	.long LC176
	.long LC892
	.long 1610612736
	.long -16777216
	.long LC51
	.long LC892
	.long 1321205760
	.long -4194304
	.long LC176
	.long LC893
	.long 1644167168
	.long -16777216
	.long LC51
	.long LC894
	.long 1660944384
	.long -16777216
	.long LC51
	.long LC895
	.long 1677721600
	.long -16777216
	.long LC51
	.long LC896
	.long 1694498816
	.long -16777216
	.long LC51
	.long LC897
	.long 1711276032
	.long -16777216
	.long LC51
	.long LC898
	.long 1728053248
	.long -16777216
	.long LC51
	.long LC899
	.long 1744830464
	.long -16777216
	.long LC51
	.long LC900
	.long 1761607680
	.long -16777216
	.long LC51
	.long LC901
	.long 1778384896
	.long -16777216
	.long LC51
	.long LC902
	.long 1795162112
	.long -16777216
	.long LC51
	.long LC903
	.long 1811939328
	.long -16777216
	.long LC51
	.long LC904
	.long 1828716544
	.long -16777216
	.long LC51
	.long LC905
	.long 1845493760
	.long -16777216
	.long LC51
	.long LC906
	.long 1862270976
	.long -16777216
	.long LC51
	.long LC907
	.long 1879048192
	.long -251658240
	.long LC204
	.long LC908
	.long 1879048192
	.long -251658240
	.long LC204
	.long LC909
	.long 541065216
	.long -239075328
	.long LC4
	.long LC910
	.long 809500672
	.long -239075328
	.long LC6
	.long LC911
	.long 268435456
	.long -268435456
	.long LC194
	.long LC912
	.long 536870912
	.long -268435456
	.long LC201
	.long LC912
	.long 541065216
	.long -239075328
	.long LC4
	.long LC912
	.long 1314914304
	.long -524288
	.long LC202
	.long LC912
	.long 1315438592
	.long -524288
	.long LC203
	.long LC912
	.long 1879048192
	.long -251658240
	.long LC204
	.long LC913
	.long 1220542464
	.long -4194304
	.long LC206
	.long LC913
	.long 1222639616
	.long -524288
	.long LC207
	.long LC913
	.long 1287651328
	.long -4194304
	.long LC208
	.long LC913
	.long 1289224192
	.long -524288
	.long LC209
	.long LC914
	.long 1216348160
	.long -4194304
	.long LC206
	.long LC914
	.long 1218445312
	.long -524288
	.long LC207
	.long LC914
	.long 1283457024
	.long -4194304
	.long LC208
	.long LC914
	.long 1285029888
	.long -524288
	.long LC209
	.long LC915
	.long 21495808
	.long -235405312
	.long LC212
	.long LC915
	.long 29884416
	.long -235405312
	.long LC213
	.long LC916
	.long 17301504
	.long -235405312
	.long LC212
	.long LC916
	.long 25690112
	.long -235405312
	.long LC213
	.long LC917
	.long 1879048192
	.long -251658240
	.long LC204
	.long LC918
	.long 805306368
	.long -268435456
	.long LC217
	.long LC918
	.long 809500672
	.long -239075328
	.long LC6
	.long LC918
	.long 1086324736
	.long -4194304
	.long LC218
	.long LC918
	.long 1119879168
	.long -4194304
	.long LC219
	.long LC918
	.long 1153433600
	.long -4194304
	.long LC220
	.long LC918
	.long 1186988032
	.long -4194304
	.long LC221
	.long LC919
	.long 234881024
	.long -4190209
	.long LC223
	.long LC919
	.long 234883072
	.long -4190209
	.long LC224
	.long LC920
	.long 243269632
	.long -4190209
	.long LC223
	.long LC920
	.long 243271680
	.long -4190209
	.long LC224
	.long LC921
	.long 239075328
	.long -4190209
	.long LC223
	.long LC921
	.long 239077376
	.long -4190209
	.long LC224
.globl _numopcodes
	.even
_numopcodes:
	.long 1010
.globl _endop
	.align 2
_endop:
	.long _m68k_opcodes+16160
.globl _fpcr_names
.text
LC922:
	.ascii "fpiar\0"
LC923:
	.ascii "fpsr\0"
LC924:
	.ascii "fpiar/fpsr\0"
LC925:
	.ascii "fpcr\0"
LC926:
	.ascii "fpiar/fpcr\0"
LC927:
	.ascii "fpsr/fpcr\0"
LC928:
	.ascii "fpiar-fpcr\0"
.data
	.align 2
_fpcr_names:
	.long LC174
	.long LC922
	.long LC923
	.long LC924
	.long LC925
	.long LC926
	.long LC927
	.long LC928
.text
LC929:
	.ascii "0%o\0"
LC930:
	.ascii "%s\0"
LC931:
	.ascii ",\0"
	.even
.globl _print_insn
_print_insn:
	link a6,#-28
	moveml #0x1f20,sp@-
	pea 22:w
	moveq #-22,d0
	addl a6,d0
	movel d0,sp@-
	movel a6@(8),sp@-
	jbsr _read_memory
	clrl d5
	moveq #-1,d7
	movel d7,a6@(-26)
	clrl d3
	addw #12,sp
L2:
	cmpl #1009,d3
	jhi L3
	movel d3,d1
	asll #4,d1
	lea _m68k_opcodes,a0
	movel a0@(4,d1:l),d0
	movel d3,d2
	asll #4,d2
	lea _m68k_opcodes,a0
	movel a0@(8,d2:l),d1
	clrl d2
	moveb a6@(-22),d2
	movel d1,d6
	moveq #24,d7
	lsrl d7,d6
	andl d6,d2
	movel d0,d6
	lsrl d7,d6
	andl #255,d6
	cmpl d2,d6
	jne L5
	clrl d2
	moveb a6@(-21),d2
	movel d1,d6
	moveq #16,d7
	lsrl d7,d6
	andl d6,d2
	movel d0,d6
	lsrl d7,d6
	andl #255,d6
	cmpl d2,d6
	jne L5
	clrl d2
	moveb a6@(-20),d2
	movel d1,d6
	lsrl #8,d6
	andl d6,d2
	movel d0,d6
	lsrl #8,d6
	andl #255,d6
	cmpl d2,d6
	jne L5
	clrl d2
	moveb a6@(-19),d2
	andl d1,d2
	movel d0,d6
	andl #255,d6
	cmpl d2,d6
	jne L5
	movel d3,d2
	asll #4,d2
	lea _m68k_opcodes,a0
	movel a0@(12,d2:l),a2
L6:
	tstb a2@
	jeq L7
	cmpb #68,a2@(1)
	jne L9
	jra L7
L9:
L8:
	addqw #2,a2
	jra L6
L7:
	tstb a2@
	jne L10
	movel d3,d2
	asll #4,d2
	lea _m68k_opcodes,a0
	movel a0@(12,d2:l),a2
L11:
	tstb a2@
	jeq L12
	cmpb #116,a2@(1)
	jne L14
	jra L12
L14:
L13:
	addqw #2,a2
	jra L11
L12:
L10:
	tstb a2@
	jne L15
	cmpl d1,d5
	jcc L15
	movel d3,a6@(-26)
	movel d1,d5
L15:
L5:
L4:
	addql #1,d3
	jra L2
L3:
	tstl a6@(-26)
	jge L16
	clrl d0
	moveb a6@(-22),d0
	asll #8,d0
	clrl d1
	moveb a6@(-21),d1
	addl d1,d0
	movel d0,sp@-
	pea LC929
	movel a6@(12),sp@-
	jbsr _fprintf
	moveq #2,d0
	jra L1
L16:
	movel a6@(-26),d0
	asll #4,d0
	lea _m68k_opcodes,a0
	movel a0@(d0:l),sp@-
	pea LC930
	movel a6@(12),sp@-
	jbsr _fprintf
	moveq #-22,d4
	addl a6,d4
	addql #2,d4
	movel a6@(-26),d0
	asll #4,d0
	lea _m68k_opcodes,a0
	movel a0@(12,d0:l),a2
	addw #12,sp
L17:
	tstb a2@
	jeq L18
	cmpb #35,a2@
	jne L20
	cmpb #108,a2@(1)
	jne L21
	moveq #-22,d0
	addl a6,d0
	subl d4,d0
	negl d0
	moveq #5,d7
	cmpl d0,d7
	jlt L21
	moveq #-22,d4
	addl a6,d4
	addql #6,d4
	jra L22
L21:
	moveq #-22,d0
	addl a6,d0
	subl d4,d0
	negl d0
	moveq #3,d7
	cmpl d0,d7
	jlt L23
	cmpb #67,a2@(1)
	jeq L23
	cmpb #56,a2@(1)
	jeq L23
	moveq #-22,d4
	addl a6,d4
	addql #4,d4
L23:
L22:
L20:
	cmpb #48,a2@(1)
	jle L24
	cmpb #51,a2@(1)
	jgt L24
	moveq #-22,d0
	addl a6,d0
	subl d4,d0
	negl d0
	moveq #3,d7
	cmpl d0,d7
	jlt L24
	moveq #-22,d4
	addl a6,d4
	addql #4,d4
L24:
	cmpb #51,a2@(1)
	jle L25
	cmpb #54,a2@(1)
	jgt L25
	moveq #-22,d0
	addl a6,d0
	subl d4,d0
	negl d0
	moveq #5,d7
	cmpl d0,d7
	jlt L25
	moveq #-22,d4
	addl a6,d4
	addql #6,d4
L25:
L19:
	addqw #2,a2
	jra L17
L18:
	movel a6@(-26),d0
	asll #4,d0
	lea _m68k_opcodes,a0
	movel a0@(12,d0:l),a2
	tstb a2@
	jeq L26
	movel a6@(12),sp@-
	pea 32:w
	jbsr _fputc
	addqw #8,sp
L26:
	nop
L27:
	tstb a2@
	jeq L28
	movel a6@(12),sp@-
	movel d4,d0
	addl a6@(8),d0
	moveq #-22,d1
	addl a6,d1
	subl d1,d0
	movel d0,sp@-
	movel d4,sp@-
	moveq #-22,d0
	addl a6,d0
	movel d0,sp@-
	movel a2,sp@-
	jbsr _print_insn_arg
	movel d0,d4
	addqw #2,a2
	addw #20,sp
	tstb a2@
	jeq L29
	cmpb #73,a2@(-2)
	jeq L29
	cmpb #107,a2@
	jeq L29
	pea LC931
	movel a6@(12),sp@-
	jbsr _fprintf
	addqw #8,sp
L29:
	jra L27
L28:
	moveq #-22,d0
	addl a6,d0
	subl d4,d0
	negl d0
	jra L1
L1:
	moveml a6@(-52),#0x4f8
	unlk a6
	rts
LC932:
	.ascii "ccr\0"
LC933:
	.ascii "sr\0"
LC934:
	.ascii "usp\0"
LC935:
	.ascii "sfc\0"
LC936:
	.ascii "dfc\0"
LC937:
	.ascii "cacr\0"
LC938:
	.ascii "vbr\0"
LC939:
	.ascii "caar\0"
LC940:
	.ascii "msp\0"
LC941:
	.ascii "isp\0"
.data
	.even
_names.0:
	.long LC935
	.long 0
	.long LC936
	.long 1
	.long LC937
	.long 2
	.long LC934
	.long 2048
	.long LC938
	.long 2049
	.long LC939
	.long 2050
	.long LC940
	.long 2051
	.long LC941
	.long 2052
.text
LC942:
	.ascii "%d\0"
LC943:
	.ascii "#%d\0"
LC944:
	.ascii "fp%d\0"
LC945:
	.ascii "(%s)+\0"
LC946:
	.ascii "-(%s)\0"
LC947:
	.ascii "{%s}\0"
LC948:
	.ascii "{#%d}\0"
LC949:
	.ascii "Invalid arg format in opcode table: \"%c%c\".\0"
LC950:
	.ascii "%d(%s)\0"
LC951:
	.ascii "(cpid=%d) \0"
LC952:
	.ascii "(%s)\0"
LC953:
	.ascii "@#\0"
	.even
LC954:
	.double 0r0
LC955:
	.ascii "#%g\0"
LC956:
	.ascii "<invalid address mode 0%o>\0"
LC957:
	.ascii "Invalid arg format in opcode table: \"%c\".\0"
	.even
_print_insn_arg:
	link a6,#-8
	moveml #0x1f30,sp@-
	movel a6@(16),a2
	movel a6@(8),a0
	addqw #1,a0
	moveb a0@,d4
	extbl d4
	movel a6@(8),a0
	moveb a0@,d0
	extbl d0
	moveq #-33,d2
	addl d2,d0
	moveq #93,d2
	cmpl d2,d0
	jhi L153
LI154:
	movew pc@(L154-LI154-2:b,d0:l:2),d0
	jmp pc@(2,d0:w)
L154:
	.word L115-L154
	.word L153-L154
	.word L61-L154
	.word L116-L154
	.word L116-L154
	.word L116-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L110-L154
	.word L53-L154
	.word L153-L154
	.word L54-L154
	.word L153-L154
	.word L118-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L113-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L117-L154
	.word L117-L154
	.word L47-L154
	.word L89-L154
	.word L32-L154
	.word L46-L154
	.word L153-L154
	.word L49-L154
	.word L153-L154
	.word L153-L154
	.word L107-L154
	.word L35-L154
	.word L153-L154
	.word L153-L154
	.word L43-L154
	.word L153-L154
	.word L50-L154
	.word L153-L154
	.word L41-L154
	.word L48-L154
	.word L33-L154
	.word L45-L154
	.word L34-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L76-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L105-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L55-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L106-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L153-L154
	.word L111-L154
L32:
	pea LC932
	movel a6@(24),sp@-
	jbsr _fprintf
	addqw #8,sp
	jra L31
L33:
	pea LC933
	movel a6@(24),sp@-
	jbsr _fprintf
	addqw #8,sp
	jra L31
L34:
	pea LC934
	movel a6@(24),sp@-
	jbsr _fprintf
	addqw #8,sp
	jra L31
L35:
	pea 12:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d3
	moveq #7,d2
	movel d2,a6@(-4)
	addw #12,sp
L36:
	tstl a6@(-4)
	jlt L37
	movel a6@(-4),d0
	asll #3,d0
	lea _names.0,a0
	cmpl a0@(4,d0:l),d3
	jne L39
	movel a6@(-4),d0
	asll #3,d0
	lea _names.0,a0
	movel a0@(d0:l),sp@-
	movel a6@(24),sp@-
	jbsr _fprintf
	addqw #8,sp
	jra L37
L39:
L38:
	subql #1,a6@(-4)
	jra L36
L37:
	tstl a6@(-4)
	jge L40
	movel d3,sp@-
	pea LC942
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #12,sp
L40:
	jra L31
L41:
	pea 3:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d3
	addw #12,sp
	tstl d3
	jne L42
	moveq #8,d3
L42:
	movel d3,sp@-
	pea LC943
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #12,sp
	jra L31
L43:
	pea 8:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d3
	movel d3,d0
	andl #128,d0
	addw #12,sp
	tstl d0
	jeq L44
	addl #-256,d3
L44:
	movel d3,sp@-
	pea LC943
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #12,sp
	jra L31
L45:
	pea 4:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d3
	movel d3,sp@-
	pea LC943
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #24,sp
	jra L31
L46:
	pea 3:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d0
	asll #2,d0
	lea _reg_names,a0
	movel a0@(d0:l),sp@-
	pea LC930
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #24,sp
	jra L31
L47:
	pea 3:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d0
	asll #2,d0
	lea _reg_names+32,a0
	movel a0@(d0:l),sp@-
	pea LC930
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #24,sp
	jra L31
L48:
	pea 4:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d0
	asll #2,d0
	lea _reg_names,a0
	movel a0@(d0:l),sp@-
	pea LC930
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #24,sp
	jra L31
L49:
	pea 3:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d0
	movel d0,sp@-
	pea LC944
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #24,sp
	jra L31
L50:
	pea 6:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d3
	moveq #32,d0
	andl d3,d0
	addw #12,sp
	tstl d0
	jeq L51
	moveq #7,d0
	andl d3,d0
	asll #2,d0
	lea _reg_names,a0
	movel a0@(d0:l),sp@-
	pea LC930
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #12,sp
	jra L52
L51:
	movel d3,sp@-
	pea LC942
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #12,sp
L52:
	jra L31
L53:
	pea 3:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d0
	asll #2,d0
	lea _reg_names+32,a0
	movel a0@(d0:l),sp@-
	pea LC945
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #24,sp
	jra L31
L54:
	pea 3:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d0
	asll #2,d0
	lea _reg_names+32,a0
	movel a0@(d0:l),sp@-
	pea LC946
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #24,sp
	jra L31
L55:
	moveq #107,d2
	cmpl d4,d2
	jne L56
	pea 3:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d0
	asll #2,d0
	lea _reg_names,a0
	movel a0@(d0:l),sp@-
	pea LC947
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #24,sp
	jra L57
L56:
	moveq #67,d2
	cmpl d4,d2
	jne L58
	pea 7:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d3
	addw #12,sp
	moveq #63,d2
	cmpl d3,d2
	jge L59
	moveq #-128,d2
	addl d2,d3
L59:
	movel d3,sp@-
	pea LC948
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #12,sp
	jra L60
L58:
	movel d4,sp@-
	movel a6@(8),a0
	moveb a0@,d0
	extbl d0
	movel d0,sp@-
	pea LC949
	jbsr _error
	addw #12,sp
L60:
L57:
	jra L31
L61:
	movel a6@(12),a3
	addqw #2,a3
	moveq #115,d2
	cmpl d4,d2
	jne L62
	pea 4:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d3
	addw #12,sp
	jra L63
L62:
	moveq #67,d2
	cmpl d4,d2
	jne L64
	pea 7:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d3
	addw #12,sp
	jra L65
L64:
	moveq #56,d2
	cmpl d4,d2
	jne L66
	pea 3:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d3
	addw #12,sp
	jra L67
L66:
	moveq #51,d2
	cmpl d4,d2
	jne L68
	pea 8:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d3
	addw #12,sp
	jra L69
L68:
	moveq #98,d2
	cmpl d4,d2
	jne L70
	addqw #2,a3
	moveb a3@(-1),d3
	extbl d3
	jra L71
L70:
	moveq #119,d2
	cmpl d4,d2
	jne L72
	addqw #2,a3
	moveb a3@(-2),d0
	extbl d0
	asll #8,d0
	clrl d1
	moveb a3@(-1),d1
	movel d0,d3
	addl d1,d3
	jra L73
L72:
	moveq #108,d2
	cmpl d4,d2
	jne L74
	addqw #4,a3
	clrl d0
	moveb a3@(-4),d0
	asll #8,d0
	clrl d1
	moveb a3@(-3),d1
	addl d1,d0
	asll #8,d0
	clrl d1
	moveb a3@(-2),d1
	addl d1,d0
	asll #8,d0
	clrl d1
	moveb a3@(-1),d1
	movel d0,d3
	addl d1,d3
	jra L75
L74:
	movel d4,sp@-
	movel a6@(8),a0
	moveb a0@,d0
	extbl d0
	movel d0,sp@-
	pea LC949
	jbsr _error
	addw #12,sp
L75:
L73:
L71:
L69:
L67:
L65:
L63:
	movel d3,sp@-
	pea LC943
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #12,sp
	jra L31
L76:
	moveq #115,d2
	cmpl d4,d2
	jne L77
	pea 4:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d3
	addw #12,sp
	jra L78
L77:
	moveq #67,d2
	cmpl d4,d2
	jne L79
	pea 7:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d3
	addw #12,sp
	jra L80
L79:
	moveq #56,d2
	cmpl d4,d2
	jne L81
	pea 3:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d3
	addw #12,sp
	jra L82
L81:
	moveq #98,d2
	cmpl d4,d2
	jne L83
	addqw #2,a2
	moveb a2@(-1),d3
	extbl d3
	jra L84
L83:
	moveq #119,d2
	cmpl d4,d2
	jne L85
	addqw #2,a2
	moveb a2@(-2),d0
	extbl d0
	asll #8,d0
	clrl d1
	moveb a2@(-1),d1
	movel d0,d3
	addl d1,d3
	jra L86
L85:
	moveq #108,d2
	cmpl d4,d2
	jne L87
	addqw #4,a2
	clrl d0
	moveb a2@(-4),d0
	asll #8,d0
	clrl d1
	moveb a2@(-3),d1
	addl d1,d0
	asll #8,d0
	clrl d1
	moveb a2@(-2),d1
	addl d1,d0
	asll #8,d0
	clrl d1
	moveb a2@(-1),d1
	movel d0,d3
	addl d1,d3
	jra L88
L87:
	movel d4,sp@-
	movel a6@(8),a0
	moveb a0@,d0
	extbl d0
	movel d0,sp@-
	pea LC949
	jbsr _error
	addw #12,sp
L88:
L86:
L84:
L82:
L80:
L78:
	movel d3,sp@-
	pea LC943
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #12,sp
	jra L31
L89:
	moveq #98,d2
	cmpl d4,d2
	jne L90
	addqw #2,a2
	moveb a2@(-1),d3
	extbl d3
	jra L91
L90:
	moveq #119,d2
	cmpl d4,d2
	jne L92
	addqw #2,a2
	moveb a2@(-2),d0
	extbl d0
	asll #8,d0
	clrl d1
	moveb a2@(-1),d1
	movel d0,d3
	addl d1,d3
	jra L93
L92:
	moveq #108,d2
	cmpl d4,d2
	jne L94
	addqw #4,a2
	clrl d0
	moveb a2@(-4),d0
	asll #8,d0
	clrl d1
	moveb a2@(-3),d1
	addl d1,d0
	asll #8,d0
	clrl d1
	moveb a2@(-2),d1
	addl d1,d0
	asll #8,d0
	clrl d1
	moveb a2@(-1),d1
	movel d0,d3
	addl d1,d3
	jra L95
L94:
	moveq #103,d2
	cmpl d4,d2
	jne L96
	movel a6@(12),a0
	addqw #1,a0
	moveb a0@,d3
	extbl d3
	tstl d3
	jne L97
	addqw #2,a2
	moveb a2@(-2),d0
	extbl d0
	asll #8,d0
	clrl d1
	moveb a2@(-1),d1
	movel d0,d3
	addl d1,d3
	jra L98
L97:
	moveq #-1,d2
	cmpl d3,d2
	jne L99
	addqw #4,a2
	clrl d0
	moveb a2@(-4),d0
	asll #8,d0
	clrl d1
	moveb a2@(-3),d1
	addl d1,d0
	asll #8,d0
	clrl d1
	moveb a2@(-2),d1
	addl d1,d0
	asll #8,d0
	clrl d1
	moveb a2@(-1),d1
	movel d0,d3
	addl d1,d3
L99:
L98:
	jra L100
L96:
	moveq #99,d2
	cmpl d4,d2
	jne L101
	movel a6@(12),a0
	addqw #1,a0
	moveb a0@,d0
	andb #64,d0
	tstb d0
	jeq L102
	addqw #4,a2
	clrl d0
	moveb a2@(-4),d0
	asll #8,d0
	clrl d1
	moveb a2@(-3),d1
	addl d1,d0
	asll #8,d0
	clrl d1
	moveb a2@(-2),d1
	addl d1,d0
	asll #8,d0
	clrl d1
	moveb a2@(-1),d1
	movel d0,d3
	addl d1,d3
	jra L103
L102:
	addqw #2,a2
	moveb a2@(-2),d0
	extbl d0
	asll #8,d0
	clrl d1
	moveb a2@(-1),d1
	movel d0,d3
	addl d1,d3
L103:
	jra L104
L101:
	movel d4,sp@-
	movel a6@(8),a0
	moveb a0@,d0
	extbl d0
	movel d0,sp@-
	pea LC949
	jbsr _error
	addw #12,sp
L104:
L100:
L95:
L93:
L91:
	movel a6@(24),sp@-
	movel d3,d0
	addl a6@(20),d0
	movel d0,sp@-
	jbsr _print_address
	addqw #8,sp
	jra L31
L105:
	addqw #2,a2
	moveb a2@(-2),d0
	extbl d0
	asll #8,d0
	clrl d1
	moveb a2@(-1),d1
	movel d0,d3
	addl d1,d3
	pea 3:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d0
	asll #2,d0
	lea _reg_names,a0
	movel a0@(d0:l),sp@-
	movel d3,sp@-
	pea LC950
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #28,sp
	jra L31
L106:
	pea 3:w
	movel d4,sp@-
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d0
	asll #2,d0
	lea _fpcr_names,a0
	movel a0@(d0:l),sp@-
	pea LC930
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #24,sp
	jra L31
L107:
	pea 3:w
	pea 100:w
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d3
	addw #12,sp
	moveq #1,d2
	cmpl d3,d2
	jeq L108
	movel d3,sp@-
	pea LC951
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #12,sp
L108:
	moveq #105,d2
	cmpl d4,d2
	jne L109
	addqw #2,a2
L109:
	jra L31
L110:
L111:
L112:
L113:
L114:
L115:
L116:
L117:
L118:
L119:
	moveq #100,d2
	cmpl d4,d2
	jne L120
	pea 6:w
	pea 120:w
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d3
	moveq #7,d0
	andl d3,d0
	asll #3,d0
	movel d3,d1
	asrl #3,d1
	moveq #7,d2
	andl d2,d1
	movel d0,d3
	addl d1,d3
	addw #12,sp
	jra L121
L120:
	pea 6:w
	pea 115:w
	movel a6@(12),sp@-
	jbsr _fetch_arg
	movel d0,d3
	addw #12,sp
L121:
	moveq #7,d0
	andl d3,d0
	movel d0,d2
	addql #8,d2
	movel d2,a6@(-4)
	movel a6@(-4),d0
	asll #2,d0
	lea _reg_names,a0
	movel a0@(d0:l),d5
	movel d3,d0
	asrl #3,d0
	clrl d2
	addl d2,d0
	moveq #7,d2
	cmpl d2,d0
	jhi L152
LI151:
	movew pc@(L151-LI151-2:b,d0:l:2),d0
	jmp pc@(2,d0:w)
L151:
	.word L123-L151
	.word L124-L151
	.word L125-L151
	.word L126-L151
	.word L127-L151
	.word L128-L151
	.word L129-L151
	.word L130-L151
L123:
	movel d3,d0
	asll #2,d0
	lea _reg_names,a0
	movel a0@(d0:l),sp@-
	pea LC930
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #12,sp
	jra L122
L124:
	movel d5,sp@-
	pea LC930
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #12,sp
	jra L122
L125:
	movel d5,sp@-
	pea LC952
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #12,sp
	jra L122
L126:
	movel d5,sp@-
	pea LC945
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #12,sp
	jra L122
L127:
	movel d5,sp@-
	pea LC946
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #12,sp
	jra L122
L128:
	addqw #2,a2
	moveb a2@(-2),d0
	extbl d0
	asll #8,d0
	clrl d1
	moveb a2@(-1),d1
	movel d0,d3
	addl d1,d3
	movel d5,sp@-
	movel d3,sp@-
	pea LC950
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #16,sp
	jra L122
L129:
	movel a6@(24),sp@-
	movel a6@(20),sp@-
	movel a2,sp@-
	movel a6@(-4),sp@-
	jbsr _print_indexed
	movel d0,a2
	addw #16,sp
	jra L122
L130:
	moveq #7,d0
	andl d3,d0
	clrl d2
	addl d2,d0
	moveq #4,d2
	cmpl d2,d0
	jhi L149
LI150:
	movew pc@(L150-LI150-2:b,d0:l:2),d0
	jmp pc@(2,d0:w)
L150:
	.word L132-L150
	.word L133-L150
	.word L134-L150
	.word L135-L150
	.word L136-L150
L132:
	addqw #2,a2
	moveb a2@(-2),d0
	extbl d0
	asll #8,d0
	clrl d1
	moveb a2@(-1),d1
	movel d0,d3
	addl d1,d3
	pea LC953
	movel a6@(24),sp@-
	jbsr _fprintf
	movel a6@(24),sp@-
	movel d3,sp@-
	jbsr _print_address
	addw #16,sp
	jra L131
L133:
	addqw #4,a2
	clrl d0
	moveb a2@(-4),d0
	asll #8,d0
	clrl d1
	moveb a2@(-3),d1
	addl d1,d0
	asll #8,d0
	clrl d1
	moveb a2@(-2),d1
	addl d1,d0
	asll #8,d0
	clrl d1
	moveb a2@(-1),d1
	movel d0,d3
	addl d1,d3
	pea LC953
	movel a6@(24),sp@-
	jbsr _fprintf
	movel a6@(24),sp@-
	movel d3,sp@-
	jbsr _print_address
	addw #16,sp
	jra L131
L134:
	addqw #2,a2
	moveb a2@(-2),d0
	extbl d0
	asll #8,d0
	clrl d1
	moveb a2@(-1),d1
	movel d0,d3
	addl d1,d3
	movel a6@(24),sp@-
	movel d3,d0
	addl a6@(20),d0
	movel d0,sp@-
	jbsr _print_address
	addqw #8,sp
	jra L131
L135:
	movel a6@(24),sp@-
	movel a6@(20),sp@-
	movel a2,sp@-
	pea -1:w
	jbsr _print_indexed
	movel d0,a2
	addw #16,sp
	jra L131
L136:
	moveq #1,d2
	movel d2,a6@(-8)
	moveq #-70,d0
	addl d4,d0
	moveq #50,d2
	cmpl d2,d0
	jhi L145
LI146:
	movew pc@(L146-LI146-2:b,d0:l:2),d0
	jmp pc@(2,d0:w)
L146:
	.word L142-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L138-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L141-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L140-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L144-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L145-L146
	.word L139-L146
	.word L143-L146
L138:
	addqw #2,a2
	moveb a2@(-1),d3
	extbl d3
	clrl a6@(-8)
	jra L137
L139:
	addqw #2,a2
	moveb a2@(-2),d0
	extbl d0
	asll #8,d0
	clrl d1
	moveb a2@(-1),d1
	movel d0,d3
	addl d1,d3
	clrl a6@(-8)
	jra L137
L140:
	addqw #4,a2
	clrl d0
	moveb a2@(-4),d0
	asll #8,d0
	clrl d1
	moveb a2@(-3),d1
	addl d1,d0
	asll #8,d0
	clrl d1
	moveb a2@(-2),d1
	addl d1,d0
	asll #8,d0
	clrl d1
	moveb a2@(-1),d1
	movel d0,d3
	addl d1,d3
	clrl a6@(-8)
	jra L137
L141:
	addqw #4,a2
	fmoves a2@(-4),fp0
	fmoved fp0,sp@-
	movel sp@+,d6
	movel sp@+,d7
	jra L137
L142:
	addqw #8,a2
	movel a2@(-8),d6
	movel a2@(-4),d7
	jra L137
L143:
	addw #12,a2
	movel LC954,d6
	movel LC954+4,d7
	jra L137
L144:
	addw #12,a2
	movel LC954,d6
	movel LC954+4,d7
	jra L137
L145:
	movel d4,sp@-
	movel a6@(8),a0
	moveb a0@,d0
	extbl d0
	movel d0,sp@-
	pea LC949
	jbsr _error
	addw #12,sp
L137:
	tstl a6@(-8)
	jeq L147
	movel d7,sp@-
	movel d6,sp@-
	pea LC955
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #16,sp
	jra L148
L147:
	movel d3,sp@-
	pea LC943
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #12,sp
L148:
	jra L131
L149:
	movel d3,sp@-
	pea LC956
	movel a6@(24),sp@-
	jbsr _fprintf
	addw #12,sp
L131:
L152:
L122:
	jra L31
L153:
	movel a6@(8),a0
	moveb a0@,d0
	extbl d0
	movel d0,sp@-
	pea LC957
	jbsr _error
	addqw #8,sp
L31:
	movel a2,d0
	jra L30
L30:
	moveml a6@(-36),#0xcf8
	unlk a6
	rts
	.even
_fetch_arg:
	link a6,#0
	movel d3,sp@-
	moveb a6@(15),a6@(15)
	moveb a6@(15),d0
	extbl d0
	moveq #-49,d2
	addl d2,d0
	moveq #71,d2
	cmpl d2,d0
	jhi L171
LI172:
	movew pc@(L172-LI172-2:b,d0:l:2),d0
	jmp pc@(2,d0:w)
L172:
	.word L162-L172
	.word L163-L172
	.word L164-L172
	.word L166-L172
	.word L167-L172
	.word L168-L172
	.word L169-L172
	.word L170-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L161-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L158-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L165-L172
	.word L160-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L157-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L171-L172
	.word L159-L172
L157:
	movel a6@(8),a0
	addqw #1,a0
	clrl d3
	moveb a0@,d3
	jra L156
L158:
	movel a6@(8),a0
	clrl d0
	moveb a0@,d0
	asll #8,d0
	movel a0,a0
	addqw #1,a0
	clrl d1
	moveb a0@,d1
	movel d0,d3
	addl d1,d3
	moveq #9,d2
	asrl d2,d3
	jra L156
L159:
	movel a6@(8),a0
	clrl d0
	moveb a0@,d0
	asll #8,d0
	movel a0,a0
	addqw #1,a0
	clrl d1
	moveb a0@,d1
	movel d0,d3
	addl d1,d3
	asrl #6,d3
	jra L156
L160:
	movel a6@(8),a0
	addqw #3,a0
	moveb a0@,d0
	lsrb #4,d0
	clrl d3
	moveb d0,d3
	jra L156
L161:
	movel a6@(8),a0
	addqw #3,a0
	clrl d3
	moveb a0@,d3
	jra L156
L162:
	movel a6@(8),a0
	addqw #2,a0
	clrl d0
	moveb a0@,d0
	asll #8,d0
	movel a6@(8),a0
	addqw #3,a0
	clrl d1
	moveb a0@,d1
	movel d0,d3
	addl d1,d3
	moveq #12,d2
	asrl d2,d3
	jra L156
L163:
	movel a6@(8),a0
	addqw #2,a0
	clrl d0
	moveb a0@,d0
	asll #8,d0
	movel a6@(8),a0
	addqw #3,a0
	clrl d1
	moveb a0@,d1
	movel d0,d3
	addl d1,d3
	asrl #6,d3
	jra L156
L164:
L165:
	movel a6@(8),a0
	addqw #2,a0
	clrl d0
	moveb a0@,d0
	asll #8,d0
	movel a6@(8),a0
	addqw #3,a0
	clrl d1
	moveb a0@,d1
	movel d0,d3
	addl d1,d3
	jra L156
L166:
	movel a6@(8),a0
	addqw #4,a0
	clrl d0
	moveb a0@,d0
	asll #8,d0
	movel a6@(8),a0
	addqw #5,a0
	clrl d1
	moveb a0@,d1
	movel d0,d3
	addl d1,d3
	moveq #12,d2
	asrl d2,d3
	jra L156
L167:
	movel a6@(8),a0
	addqw #4,a0
	clrl d0
	moveb a0@,d0
	asll #8,d0
	movel a6@(8),a0
	addqw #5,a0
	clrl d1
	moveb a0@,d1
	movel d0,d3
	addl d1,d3
	asrl #6,d3
	jra L156
L168:
	movel a6@(8),a0
	addqw #4,a0
	clrl d0
	moveb a0@,d0
	asll #8,d0
	movel a6@(8),a0
	addqw #5,a0
	clrl d1
	moveb a0@,d1
	movel d0,d3
	addl d1,d3
	jra L156
L169:
	movel a6@(8),a0
	addqw #2,a0
	clrl d0
	moveb a0@,d0
	asll #8,d0
	movel a6@(8),a0
	addqw #3,a0
	clrl d1
	moveb a0@,d1
	movel d0,d3
	addl d1,d3
	asrl #7,d3
	jra L156
L170:
	movel a6@(8),a0
	addqw #2,a0
	clrl d0
	moveb a0@,d0
	asll #8,d0
	movel a6@(8),a0
	addqw #3,a0
	clrl d1
	moveb a0@,d1
	movel d0,d3
	addl d1,d3
	moveq #10,d2
	asrl d2,d3
	jra L156
L171:
	jbsr _abort
L156:
	movel a6@(16),d0
	subql #3,d0
	moveq #9,d2
	cmpl d2,d0
	jhi L181
LI182:
	movew pc@(L182-LI182-2:b,d0:l:2),d0
	jmp pc@(2,d0:w)
L182:
	.word L174-L182
	.word L175-L182
	.word L176-L182
	.word L177-L182
	.word L178-L182
	.word L179-L182
	.word L181-L182
	.word L181-L182
	.word L181-L182
	.word L180-L182
L174:
	moveq #7,d0
	andl d3,d0
	jra L155
L175:
	moveq #15,d0
	andl d3,d0
	jra L155
L176:
	moveq #31,d0
	andl d3,d0
	jra L155
L177:
	moveq #63,d0
	andl d3,d0
	jra L155
L178:
	moveq #127,d0
	andl d3,d0
	jra L155
L179:
	movel d3,d0
	andl #255,d0
	jra L155
L180:
	movel d3,d0
	andl #4095,d0
	jra L155
L181:
	jbsr _abort
L173:
L155:
	movel a6@(-4),d3
	unlk a6
	rts
LC958:
	.ascii "*2\0"
LC959:
	.ascii "*4\0"
LC960:
	.ascii "*8\0"
.data
	.align 2
_scales.1:
	.long LC174
	.long LC958
	.long LC959
	.long LC960
.text
LC961:
	.ascii "[%s.%c%s]\0"
LC962:
	.ascii "%d(\0"
LC963:
	.ascii ")%s\0"
LC964:
	.ascii "%s)\0"
	.even
_print_indexed:
	link a6,#-40
	moveml #0x1c00,sp@-
	addql #2,a6@(12)
	movel a6@(12),a0
	subqw #2,a0
	moveb a0@,d0
	extbl d0
	asll #8,d0
	movel a6@(12),a0
	subqw #1,a0
	clrl d1
	moveb a0@,d1
	movel d0,d3
	addl d1,d3
	movel d3,d0
	moveq #9,d2
	asrl d2,d0
	moveq #3,d2
	andl d2,d0
	asll #2,d0
	lea _scales.1,a0
	movel a0@(d0:l),sp@-
	movel d3,d0
	andl #2048,d0
	tstl d0
	jeq L184
	moveq #108,d0
	jra L185
L184:
	moveq #119,d0
L185:
	movel d0,sp@-
	movel d3,d0
	moveq #12,d2
	asrl d2,d0
	moveq #15,d2
	andl d2,d0
	asll #2,d0
	lea _reg_names,a0
	movel a0@(d0:l),sp@-
	pea LC961
	moveq #-40,d0
	addl a6,d0
	movel d0,sp@-
	jbsr _sprintf
	movel d3,d0
	andl #256,d0
	addw #20,sp
	tstl d0
	jne L186
	movel a6@(20),sp@-
	movel d3,d0
	andl #128,d0
	tstl d0
	jeq L187
	movel d3,d0
	orw #65280,d0
	jra L188
L187:
	movel d3,d0
	andl #255,d0
L188:
	moveq #-1,d2
	cmpl a6@(8),d2
	jne L189
	addl a6@(16),d0
L189:
	movel d0,sp@-
	movel a6@(8),sp@-
	jbsr _print_base
	moveq #-40,d0
	addl a6,d0
	movel d0,sp@-
	pea LC930
	movel a6@(20),sp@-
	jbsr _fprintf
	movel a6@(12),d0
	jra L183
L186:
	movel d3,d0
	andl #128,d0
	tstl d0
	jeq L190
	moveq #-2,d2
	movel d2,a6@(8)
L190:
	moveq #64,d0
	andl d3,d0
	tstl d0
	jeq L191
	clrb a6@(-40)
L191:
	clrl d4
	movel d3,d0
	asrl #4,d0
	moveq #3,d2
	andl d2,d0
	moveq #2,d2
	cmpl d0,d2
	jeq L193
	moveq #3,d2
	cmpl d0,d2
	jeq L194
	jra L196
L193:
	addql #2,a6@(12)
	movel a6@(12),a0
	subqw #2,a0
	moveb a0@,d0
	extbl d0
	asll #8,d0
	movel a6@(12),a0
	subqw #1,a0
	clrl d1
	moveb a0@,d1
	movel d0,d4
	addl d1,d4
	jra L192
L194:
	addql #4,a6@(12)
	movel a6@(12),a0
	subqw #4,a0
	clrl d0
	moveb a0@,d0
	asll #8,d0
	movel a6@(12),a0
	subqw #3,a0
	clrl d1
	moveb a0@,d1
	addl d1,d0
	asll #8,d0
	movel a6@(12),a0
	subqw #2,a0
	clrl d1
	moveb a0@,d1
	addl d1,d0
	asll #8,d0
	movel a6@(12),a0
	subqw #1,a0
	clrl d1
	moveb a0@,d1
	movel d0,d4
	addl d1,d4
L196:
L192:
	moveq #-1,d2
	cmpl a6@(8),d2
	jne L197
	addl a6@(16),d4
L197:
	moveq #7,d0
	andl d3,d0
	tstl d0
	jne L198
	movel a6@(20),sp@-
	movel d4,sp@-
	movel a6@(8),sp@-
	jbsr _print_base
	moveq #-40,d0
	addl a6,d0
	movel d0,sp@-
	pea LC930
	movel a6@(20),sp@-
	jbsr _fprintf
	movel a6@(12),d0
	jra L183
L198:
	clrl d5
	moveq #3,d0
	andl d3,d0
	moveq #2,d2
	cmpl d0,d2
	jeq L200
	moveq #3,d2
	cmpl d0,d2
	jeq L201
	jra L203
L200:
	addql #2,a6@(12)
	movel a6@(12),a0
	subqw #2,a0
	moveb a0@,d0
	extbl d0
	asll #8,d0
	movel a6@(12),a0
	subqw #1,a0
	clrl d1
	moveb a0@,d1
	movel d0,d5
	addl d1,d5
	jra L199
L201:
	addql #4,a6@(12)
	movel a6@(12),a0
	subqw #4,a0
	clrl d0
	moveb a0@,d0
	asll #8,d0
	movel a6@(12),a0
	subqw #3,a0
	clrl d1
	moveb a0@,d1
	addl d1,d0
	asll #8,d0
	movel a6@(12),a0
	subqw #2,a0
	clrl d1
	moveb a0@,d1
	addl d1,d0
	asll #8,d0
	movel a6@(12),a0
	subqw #1,a0
	clrl d1
	moveb a0@,d1
	movel d0,d5
	addl d1,d5
L203:
L199:
	movel d5,sp@-
	pea LC962
	movel a6@(20),sp@-
	jbsr _fprintf
	movel a6@(20),sp@-
	movel d4,sp@-
	movel a6@(8),sp@-
	jbsr _print_base
	moveq #4,d0
	andl d3,d0
	addw #24,sp
	tstl d0
	jeq L204
	moveq #-40,d0
	addl a6,d0
	movel d0,sp@-
	pea LC963
	movel a6@(20),sp@-
	jbsr _fprintf
	addw #12,sp
	jra L205
L204:
	moveq #-40,d0
	addl a6,d0
	movel d0,sp@-
	pea LC964
	movel a6@(20),sp@-
	jbsr _fprintf
	addw #12,sp
L205:
	movel a6@(12),d0
	jra L183
L183:
	moveml a6@(-52),#0x38
	unlk a6
	rts
LC965:
	.ascii "0x%x\0"
	.even
_print_base:
	link a6,#0
	moveq #-2,d1
	cmpl a6@(8),d1
	jne L207
	movel a6@(12),sp@-
	pea LC942
	movel a6@(16),sp@-
	jbsr _fprintf
	addw #12,sp
	jra L208
L207:
	moveq #-1,d1
	cmpl a6@(8),d1
	jne L209
	movel a6@(12),sp@-
	pea LC965
	movel a6@(16),sp@-
	jbsr _fprintf
	addw #12,sp
	jra L210
L209:
	movel a6@(8),d0
	asll #2,d0
	lea _reg_names,a0
	movel a0@(d0:l),sp@-
	movel a6@(12),sp@-
	pea LC950
	movel a6@(16),sp@-
	jbsr _fprintf
	addw #16,sp
L210:
L208:
L206:
	unlk a6
	rts
	.even
.globl _convert_from_68881
_convert_from_68881:
	link a6,#0
#APP
	.word 020156
	.word 8
	.word 021156
	.word 12
	.long 0xf2104800
	.long 0xf2117400
#NO_APP
L211:
	unlk a6
	rts
	.even
.globl _convert_to_68881
_convert_to_68881:
	link a6,#0
#APP
	.word 020156
	.word 8
	.word 021156
	.word 12
	.long 0xf2105400
	.long 0xf2116800
#NO_APP
L212:
	unlk a6
	rts
.comm _partial_symtab_list,4
.comm _symtab_list,4
.comm _misc_function_count,4
.comm _misc_function_vector,4
