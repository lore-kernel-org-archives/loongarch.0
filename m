Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35393A05D7
	for <loongarch@lists.linux.dev>; Thu, 16 Jul 2026 07:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784186837; cv=none; b=K+46Aoy/hE9hx6yr7JnxaaXm7VpbkzJ98HytQ4J9ymQbCgXuqQzpa4bwU5cMTMkDdZHDJFjS4fzyLxcWNH4Ffm3Ie1JBZ0VYtqIWfKjufFkiLYcpacmFzzHL1/YnxTL9UZ6OaVIwd2BzDjl3eskf903w6NWWJD89E36wacNb+5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784186837; c=relaxed/simple;
	bh=DifRZ0UUS7celhh/PBR86mxSgZRiY3YYIU4oWAZG8pw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=frXFNPtEA/2pfhFmYHtRIzdECyleO+TImvGspR90v+X2OsJqd/OsEART0ZEIkItihBHdGe3VhajJuCXcO7Yvl7ynkgYSFJj+FZtQrCDsMsNWLNrBQnXYXSOsBr8tvkHrTi130dTixs+I8NkepWey1zxYxGBYLnUzi5vl1XC07UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: be9c38c080e711f1aa26b74ffac11d73-20260716
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_TXT
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_MAILER_MTBG
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_GOOD
	CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD
	ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:9d72e079-2fb7-45d4-90fc-5765cbb307af,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.3.12,REQID:9d72e079-2fb7-45d4-90fc-5765cbb307af,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:e7bac3a,CLOUDID:98cf401805cf308cc986b99a27e3b9fc,BulkI
	D:260716142514VSE36A73,BulkQuantity:1,Recheck:0,SF:17|19|64|66|78|80|81|82
	|83|102|127|841|865|898,TC:nil,Content:0|15|52,EDM:-3,IP:-2,URL:0,File:nil
	,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,D
	KP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: be9c38c080e711f1aa26b74ffac11d73-20260716
