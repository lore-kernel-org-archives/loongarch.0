Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD57C31771B
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 09:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236980; cv=none; b=gj9T1orRMGeFGt5aylqfEPer8gL6GjEi5e9leuefwvTO/m2DZXrkQwNBQJryhQ+AIu7/0TlotJNYQkfY2eohqPYC+5HfTaJMpXdfGm1r0R1q2W5S8BhWl50OlND3lnLCl4hQjrQ3YsS7AQjIqzAzSPXzAuTa/hWFnc+zBFqYvlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236980; c=relaxed/simple;
	bh=qTEpcWBacxJHcGnk4sjAr5M3iFyFJCtrbi+IWEMewuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=blPNsWiIgFZCf+YRi94UCaNKawMIYN/ll/mONS8wLjDx5rf98wN6neKp8Mscc0d3ZUNxavoTmbHLr1qyBG8DpmShrZdkoNIpPnPKnivmvRv1R5czJ5wVuHnx6rRuDcKbvUxvt6guB2VIttsRywZnVS/fnAB6i+VJCTz4mOdSEpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=RKntuM/L; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="RKntuM/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764236939;
	bh=/G/hU8FEDU833QqwW8MDYuQoYoOJBBL+TKnFoHyLTjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=RKntuM/LHyl4Z+TqrbLfc3pL+4L5KOlcMpFjV0qHK6oWdYVaDnwhKElTKLryAiLCE
	 geKXEq8Rkyw5aiORPjnQBW/DzRfhpPgZOFHuQZiIMBhdbUCZws1+PEogqKjXUnJL3O
	 mmVXut+8rFH+SCz0YC1jNfL8hToNB8eAjUnwc2JM=
X-QQ-mid: esmtpsz18t1764236931t95647ca4
X-QQ-Originating-IP: lbawp12fK9ksvKRrTfMg11IwZwKaB7yV6tvdhVerwJQ=
Received: from [10.10.74.117] ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Nov 2025 17:48:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13346167645244312730
Message-ID: <CB1053E012AD1BAD+5d6129b8-86d7-421c-806b-d872f5a3ea0a@uniontech.com>
Date: Thu, 27 Nov 2025 17:48:49 +0800
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
 <B2E7E43661ACD241+64a342c7-66c0-4564-92c9-405bc0cd911b@uniontech.com>
 <CAAhV-H51t3FT6y8iYOU02FOoZ5dNsqwdpqjaWWwiQwhhuUbbYQ@mail.gmail.com>
Content-Language: en-US
From: Qiang Ma <maqianga@uniontech.com>
In-Reply-To: <CAAhV-H51t3FT6y8iYOU02FOoZ5dNsqwdpqjaWWwiQwhhuUbbYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MhJ5K6/MvAhhFjSmO1b5Jl0nixt4vDuPgsfzlfI6KqrwuzV5e4T3BFol
	JQKftjRw4UDIBttUPwxF01rpJa6Jwc9ZzChjKgxrYpFi/0tADchJNX/4TquiuyEy3EwHbl3
	JkmsMyQfhQIfo2rR6BXSQqvwIhMieX4K0DNSrvTTaoVp+qlR5FwSMyxrvLAwwiJlwBva6aO
	lHvLi8pcWuquTeg5x3Yjutz33QOpIF1MxsVbg2CnaHD17tfeUe/AI4bP4D1NLSeZ7/BIYjW
	4Pax8GDtsHW6TQ2Oe29U4oc/24ONX2pz5muv8vvjjaboLG+kxGR55RgBdbysJzx9bUYODtm
	+vpSerLEq5ioAmZb+QDC/y/dMH3pFeTLxb6kezhdVtw/6CbmNXPtB3DlY3Nedm1euyddqJI
	g8JOeRM1HeSnMBfxVRewlRShHXIYQT9AXhwvy23aI8oelsJkpPzudVBrkCbGZLAAMRCoVNn
	cDbuUbj55kR5yXIBlXSdnuukCgTTgwD+eIefqZBM6iaUGlS3g6Ni+IYV2eV7uDGVbeHtT4P
	IqPBN3xZ1xYGhP9bNq+UCB7BTgE+dnwAJZ3uQ8pRL0LbLGKVHqpDuFTRY3I5ZHpXp8SNPrS
	yzvP+QXHJUbUZujTiVfbewNqn2XMKmsSjtjO8xDQEypW+UJKE9swe8Ku1s0WUXIg892uwdG
	WsFi7Ux489vTiid2do8W6D0hpQstWKFXjLiXdH12C/sz1TdILHcRBW5j2GtvIEjFHsp7pVW
	teMkMZZMNgkDIgveVumd3a9sicjsIrokfbNmNWEJnnVUXPdVFgVVSmCENl/0kt65reKpwoO
	VuzKHhMuF2nKqym9XB9UTKCVmcrSti7fR4hjU9LQY/aA8/IDGszYurwbHZCNbjJn0Q/i36n
	AWvE3XILlFPcrx7nic81/4Ilchma+K3EYqLxsMrfxtrIcHVqbDep1Tm/ySpkEVnD1J3Teiz
	v5UsgPABD9yBelhdHJjVrC4f6HGGvSjz0XDb/8R5RIlTLpUojoOmrAyziEHo1DvYnWSbjg/
	uT4M/KTWVOK1Zs3Z3olQ9VxMZ6jgh8yPxWjiYla+pE6+TMdd5eMffinFH3jvCuB4DQ0zBnW
	j2wAH+wDGgo3+fUHETryQHuNvCZj/l1cil4MLjcXMrm
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0


