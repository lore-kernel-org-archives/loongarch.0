Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6CA3209
	for <loongarch@lists.linux.dev>; Thu,  5 Jun 2025 01:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749087688; cv=none; b=jhaB80bbV1qLcw7wZ9Hmc9j0E4d42anhrvZc/O5UBNoZrW0Wt1tV5+5sH5SJcbj8sF7XJPJlNUPtW+bn6Dwn0NrkocYbl/ENB3/rgCp98hzRsYiLtZ8gWq4K5ZazZAlfzfy5UvLMcr94YGMQLFDvOnQVBSo7m4z0efntfeFR/zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749087688; c=relaxed/simple;
	bh=IUt01moaBd5TAdMnUc3gKx9bozAsxvOa/lwtec0ebcM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ig3zN664h8XxM/llPL0+OtYLQDVw156uDLqhz74BnsoVLXyyKrxuBPLLosJ9RRKdLxorDf0qZQPbbs66IUcmGFGDVHhgXJ6N382OFc9MaVEA2md/tP6gHoou5g2Bq9Vv8/mEVYaPiRCU4JfDZUhQ5aBmf7dJK/zPJX9DyjR38G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 2c13b31241ae11f0b29709d653e92f7d-20250605
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:c6c73675-662e-4cc5-9545-7b19b3dbf9b7,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.1.45,REQID:c6c73675-662e-4cc5-9545-7b19b3dbf9b7,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:6493067,CLOUDID:35a42d355475a4e61db1f4b6b71778cc,BulkI
	D:250605093054Q0RBFYVE,BulkQuantity:1,Recheck:0,SF:17|19|23|43|66|74|78|81
	|82|83|102,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,
	QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
	,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 2c13b31241ae11f0b29709d653e92f7d-20250605
X-User: lijun01@kylinos.cn
Received: from bogon [(106.121.188.19)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1049303674; Thu, 05 Jun 2025 09:41:16 +0800
Message-ID: <d6ef1b813bb63504adf34d28d61c6848b9a76221.camel@kylinos.cn>
Subject: =?gb2312?Q?Re=A3=BA=5BPATCH?= v2] loongarch: kgdb: remove
 unnecessary init variable
From: lijun <lijun01@kylinos.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: si.yanteng@linux.dev, kernel@xen0n.name, loongarch@lists.linux.dev
Date: Thu, 05 Jun 2025 09:41:12 +0800
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


//test2.c
#include<stdio.h>                                                      
   
int main(int argc, const char *argv[]) 
{                                      
    int
i=0;                                                             
    i = 3;                             
    printf("i = %d\n", i);            
    return 0;                           
}   
push   %rbp
mov    %rsp,%rbp
sub    $0x20,%rsp
mov    %edi,-0x14(%rbp)
mov    %rsi,-0x20(%rbp)
movl   $0x0,-0x4(%rbp)
movl   $0x3,-0x4(%rbp)
mov    -0x4(%rbp),%eax
mov    %eax,%esi
mov    $0x402004,%edi
mov    $0x0,%eax
callq  401040 <printf@plt>
//test.c
#include<stdio.h>                                                      
    
int main(int argc, const char *argv[]) 
{                                      
    int i;                                                          
    i = 3;                             
    printf("i = %d\n", i);            
    return 0;                           
}   
endbr64 
push   %rbp
mov    %rsp,%rbp
sub    $0x20,%rsp
mov    %edi,-0x14(%rbp)
mov    %rsi,-0x20(%rbp)
movl   $0x3,-0x4(%rbp)
mov    -0x4(%rbp),%eax
mov    %eax,%esi
mov    $0x402004,%edi
mov    $0x0,%eax
callq  401040 <printf@plt>

It is possible that the initialization is optimized by assigning values
immediately after initialization
if gcc -O3 test2.c -o ao3.out
endbr64 
sub    $0x8,%rsp
mov    $0x3,%edx
mov    $0x402004,%esi
xor    %eax,%eax
mov    $0x1,%edi
callq  401040 <__printf_chk@plt>



----------------------------------->
Why do you think the compiler generates initialization instructions,
have you found any difference in the binary after your patch?

Huacai