X-User: husong@kylinos.cn
Received: from [192.168.110.173] [(223.70.159.239)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1015539527; Thu, 16 Jul 2026 15:27:04 +0800
Message-ID: <d8e0131c-897d-430c-89ca-30e37996325e@kylinos.cn>
Date: Thu, 16 Jul 2026 15:26:41 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: husong@kylinos.cn, kernel@xen0n.name, guanwentao@uniontech.com,
 jiaxun.yang@flygoat.com, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: fix silent hang on kernel exec into an NX page
To: Huacai Chen <chenhuacai@kernel.org>
References: <20260716030224.1696408-1-husong@kylinos.cn>
 <CAAhV-H41ZG=yh7jOmsHGTrh2RBy9PeiqckQsW9bdhRfYkYkQzw@mail.gmail.com>
From: Song Hu <husong@kylinos.cn>
In-Reply-To: <CAAhV-H41ZG=yh7jOmsHGTrh2RBy9PeiqckQsW9bdhRfYkYkQzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


在 2026/7/16 14:24, Huacai Chen 写道:
> Hi, Song,
>
> On Thu, Jul 16, 2026 at 11:02 AM Song Hu <husong@kylinos.cn> wrote:
>> spurious_fault() returns 1 for any non-write fault on a present page
>> without checking the access permission, so a kernel instruction fetch into
>> a present NX page (TLBNX) is treated as spurious and the faulting
>> instruction re-executes forever -- a silent hang that bypasses
>> fixup_exception() and the oops path.
> Can you give a method to reproduce this hang?
Hi Huacai,

Thanks for the review.

A late_initcall that allocates a page-table-backed executable page, flips it
NX, then calls into it -- the TLBNX loops forever in spurious_fault() on the
unpatched kernel.  Built as obj-y:

  static int __init repro_init(void)
  {
      void (*fn)(void) = __vmalloc_node_range(PAGE_SIZE, PAGE_SIZE,
                      VMALLOC_START, VMALLOC_END, GFP_KERNEL,
                      PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS,
                      NUMA_NO_NODE, __builtin_return_address(0));
      if (!fn)
          return 0;
      set_memory_nx((unsigned long)fn, 1);
      fn();   /* TLBNX -> spurious_fault()=1 -> infinite fault loop */
      return 0;
  }
  late_initcall(repro_init);

The page must be page-table-backed (vmalloc range); an alloc_page()/DMW
linear-map address isn't in the kernel page tables, so the walk in
spurious_fault() never finds it.

Tested in a qemu-system-loongarch64 guest (-machine virt -accel kvm -cpu
la464) on a Loongson-3A6000 host :
unpatched, the initcall never returns -- silent infinite TLBNX loop, no oops;
with the fix, it oopses ("Unable to handle kernel paging request ... era ==
<addr>").
>> Recover the access type from the exception code: an exec fault (TLBNX) is
>> spurious only if the page is executable, a read fault only if it is
>> readable.  Fold the pmd/pte check together and add pud_leaf/p4d_leaf.
>>
>> Fixes: 09cfefb7fa70c ("LoongArch: Add memory management")
>> Signed-off-by: Song Hu <husong@kylinos.cn>
>> ---
>>  arch/loongarch/mm/fault.c | 24 ++++++++++++++++++++----
>>  1 file changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
>> index 2c93d33356e5..591a9c7060f2 100644
>> --- a/arch/loongarch/mm/fault.c
>> +++ b/arch/loongarch/mm/fault.c
>> @@ -38,6 +38,7 @@ static int __kprobes spurious_fault(unsigned long write, unsigned long address)
>>         pud_t *pud;
>>         pmd_t *pmd;
>>         pte_t *pte;
>> +       unsigned long prot;
>>
>>         if (!(address & __UA_LIMIT))
>>                 return 0;
>> @@ -58,15 +59,30 @@ static int __kprobes spurious_fault(unsigned long write, unsigned long address)
>>         if (!pmd_present(pmdp_get(pmd)))
>>                 return 0;
>>
>> -       if (pmd_leaf(*pmd)) {
>> -               return write ? pmd_write(pmdp_get(pmd)) : 1;
>> +       if (p4d_leaf(p4dp_get(p4d))) {
>> +               prot = p4d_val(p4dp_get(p4d));
>> +       } else if (pud_leaf(pudp_get(pud))) {
>> +               prot = pud_val(pudp_get(pud));
>> +       } else if (pmd_leaf(*pmd)) {
>> +               prot = pmd_val(pmdp_get(pmd));
> P4D doesn't exist on LoongArch, PUD huge page isn't supported on
> LoongArch, so what are you doing?
my mistake.  p4d is folded here and there is no PUD huge page
on LoongArch, so p4d_leaf()/pud_leaf() are always false in this path -- they
were unnecessary.  I'll drop both in v2 and keep only the pmd_leaf()/pte
paths.

Thanks,
Song
> Huacai
>
>>         } else {
>>                 pte = pte_offset_kernel(pmd, address);
>>                 if (!pte_present(ptep_get(pte)))
>>                         return 0;
>> -
>> -               return write ? pte_write(ptep_get(pte)) : 1;
>> +               prot = pte_val(ptep_get(pte));
>>         }
>> +
>> +       /*
>> +        * The TLB-protect handler passes write=0 for read (TLBNR), exec (TLBNX)
>> +        * and privilege (TLBPE) faults alike, so recover the real cause from the
>> +        * exception code; otherwise an exec into a present NX page (or a read of
>> +        * a NO_READ page) is wrongly treated as spurious and loops forever.
>> +        */
>> +       if (write)
>> +               return prot & _PAGE_WRITE;
>> +       if (read_csr_excode() == EXCCODE_TLBNX)
>> +               return !(prot & _PAGE_NO_EXEC);
>> +       return !(prot & _PAGE_NO_READ);
>>  }
>>
>>  static void __kprobes no_context(struct pt_regs *regs,
>> --
>> 2.43.0
>>
