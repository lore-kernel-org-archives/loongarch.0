Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F224523A
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 08:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764233823; cv=none; b=FStp4/RKs6rAVGSz+BMEq+40vjsMJACwYylrPLXtn52La9Tza58geKq+v6lB5TnIGWWVEyNqOS7YJKMssqvGVKJp3tiNHFpx9ZdG3AUZ88VMT+BJkEJn57HvX4qC1McYJbZGXeNahi67gvVuuam/eZQWXeHiW9uh/zqLr9RF+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764233823; c=relaxed/simple;
	bh=nMEL6CUubWk5NRnZpqpkOMoWqTsFE9KiK/HMwEJVHkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SLZOiAp8LArp7ihnMe8tg+1j39CWYSoqpiToUFqCqh6tSBStxCh/DhLuXJLCh/sPMBvFfjqM3bMpxitbyDSAGLBt5g0zpTaHUMIZjFlpbMbaYqAOPushWXsLnfZgkAzhm2HXlUVLPMUdIalPIvTXMF629YYr3aoIUXEBRfAjQyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=OfDbwVj/; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="OfDbwVj/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764233791;
	bh=yWi1m8vik2+V9cBfNdeYImePDDtCunBGmGDzvbZUJHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=OfDbwVj/T+IeACX7U0Jsxqekadxn1XNtJTe1tNfkOvmxUQlN4uy1Tb+q9X1kfWDNl
	 I8kYUk51G58f2PP4tga6mBpduNMAIH/KZhvwU5KrNvuM+NchZfMmF/LvVzXrBu/4Co
	 4hsum3UbT5JDTYIjYtIi1F1FDVBgS+uXZ3y6UwHI=
X-QQ-mid: esmtpsz20t1764233784t7646cdd5
X-QQ-Originating-IP: dadl8Xeqpmm9MnwHmvFeOwIif3jaRswsA0h+tKRtJso=
Received: from [10.10.74.117] ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Nov 2025 16:56:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7843095497419515905
Message-ID: <B2E7E43661ACD241+64a342c7-66c0-4564-92c9-405bc0cd911b@uniontech.com>
Date: Thu, 27 Nov 2025 16:56:22 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] LoongArch: Correct the calculation logic of
 thread_count
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, hengqi.chen@gmail.com, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251127033123.3445519-1-maqianga@uniontech.com>
 <CAAhV-H6vmQpBhf5qiBg9C1SMSOy3O5hd6RnPc1B0Yg3r3+exSA@mail.gmail.com>
Content-Language: en-US
From: Qiang Ma <maqianga@uniontech.com>
In-Reply-To: <CAAhV-H6vmQpBhf5qiBg9C1SMSOy3O5hd6RnPc1B0Yg3r3+exSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NovCFWrsOaVAt4XiRc1EU25vF0QThns5nSVcz/5ZTUsKwrDpHasKmIUn
	Jytn36KVju0ElrIzytpXOmZGeakpS2vwZXthB2eJJ3rLygyg+sdOGer8l/PPrWscEmQVn61
	DlZJ3tvN+xbOr3AT2/DPz4+WwUMcITX//wrn7pRDYdJis86zPtuL7uB9FwnO9SuwjiQSWs9
	mKfWLGpNrA3659UnRk8Mg12Bn0tDccMSfkXUKaPmq+sAQGhF/wgs/iAN1z+tjnesml5a3YS
	ACb9ybTpDhqXwja6/nfsUULZeeUQFCL7narfEztGJbK3Tke8XMRwFyNYspK520UmyKYnwVk
	aw3oMjNQg/0KRPkZ1fy3ln0MYoADpEHUDAY9ZSkCAWq+c5lk5/IkZL0K82u1EElegDuu4FR
	BOfxWCd2YIyV6OhtGZceeQ5bU4w7Pfn43ybHNBTBUh699/4QzMXG1EvUE2eb1WfTFUh0QD7
	owkbc/UdHfBGWlReT8HU6QL8cVzNA4m5Mujb9W4LSz5Db4oPOKlM++kp+qg44wwytot281Q
	SnoQLBtQ13KRWv1PHRh/lpRJU1P/ZL5X6bqAztxMX3ICOU1y++/Kbv2bipQtOfphLVjuJJq
	z9uyKl69RSX8FScV7gSMLcZ74ktOE6St8vyu3TYXH62hiBplqKU52KJv82wuXpKN8qkLkWC
	SZvDDHevDJ9gexMJa8t/4HXGR4fpyMBTzhdAHnnhqeAw3Ddblo0scPnIRpwRpA4+tshjrxE
	QTslM0AyhNLlrcaaoZm799b2RMsqRvmw/hNW0iuXczncHi1OzH0sfA1xnQmJnSU4Mhp7yGN
	TOfBTCAtxpsFZFKl6pZ4fkHZGybj4nSVYiLPR/FcRlNLMIHdc32x6X46u5BPhNNWT57aGCb
	Ue5EDu/PD17UD9HAmy12OeU7qBGpElYP+wWNOqPrIsYxI4tJc7WYPkn2rOg1TmBfV6dKgUJ
	/A9/Ka3KsFWkT7LT0rSAmTL3b/tfKJmZk78Z2kGVqmMbjcJkgIWzxkWPjRFKaA2NgxBYx08
	LFHcyLIN636gQai90kRm1C24eJfGFbRAFfsdKoHYiKHd7AC11OKZmYmHRuRDidZBlQe1uFM
	vL1xwqtyle9Fn/QdwFNLgv6J41Fj6mG+hmJwsuQOPZd
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0


