Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F80B43E499
	for <loongarch@lists.linux.dev>; Sat, 28 Feb 2026 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772284150; cv=none; b=EAUKakKn7BASX0XV9ZXBtQN2kNIBIRgRWGdXHY4sh6MRydh8jygijhDguF+gUdNWKbhROGXVWp4h846FwDrPnW+nvmz1pAwADJh+cuz2SYbqkrmit+BCaNF72Nl15q+gw/wXU9tG+FekVab27qG9E/I22An4/VXmvhkY+Jbb0QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772284150; c=relaxed/simple;
	bh=SaMKHBYp2dfxGW8qzLy1AfLYK9+TCSyaBdSiplrdslA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OAYm3z/RMXrd/pp4H7ei+k3XYmyMGOoybFe+Nay2oVN4oTtMDa+nPs4eOPUSJPvrr1e+i7PGZflf5BWU1hoC/wwjdfBfT466xVTh7V8YIOD1BatdEu5K/DyuAtsKmEDfPRSL3pE+1NdHDWCqEjCy+ArrWcU0NX3UNwS1JwSF0ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Hk0p4k/6; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Hk0p4k/6"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S8lkMb2447252;
	Sat, 28 Feb 2026 13:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=e3h6lK
	PADkarDnV9tMxKLLerzBFFSfZGDUJSV7g45+k=; b=Hk0p4k/6smPydLZ9oUzc20
	aNTzGjk1n/5sgfK0KV4ceX9Dm6YdaNab5b1xrnIszlnopxp+JuFjIuM4KxxW2b5U
	g4Te7MHDdwLeRg1DOwpHofxhauRWgj/IGpkdZMt+xF/8spsQoq+vYFcXCX/Uc4AF
	//BBJN0zoOPhizc3V1fVdyHvI2kPKjxQrA0Ihf44i4KIRnJa1rCS/8l2887pLJEm
	kn52QT4bWE0Mo6EWHldILKR39ExM+V63Ytbcz5lJOw0wanVZr0VVULqjuqbHSYI3
	ylroQUGK5swb/FPlIkCy3wGLjHl2NC1+MT3VSz9iGV/pIks7OMaQTrpjHOxLZ8sw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksrhrwsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 13:08:21 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61SAMWO5013438;
	Sat, 28 Feb 2026 13:08:20 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfqdypsva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 13:08:20 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61SD8GuF57278852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 28 Feb 2026 13:08:16 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C9A920040;
	Sat, 28 Feb 2026 13:08:16 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D495B20043;
	Sat, 28 Feb 2026 13:07:57 +0000 (GMT)
Received: from [9.124.209.149] (unknown [9.124.209.149])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 28 Feb 2026 13:07:57 +0000 (GMT)
Message-ID: <c20e22cd-e1bf-4993-9ee8-bce62a5c0879@linux.ibm.com>
Date: Sat, 28 Feb 2026 18:37:55 +0530
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] crash: Use crash_exclude_core_ranges() on powerpc
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
        skhan@linuxfoundation.org, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org,
        saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
        vgoyal@redhat.com, dyoung@redhat.com, pmladek@suse.com,
        rdunlap@infradead.org, dapeng1.mi@linux.intel.com, kees@kernel.org,
        paulmck@kernel.org, lirongqing@baidu.com, arnd@arndb.de,
        rppt@kernel.org, ardb@kernel.org, leitao@debian.org, jbohac@suse.cz,
        cfsworks@gmail.com, ryan.roberts@arm.com, tangyouling@kylinos.cn,
        ritesh.list@gmail.com, hbathini@linux.ibm.com, eajames@linux.ibm.com,
        songshuaishuai@tinylab.org, samuel.holland@sifive.com,
        kevin.brodsky@arm.com, vishal.moola@gmail.com,
        junhui.liu@pigmoral.tech, coxu@redhat.com, liaoyuanhong@vivo.com,
        brgerst@gmail.com, fuqiang.wang@easystack.cn, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, kexec@lists.infradead.org
