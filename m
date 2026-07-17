Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386063385BC
	for <loongarch@lists.linux.dev>; Fri, 17 Jul 2026 03:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784260702; cv=none; b=ZNlTo1bB8c2VZYKIvzWD96uGcLU2SSIpWkpeYq0lUzciBAsNFIrEp6Ei4CWA0Xyl6ufHllUUjnR7PfJz2+WPEzfVUob+We7WXm7ApnypuXd1XkdxKCDNLEvfcNG4uUI16hTxkrIs1QjgTqK0fO1n/KLjv44LPmg5afYrWwtgrgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784260702; c=relaxed/simple;
	bh=c4JcLOUUVEVj142K2x15iZYPpLCcmDyKREKux79wo6o=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ODrEzMoWIHUnasH0o02fXnNHuMJC/a8/C03U48ykhBDgZE/8OwCNOwzU+ThcEh4sSqi8EF2gr41Vvw4WfWJJI6bf3nuiUSnMk59jnOTKnBj2Y0+Ulx+YfP/50gz0Y6tyUn30glzCG2qF1BoL7yxP528yATxclnkri2Qub4o5KsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: bb0c5ff8819311f1aa26b74ffac11d73-20260717
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_TXT
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_MAILER_MTBG
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b91af85e-469c-4070-a2d1-a03dd5f2e2c2,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.12,REQID:b91af85e-469c-4070-a2d1-a03dd5f2e2c2,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:e7bac3a,CLOUDID:07cc171aebca4d901eb78a3a28f0513c,BulkI
	D:260717113338OU1GA6GM,BulkQuantity:1,Recheck:0,SF:17|19|64|66|78|80|81|82
	|83|102|127|841|865|898,TC:nil,Content:0|15|52,EDM:-3,IP:-2,URL:0,File:nil
	,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,D
	KP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bb0c5ff8819311f1aa26b74ffac11d73-20260717
X-User: husong@kylinos.cn
Received: from [192.168.110.173] [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1391029399; Fri, 17 Jul 2026 11:58:12 +0800
Message-ID: <ba742021-5c53-4208-a4ba-15481dbcbce7@kylinos.cn>
Date: Fri, 17 Jul 2026 11:57:59 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: husong@kylinos.cn, kernel@xen0n.name, yangtiezhu@loongson.cn,
 jiaxun.yang@flygoat.com, arnd@arndb.de, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: warn when per-CPU TLB vector allocation fails
To: Huacai Chen <chenhuacai@kernel.org>
References: <20260717023712.1989650-1-husong@kylinos.cn>
 <CAAhV-H5sgnvth4_uKSrz0U+0gPOWMT7E5YODyNVVzHq_Y+cgmw@mail.gmail.com>
From: Song Hu <husong@kylinos.cn>
In-Reply-To: <CAAhV-H5sgnvth4_uKSrz0U+0gPOWMT7E5YODyNVVzHq_Y+cgmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


在 2026/7/17 11:33, Huacai Chen 写道:
> Hi, Song,
>
> On Fri, Jul 17, 2026 at 10:38 AM Song Hu <husong@kylinos.cn> wrote:
>> On a secondary CPU, setup_tlb_handler() allocates a NUMA-local page
>> for the per-CPU TLB exception vectors and silently returns if the
>> allocation fails.  The CPU keeps running on the shared vectors that
>> configure_exception_vector() installed earlier in per_cpu_trap_init(),
>> losing NUMA locality with nothing logged.  Warn so the fallback is
>> observable.
>>
>> Signed-off-by: Song Hu <husong@kylinos.cn>
>> ---
>>  arch/loongarch/mm/tlb.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
>> index aaf7d685cc2a..e5220653279c 100644
>> --- a/arch/loongarch/mm/tlb.c
>> +++ b/arch/loongarch/mm/tlb.c
>> @@ -297,8 +297,11 @@ static void setup_tlb_handler(int cpu)
>>                         return;
>>
>>                 page = alloc_pages_node(cpu_to_node(cpu), GFP_ATOMIC, get_order(vec_sz));
>> -               if (!page)
>> +               if (!page) {
>> +                       pr_warn("CPU%d: TLB vector allocation failed; "
>> +                               "using shared vectors\n", cpu);
>>                         return;
>> +               }
> A warning usually make users nervous, this failure completely doesn't
> hurt anything, why you want to shout loudly here?
You're right — the fallback is completely benign and a pr_warn is too
loud for something that doesn't affect functionality.  I'll drop this
patch.

Thanks,
Song Hu
> Huacai
>
>>                 addr = page_address(page);
>>                 pcpu_handlers[cpu] = (unsigned long)addr;
>> --
>> 2.43.0
>>
