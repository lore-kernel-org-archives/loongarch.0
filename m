Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E833209
	for <loongarch@lists.linux.dev>; Thu,  5 Jun 2025 01:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749087066; cv=none; b=g51vYojFVhQT+HdvHvrBoyGNugfoWuMhGtyXjBBs9d2Ec6vR3LIZ0Pzl+15PIxl7d0/Peb5H7+ewaWN/+056Gl7Q7g6UI8xmOuRpbHM3UV9jitA0lQpPtjMZjU30cy2FsH7o6uyFt+SZGmSjGRbWl43b5qC3FDwTvAz0dwwtYfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749087066; c=relaxed/simple;
	bh=3G//e+dhPS/lYk4D2AQds+Y4zmeGJmBZavnsFtIKMgs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BRl3uC+YpZRzjCghUfhUQ5u95XPT3cy8Q8rcsfTer7Zm0BObxLtFV1p22y2nnaDYXp2YcGPz4QsvPt8yM8X2/LEf3F39U8qFxPnWPIoSmQr3ed3R8Z7IrsQmfQnZ9baXy8hpDN3T36DZZzttyGTiSp8KionSAnD44kgtfDUSVTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b813550441ac11f0b29709d653e92f7d-20250605
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CHARSET, HR_CHARSET_NUM
	HR_CTE_7B, HR_CTT_TXT, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE
	HR_FROM_DIGIT_LEN, HR_FROM_NAME, HR_SJ_CHARSET, HR_SJ_DIGIT_LEN, HR_SJ_LANG
	HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN
	HR_SJ_WS, HR_TO_AS_FROM, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR, DN_TRUSTED
	SRC_TRUSTED, SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, CIE_UNKNOWN, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI
	AMN_C_BU, ABX_MISS_RDNS
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:076b440a-9b24-4053-af15-f2b88180922d,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.1.45,REQID:076b440a-9b24-4053-af15-f2b88180922d,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:6493067,CLOUDID:26d85edbd706f5381455e7b1cf81215c,BulkI
	D:250605093054Q0RBFYVE,BulkQuantity:0,Recheck:0,SF:17|19|23|43|66|74|78|81
	|82|83|102,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil
	,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:
	0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: b813550441ac11f0b29709d653e92f7d-20250605
X-User: lijun01@kylinos.cn
Received: from bogon [(106.121.188.19)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1603633153; Thu, 05 Jun 2025 09:30:52 +0800
Message-ID: <b20179452023419872c5c7e4a85f13dd530b7928.camel@kylinos.cn>
Subject: =?gb2312?Q?Re=A3=BA=5BPATCH?= v2] loongarch: kgdb: remove
 unnecessary init variable
From: lijun <lijun01@kylinos.cn>
To: lijun01@kylinos.cn
Cc: kernel@xen0n.name, loongarch@lists.linux.dev
Date: Thu, 05 Jun 2025 09:30:48 +0800
In-Reply-To: <CAAhV-H5dmh8_rNNRAaFeFvjCtt0CCsqTxOujWFakU=RYakrpAA@mail.gmail.com>
References: <20250604065647.113148-1-lijun01@kylinos.cn>
	 <CAAhV-H5dmh8_rNNRAaFeFvjCtt0CCsqTxOujWFakU=RYakrpAA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1-2kord0k2.4.25.1 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit



#include<stdio.h>                                              #include
<stdio.h>
                                        
int main(int argc, const char *argv[])     int main(int argc, const
char *argv[])
{                                                                      
               {
    int
i=0;                                                                   
  int i;
                                        
                                        
    i =
3;                                                                     
    i = 3;
    printf("i = %d\n",
i);                                       printf("i = %d\n", i); 
    return
0;                                                              return
0;
}                                                                      
              }                                      
 endbr64                                                               
   endbr64
push   %rbp                                                           p
ush   %rbp
mov    %rsp,%rbp                                              mov    %r
sp,%rbp
sub    $0x20,%rsp                                                sub   
 $0x20,%rsp
mov    %edi,-0x14(%rbp)                               mov    %edi,-
0x14(%rbp)
mov    %rsi,-0x20(%rbp)                                mov    %rsi,-
0x20(%rbp)
movl   $0x0,-0x4(%rbp)                                  movl   $0x3,-
0x4(%rbp)
movl   $0x3,-0x4(%rbp)                                  mov    -
0x4(%rbp),%eax
mov    -0x4(%rbp),%eax                                mov    %eax,%esi
mov    %eax,%esi                                              mov    $0
x402004,%edi
mov    $0x402004,%edi                                  mov    $0x0,%eax
mov    $0x0,%eax                                               callq  4
01040 <printf@plt>
callq  401040 <printf@plt>

if  gcc   -O3   test2.c -o a2.out, It is possible that the
initialization is optimized by
assigning values immediately after initialization
endbr64 
sub    $0x8,%rsp
mov    $0x3,%edx
mov    $0x402004,%esi
xor    %eax,%eax
mov    $0x1,%edi
callq  401040 <__printf_chk@plt>

----------------------------------------------->
Why do you think the compiler generates initialization instructions,
have you found any difference in the binary after your patch?

Huacai