在 2025/11/27 15:36, Huacai Chen 写道:
> Hi, Qiang,
>
> On Thu, Nov 27, 2025 at 11:32 AM Qiang Ma <maqianga@uniontech.com> wrote:
>> For thread_count, the current calculation method has a maximum of 255,
>> which may not be sufficient in the future. Therefore, we are correcting
>> it now.
>>
>> Reference: SMBIOS Specification, 7.5 Processor Information (Type 4)[1]
>>
>> [1]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.9.0.pdf
>>
>> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
>> ---
>>   arch/loongarch/kernel/setup.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
>> index 25a87378e48e..8dd25fc4bd13 100644
>> --- a/arch/loongarch/kernel/setup.c
>> +++ b/arch/loongarch/kernel/setup.c
>> @@ -56,6 +56,7 @@
>>   #define SMBIOS_FREQLOW_MASK            0xFF
>>   #define SMBIOS_CORE_PACKAGE_OFFSET     0x23
>>   #define SMBIOS_THREAD_PACKAGE_OFFSET   0x25
>> +#define SMBIOS_THREAD_PACKAGE_2_OFFSET 0x2E
>>   #define LOONGSON_EFI_ENABLE            (1 << 3)
>>
>>   unsigned long fw_arg0, fw_arg1, fw_arg2;
>> @@ -120,13 +121,19 @@ static void __init parse_cpu_table(const struct dmi_header *dm)
>>   {
>>          long freq_temp = 0;
>>          char *dmi_data = (char *)dm;
>> +       u8 thread_count;
>>
>>          freq_temp = ((*(dmi_data + SMBIOS_FREQHIGH_OFFSET) << 8) +
>>                          ((*(dmi_data + SMBIOS_FREQLOW_OFFSET)) & SMBIOS_FREQLOW_MASK));
>>          cpu_clock_freq = freq_temp * 1000000;
>>
>>          loongson_sysconf.cpuname = (void *)dmi_string_parse(dm, dmi_data[16]);
>> -       loongson_sysconf.cores_per_package = *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
>> +       thread_count = *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
Yes, this one should need to be converted:
thread_count = *(u8 *)(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
>> +       if (thread_count != 0)
>> +               loongson_sysconf.cores_per_package =
>> +                               dm->length >= 0x30 && thread_count == 0xFF ?
>> +                               *(u16 *)(dmi_data + SMBIOS_THREAD_PACKAGE_2_OFFSET) :
>> +                               thread_count;

This patch method refers to dmidecode, which is the same as it, like this:

                         if (data[0x25] != 0)
                                 pr_attr("Thread Count", "%u",
                                         h->length >= 0x30 && data[0x25] 
== 0xFF ?

                                         WORD(data + 0x2E) : data[0x25]);


> According SPEC, it uses THREAD_COUNT_2 only if dm->length >= 30 and
> thread_count == 0xff, so the correct and simplest way is like this:
>
>          cpu_clock_freq = freq_temp * 1000000;
>
>          loongson_sysconf.cpuname = (void *)dmi_string_parse(dm, dmi_data[16]);
> -       loongson_sysconf.cores_per_package = *(dmi_data +
> SMBIOS_THREAD_PACKAGE_OFFSET);
> +       if (dm->length < 0x30)
> +               thread_count = *(u8 *)(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
> +       else if (thread_count == 0xff)
> +               thread_count = *(u16 *)(dmi_data +
> SMBIOS_THREAD_PACKAGE_2_OFFSET);
> +       loongson_sysconf.cores_per_package = thread_count;
>
>          pr_info("CpuClock = %llu\n", cpu_clock_freq);
I feel there is a problem with this method.
I saw on the 3C6000/Q machine a few days ago that the dm->lenght is 0x30,
but only one byte is used, and the thread_count is 128, not 0xFF.
Is the initialization thread_count = *(u8 *)(dmi_data + 
SMBIOS_THREAD_PACKAGE_OFFSET) missing?
Wouldn't it be better to change it this way?

+       u8 thread_count;

         freq_temp = ((*(dmi_data + SMBIOS_FREQHIGH_OFFSET) << 8) +
                         ((*(dmi_data + SMBIOS_FREQLOW_OFFSET)) & 
SMBIOS_FREQLOW_MASK));
         cpu_clock_freq = freq_temp * 1000000;

         loongson_sysconf.cpuname = (void *)dmi_string_parse(dm, 
dmi_data[16]);
-       loongson_sysconf.cores_per_package = *(dmi_data + 
SMBIOS_THREAD_PACKAGE_OFFSET);
+       thread_count = *(u8 *)(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
+       if (thread_count == 0xFF && dm->length >= 0x30)
+               thread_count = *(u16 *)(dmi_data + 
SMBIOS_THREAD_PACKAGE_2_OFFSET);
+       loongson_sysconf.cores_per_package = thread_count;

         pr_info("CpuClock = %llu\n", cpu_clock_freq);
  }
> Huacai
>
>>          pr_info("CpuClock = %llu\n", cpu_clock_freq);
>>   }
>> --
>> 2.20.1
>>