References: <20260226130437.1867658-1-ruanjinjie@huawei.com>
 <20260226130437.1867658-4-ruanjinjie@huawei.com>
 <3576865b-65bd-4289-babc-975a543eb775@linux.ibm.com>
 <0a776b5f-5a88-2c71-7305-d30d9240c2cb@huawei.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <0a776b5f-5a88-2c71-7305-d30d9240c2cb@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Rp/I7SmK c=1 sm=1 tr=0 ts=69a2e8c6 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=i0EeH86SAAAA:8 a=SqbkEvhUw2NNNf05Xa8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDEyMSBTYWx0ZWRfX071lBZNc4yPs
 a+VvK7FC4ZLJ83ujFSxE4qKrT2im2H45r5MaQT28kHvEJTqd6pJVaAyuSjQ3NuM6wUa0qEH2alF
 P1jCkPqkp6CqN0DKLbWKVk21rKn8njj0UZAYJeaU8TzE/4SPRd0l4Zs1QS7ZiiOL/7qs3FoMu6G
 5csaG6FOvpwfilpgha8+Qro/2ZkMmOh4FsC3nEWvKPC+6uws9ppkA2uxtJuI7qYY4767PsvsYoF
 EsF4NUtz447QS7ih5aGhLRWxZs0pYsfIx4JJJmsUkfBQZzN4/aNXD+3Qe9CGx4E+D7TcSZtBXEI
 XFXUL1muBf1u/clq8TG8N1+SmISXqsyGVdsRfh4SMvQngoVyIAT0YOagP6M0o6qk6U4uLYL2oHz
 3Abjnl6QdWdZlzi3KOhcXYOhHL66mqa0R9Vsau62cBWDsTUfJyfY4QGts602vgdSDGI5+I3b7Rt
 tTiPIRyq15vMDpnE3VQ==
X-Proofpoint-GUID: VU3eDeJEliDLLLNFpw6e5qki7AdYAUd0
X-Proofpoint-ORIG-GUID: qiO9pP1xveZBu3XCkKWBR8dO855n6A-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280121