在 2025/11/27 17:35, Huacai Chen 写道:
> On Thu, Nov 27, 2025 at 4:56 PM Qiang Ma <maqianga@uniontech.com> wrote:
>>
>> 在 2025/11/27 15:36, Huacai Chen 写道:
>>> Hi, Qiang,
>>>
>>> On Thu, Nov 27, 2025 at 11:32 AM Qiang Ma <maqianga@uniontech.com> wrote:
>>>> For thread_count, the current calculation method has a maximum of 255,
>>>> which may not be sufficient in the future. Therefore, we are correcting
>>>> it now.
>>>>
>>>> Reference: SMBIOS Specification, 7.5 Processor Information (Type 4)[1]
>>>>
>>>> [1]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.9.0.pdf
>>>>
>>>> Signed-off-by: Qiang Ma <maqianga@uniontech.com>
>>>> ---
>>>>    arch/loongarch/kernel/setup.c | 9 ++++++++-
>>>>    1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
>>>> index 25a87378e48e..8dd25fc4bd13 100644
>>>> --- a/arch/loongarch/kernel/setup.c
>>>> +++ b/arch/loongarch/kernel/setup.c
>>>> @@ -56,6 +56,7 @@
>>>>    #define SMBIOS_FREQLOW_MASK            0xFF
>>>>    #define SMBIOS_CORE_PACKAGE_OFFSET     0x23
>>>>    #define SMBIOS_THREAD_PACKAGE_OFFSET   0x25
>>>> +#define SMBIOS_THREAD_PACKAGE_2_OFFSET 0x2E
>>>>    #define LOONGSON_EFI_ENABLE            (1 << 3)
>>>>
>>>>    unsigned long fw_arg0, fw_arg1, fw_arg2;
>>>> @@ -120,13 +121,19 @@ static void __init parse_cpu_table(const struct dmi_header *dm)
>>>>    {
>>>>           long freq_temp = 0;
>>>>           char *dmi_data = (char *)dm;
>>>> +       u8 thread_count;
>>>>
>>>>           freq_temp = ((*(dmi_data + SMBIOS_FREQHIGH_OFFSET) << 8) +
>>>>                           ((*(dmi_data + SMBIOS_FREQLOW_OFFSET)) & SMBIOS_FREQLOW_MASK));
>>>>           cpu_clock_freq = freq_temp * 1000000;
>>>>
>>>>           loongson_sysconf.cpuname = (void *)dmi_string_parse(dm, dmi_data[16]);
>>>> -       loongson_sysconf.cores_per_package = *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
>>>> +       thread_count = *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
>> Yes, this one should need to be converted:
>> thread_count = *(u8 *)(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
>>>> +       if (thread_count != 0)
>>>> +               loongson_sysconf.cores_per_package =
>>>> +                               dm->length >= 0x30 && thread_count == 0xFF ?
>>>> +                               *(u16 *)(dmi_data + SMBIOS_THREAD_PACKAGE_2_OFFSET) :
>>>> +                               thread_count;
>> This patch method refers to dmidecode, which is the same as it, like this:
>>
>>                           if (data[0x25] != 0)
>>                                   pr_attr("Thread Count", "%u",
>>                                           h->length >= 0x30 && data[0x25]
>> == 0xFF ?
>>
>>                                           WORD(data + 0x2E) : data[0x25]);
>>
>>
>>> According SPEC, it uses THREAD_COUNT_2 only if dm->length >= 30 and
>>> thread_count == 0xff, so the correct and simplest way is like this:
>>>
>>>           cpu_clock_freq = freq_temp * 1000000;
>>>
>>>           loongson_sysconf.cpuname = (void *)dmi_string_parse(dm, dmi_data[16]);
>>> -       loongson_sysconf.cores_per_package = *(dmi_data +
>>> SMBIOS_THREAD_PACKAGE_OFFSET);
>>> +       if (dm->length < 0x30)
>>> +               thread_count = *(u8 *)(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
>>> +       else if (thread_count == 0xff)
>>> +               thread_count = *(u16 *)(dmi_data +
>>> SMBIOS_THREAD_PACKAGE_2_OFFSET);
>>> +       loongson_sysconf.cores_per_package = thread_count;
>>>
>>>           pr_info("CpuClock = %llu\n", cpu_clock_freq);
>> I feel there is a problem with this method.
>> I saw on the 3C6000/Q machine a few days ago that the dm->lenght is 0x30,
>> but only one byte is used, and the thread_count is 128, not 0xFF.
>> Is the initialization thread_count = *(u8 *)(dmi_data +
>> SMBIOS_THREAD_PACKAGE_OFFSET) missing?
> Yes, you are right. Kernel code prefers 0xff rather than 0xFF, and I
I see.
> want to add a comment, so I think the below is OK.
Yes, I also think it's okay. I will update it to v3.
>          loongson_sysconf.cores_per_package = *(u8 *)(dmi_data +
> SMBIOS_THREAD_PACKAGE_OFFSET);
>          if (dm->length >= 0x30 && loongson_sysconf.cores_per_package == 0xff) {
>                  /* SMBIOS 3.0+ has ThreadCount2 for more than 255 threads */
>                  loongson_sysconf.cores_per_package = *(u16 *)(dmi_data
> + SMBIOS_THREAD_PACKAGE_2_OFFSET);
>          }
> Huacai
>
>> Wouldn't it be better to change it this way?
>>
>> +       u8 thread_count;
>>
>>           freq_temp = ((*(dmi_data + SMBIOS_FREQHIGH_OFFSET) << 8) +
>>                           ((*(dmi_data + SMBIOS_FREQLOW_OFFSET)) &
>> SMBIOS_FREQLOW_MASK));
>>           cpu_clock_freq = freq_temp * 1000000;
>>
>>           loongson_sysconf.cpuname = (void *)dmi_string_parse(dm,
>> dmi_data[16]);
>> -       loongson_sysconf.cores_per_package = *(dmi_data +
>> SMBIOS_THREAD_PACKAGE_OFFSET);
>> +       thread_count = *(u8 *)(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
>> +       if (thread_count == 0xFF && dm->length >= 0x30)
>> +               thread_count = *(u16 *)(dmi_data +
>> SMBIOS_THREAD_PACKAGE_2_OFFSET);
>> +       loongson_sysconf.cores_per_package = thread_count;
>>
>>           pr_info("CpuClock = %llu\n", cpu_clock_freq);
>>    }
>>> Huacai
>>>
>>>>           pr_info("CpuClock = %llu\n", cpu_clock_freq);
>>>>    }
>>>> --
>>>> 2.20.1
>>>>