On 28/02/26 06:51, Jinjie Ruan wrote:
>
> On 2026/2/27 22:50, Sourabh Jain wrote:
>> Resend of:
>> https://lore.kernel.org/all/19cf18b5-362d-4ff2-8b85-e2e72809250c@linux.ibm.com/
>>
>> On 26/02/26 18:34, Jinjie Ruan wrote:
>>> The crash memory exclude of crashk_res and crashk_cma memory on powerpc
>>> are almost identical to the generic crash_exclude_core_ranges().
>>>
>>> By introducing the architecture-specific arch_crash_exclude_mem_range()
>>> function with a default implementation of crash_exclude_mem_range(),
>>> and using crash_exclude_mem_range_guarded as powerpc's separate
>>> implementation, the generic crash_exclude_core_ranges() helper function
>>> can be reused.
>>>
>>> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> ---
>>>    arch/powerpc/kexec/ranges.c | 16 ++++------------
>>>    include/linux/crash_core.h  |  4 ++++
>>>    kernel/crash_core.c         | 19 +++++++++++++------
>>>    3 files changed, 21 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
>>> index 6c58bcc3e130..e5fea23b191b 100644
>>> --- a/arch/powerpc/kexec/ranges.c
>>> +++ b/arch/powerpc/kexec/ranges.c
>>> @@ -553,9 +553,9 @@ int get_usable_memory_ranges(struct crash_mem
>>> **mem_ranges)
>>>    #endif /* CONFIG_KEXEC_FILE */
>>>      #ifdef CONFIG_CRASH_DUMP
>>> -int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
>>> -                       unsigned long long mstart,
>>> -                       unsigned long long mend)
>>> +int arch_crash_exclude_mem_range(struct crash_mem **mem_ranges,
>>> +                 unsigned long long mstart,
>>> +                 unsigned long long mend)
>>
>> update_crash_elfcorehdr() in arch/powerpc/kexec/crash.c still calls
>> crash_exclude_mem_range_guarded(), causing a build failure.
>>
>> ld: arch/powerpc/kexec/crash.o: in function `update_crash_elfcorehdr':
>> /root/linux/arch/powerpc/kexec/crash.c:454: undefined reference to
>> `crash_exclude_mem_range_guarded'
>>
>>
>> To fix this:
>> --------------
>> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
>> index 898742a5205c..e59e909c369d 100644
>> --- a/arch/powerpc/kexec/crash.c
>> +++ b/arch/powerpc/kexec/crash.c
>> @@ -451,7 +451,7 @@ static void update_crash_elfcorehdr(struct kimage
>> *image, struct memory_notify *
>>                  base_addr = PFN_PHYS(mn->start_pfn);
>>                  size = mn->nr_pages * PAGE_SIZE;
>>                  end = base_addr + size - 1;
>> -               ret = crash_exclude_mem_range_guarded(&cmem, base_addr,
>> end);
>> +              ret = arch_crash_exclude_mem_range(&cmem, base_addr, end);
>>                  if (ret) {
>>                          pr_err("Failed to remove hot-unplugged memory
>> from crash memory ranges\n");
>>                          goto out;
>>
>> With the above change included, things are working fine on powerpc.
> It seems the declaration of crash_exclude_mem_range_guarded() added in
> arch/powerpc/include/asm/kexec_ranges.h can also be removed.

Yes, lets remove it.

>
>>
>>>    {
>>>        struct crash_mem *tmem = *mem_ranges;
>>>    @@ -604,18 +604,10 @@ int get_crash_memory_ranges(struct crash_mem
>>> **mem_ranges)
>>>                sort_memory_ranges(*mem_ranges, true);
>>>        }
>>>    -    /* Exclude crashkernel region */
>>> -    ret = crash_exclude_mem_range_guarded(mem_ranges,
>>> crashk_res.start, crashk_res.end);
>>> +    ret = crash_exclude_core_ranges(mem_ranges);
>>>        if (ret)
>>>            goto out;
>>>    -    for (i = 0; i < crashk_cma_cnt; ++i) {
>>> -        ret = crash_exclude_mem_range_guarded(mem_ranges,
>>> crashk_cma_ranges[i].start,
>>> -                          crashk_cma_ranges[i].end);
>>> -        if (ret)
>>> -            goto out;
>>> -    }
>>> -
>>>        /*
>>>         * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
>>>         *        regions are exported to save their context at the time of
>>> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
>>> index 033b20204aca..dbec826dc53b 100644
>>> --- a/include/linux/crash_core.h
>>> +++ b/include/linux/crash_core.h
>>> @@ -68,6 +68,7 @@ extern int crash_prepare_elf64_headers(struct
>>> crash_mem *mem, int need_kernel_ma
>>>                           void **addr, unsigned long *sz);
>>>    extern int crash_prepare_headers(int need_kernel_map, void **addr,
>>>                     unsigned long *sz, unsigned long *nr_mem_ranges);
>>> +extern int crash_exclude_core_ranges(struct crash_mem **cmem);
>>>      struct kimage;
>>>    struct kexec_segment;
>>> @@ -88,6 +89,9 @@ extern int kimage_crash_copy_vmcoreinfo(struct
>>> kimage *image);
>>>    extern unsigned int arch_get_system_nr_ranges(void);
>>>    extern int arch_crash_populate_cmem(struct crash_mem *cmem);
>>>    extern int arch_crash_exclude_ranges(struct crash_mem *cmem);
>>> +extern int arch_crash_exclude_mem_range(struct crash_mem **mem,
>>> +                    unsigned long long mstart,
>>> +                    unsigned long long mend);
>>>      #else /* !CONFIG_CRASH_DUMP*/
>>>    struct pt_regs;
>>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>>> index 96a96e511f5a..300d44ad5471 100644
>>> --- a/kernel/crash_core.c
>>> +++ b/kernel/crash_core.c
>>> @@ -287,24 +287,31 @@ unsigned int __weak
>>> arch_get_system_nr_ranges(void) { return 0; }
>>>    int __weak arch_crash_populate_cmem(struct crash_mem *cmem) { return
>>> -1; }
>>>    int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) {
>>> return 0; }
>>>    -static int crash_exclude_core_ranges(struct crash_mem *cmem)
>>> +int __weak arch_crash_exclude_mem_range(struct crash_mem **mem,
>>> +                    unsigned long long mstart,
>>> +                    unsigned long long mend)
>>> +{
>>> +    return crash_exclude_mem_range(*mem, mstart, mend);
>>> +}
>>> +
>>> +int crash_exclude_core_ranges(struct crash_mem **cmem)
>>>    {
>>>        int ret, i;
>>>          /* Exclude crashkernel region */
>>> -    ret = crash_exclude_mem_range(cmem, crashk_res.start,
>>> crashk_res.end);
>>> +    ret = arch_crash_exclude_mem_range(cmem, crashk_res.start,
>>> crashk_res.end);
>>>        if (ret)
>>>            return ret;
>>>          if (crashk_low_res.end) {
>>> -        ret = crash_exclude_mem_range(cmem, crashk_low_res.start,
>>> crashk_low_res.end);
>>> +        ret = arch_crash_exclude_mem_range(cmem,
>>> crashk_low_res.start, crashk_low_res.end);
>>>            if (ret)
>>>                return ret;
>>>        }
>>>          for (i = 0; i < crashk_cma_cnt; ++i) {
>>> -        ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
>>> -                          crashk_cma_ranges[i].end);
>>> +        ret = arch_crash_exclude_mem_range(cmem,
>>> crashk_cma_ranges[i].start,
>>> +                           crashk_cma_ranges[i].end);
>>>            if (ret)
>>>                return ret;
>>>        }
>>> @@ -331,7 +338,7 @@ int crash_prepare_headers(int need_kernel_map,
>>> void **addr, unsigned long *sz,
>>>        if (ret)
>>>            goto out;
>>>    -    ret = crash_exclude_core_ranges(cmem);
>>> +    ret = crash_exclude_core_ranges(&cmem);
>>>        if (ret)
>>>            goto out;
>>>    

