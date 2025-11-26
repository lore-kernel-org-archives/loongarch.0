Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB8D2E7BC2
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764155254; cv=none; b=ZlMoETDs32lPxOuXAxkigT9zIsHdeQmATuOTzp26iZjWApA4wG5BmRE0ZvycNaGi5TvNdkaDLQm0COpLM7GLpFoeE+m89T2RGez3+8WQ5HW/xksL49txgNSQZ+1twbZLAdWYJFgu8YP8XyDued4ZQCICQEsXNwTZrU0qvRobrb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764155254; c=relaxed/simple;
	bh=dleS/DsAjAg+dX5y53dT8EGbQFTqtQ4aRoPoyW/470M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fntmV0AZ71X6G/Su0HmW7WsUgJeWDpEq16MPx9dKV7bzIDGKh8Q5q6KKQPycrfxQjgcvgG4zEgDACfTEewOb2Wkh+J2GlGO2nO432Y9E3mt5Uhk+J/Jnor3h1vD2Ypd9WtEH8UUISiizSonTfCwMn4v3rLAdsr70A4SAEAdmlfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=od0H8SiR; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="od0H8SiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764155215;
	bh=jjRHlwDFzOG3X3+/pMzSVtpQj9tO0tC+cCKtsKOvAzw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=od0H8SiRCkIqRjoMbTh9PX1G0w+BTNdA5hfvlf1FhgctyZhK1sf6wDCXSie2L6/uR
	 ow48lb3YsxCpFDNWq3GkNmHbV6hDY5x/xPz07OvEx7Mw0tGJFp7+4SMZ0YnAOhr/zT
	 1WkdPFwc1B5VvlL1R0pvmJ3D0I3IbUFK5Ya7kTSw=
X-QQ-mid: zesmtpip2t1764155208tef38205b
X-QQ-Originating-IP: An8M4y7bR7bKkYdnbrGuvQvjRiH0iyTz9QwiNeucQ4Q=
Received: from [IPV6:2409:8900:86c4:812e:7fca: ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 26 Nov 2025 19:06:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1383146114983672354
Message-ID: <EF30F5A4B2075D4A+9d7c2fe9-b621-46e1-8dc0-6a0dea42292c@uniontech.com>
Date: Wed, 26 Nov 2025 19:06:45 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] LoongArch: Correct the calculation logic of thread_count
From: Qiang Ma <maqianga@uniontech.com>
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, kernel@xen0n.name
References: <20251126023631.3143434-1-maqianga@uniontech.com>
 <1181117654604707+19e1f957-3fd5-4768-a575-397c17d4d1d4@uniontech.com>
 <CAEyhmHSqF5DiM2CVyzvAjwTy+KaYAAhwtu2sn1xGWyk4ZF5-bQ@mail.gmail.com>
 <d28a0011-5b9a-4e3e-a517-0c6d8933adae@uniontech.com>
In-Reply-To: <d28a0011-5b9a-4e3e-a517-0c6d8933adae@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MQZ/dZQlO/THhphT7Vn2bV/Yx4VgFosysFJCeUV7XwGW/vwXs90qVpQT
	mpru0i/zyOVDzgQ1sCGg4uJi7ZOzNplE0yuDQBWjx/fa9s48eG9c/E7o5aSXJTWtI8Ok4tu
	0qnmedxWxanXO2TopETjfFKnRVYAxbcEVxRBRuZaDAPci9tmdoIRLuNhbmW5YIU5063E34y
	C9lZpqwdn3lle4miX4RDxFOiO3MK2TPVkWpk2AtswfRkgyrJVKcs5K7cye95kjfjGQPsXzg
	Bm958wK2gg0/FobLEcMkd5vsBKc4hpUw+bjkRR95teEgOA/cA0TJqh+X8JTftDgqLkLVeFE
	2CowHZFZzlfNQNJ+ilWsIQAKQAquiog/4BkxFGsT079Rf7oOFgJfTCC/+YsVsfzl7Yd+BZF
	a4TRmGbVxI16kU1Qpx1C94cfjqqtjU4g3QEZ1R6yDFD8y4U+qaLircTF6Gc16rV0pjrQQKX
	wn6FcZ6qkzjXkxoRt5SjAardlSMPOlG4LImyB5LktJrPIuJWvfh0tuSokAhocnhdf0XaWPB
	NTO3Ia5hQBLI7FNEVFIutHMUJtlD3sf9MRZHeLjn3gF1g/2rePCdXN1nDSf+JpExkEiYSok
	EYNJL9HLJa7JYvMwylwQ6wYfYQ7zYhZeoS1nITwCRt10tdvF9PvVOvgm+tmz8xgPs7P1Fe5
	o7pwcSP20Z1J4S3IobvmPTtzmJe0w+k7fqy4RZkIF4ki8UKUoNULvrkJtPQtrHoFKRAwL7N
	ekLbQAv9h1VjTGtrpoaJ/fFa1IjG1pGvcfMBsDfosYQnaYcTLoJp6ac/FsszckFqzXPrNFE
	oPtxSgke113Dm0/pGWUbSOz8P5mOk1+tBD2HPWf2+n6NY/jKO56NZsOJ8r+IkBM6NYJpBI3
	Y5ZSwXc2m4aCa9Ycn9HlYUcCmV0FQuREMPb+bS0dmZkte/nlrm02w8uIq/Ml9zKqzV09Y+l
	Afbo4nGvUZ3COTrk1IDm0CToIt1gR0CvgH4Y6Y5OuiiIYJqhX2llWgv1+rQ/uOD/U9lazlO
	dOspX0wo+aQDsDqqJHRI0AWuoVwoixBCsnULPqsfuJyIoRs+SM8P+7VHEZFcQ=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0


在 2025/11/26 18:14, Qiang Ma 写道:
>
> 在 2025/11/26 18:06, Hengqi Chen 写道:
>> On Wed, Nov 26, 2025 at 5:47 PM Qiang Ma <maqianga@uniontech.com> wrote:
>>>
>>> On Wed, Nov 26, 2025 at 10:37 AM Qiang Ma<maqianga@uniontech.com> 
>>> wrote:
>>>
>>>>    For thread_count, the current calculation method has a maximum 
>>>> of 255,
>>>>    which may not be sufficient in the future. Therefore, we are 
>>>> correcting
>>>>    it now.
>>>>
>>>>    Reference: SMBIOS Specification, 7.5 Processor Information (Type 
>>>> 4)[1]
>>>>
>>>> [1]:https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.9.0.pdf
>>>>
>>>>    Signed-off-by: Qiang Ma<maqianga@uniontech.com>
>>>>    ---
>>>>     arch/loongarch/kernel/setup.c | 9 ++++++++-
>>>>     1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>>    diff --git a/arch/loongarch/kernel/setup.c 
>>>> b/arch/loongarch/kernel/setup.c
>>>>    index 25a87378e48e..760f5ce44384 100644
>>>>    --- a/arch/loongarch/kernel/setup.c
>>>>    +++ b/arch/loongarch/kernel/setup.c
>>>>    @@ -56,6 +56,7 @@
>>>>     #define SMBIOS_FREQLOW_MASK            0xFF
>>>>     #define SMBIOS_CORE_PACKAGE_OFFSET     0x23
>>>>     #define SMBIOS_THREAD_PACKAGE_OFFSET   0x25
>>>>    +#define SMBIOS_THREAD_PACKAGE_2_OFFSET 0x2E
>>>>     #define LOONGSON_EFI_ENABLE            (1 << 3)
>>>>
>>>>     unsigned long fw_arg0, fw_arg1, fw_arg2;
>>>>    @@ -120,13 +121,19 @@ static void __init parse_cpu_table(const 
>>>> struct dmi_header *dm)
>>>>     {
>>>>            long freq_temp = 0;
>>>>            char *dmi_data = (char *)dm;
>>>>    +       u8 thread_count;
>>>>    +       u16 thread_count2;
>>>>
>>>>            freq_temp = ((*(dmi_data + SMBIOS_FREQHIGH_OFFSET) << 8) +
>>>>                            ((*(dmi_data + SMBIOS_FREQLOW_OFFSET)) & 
>>>> SMBIOS_FREQLOW_MASK));
>>>>            cpu_clock_freq = freq_temp * 1000000;
>>>>
>>>>            loongson_sysconf.cpuname = (void *)dmi_string_parse(dm, 
>>>> dmi_data[16]);
>>>>    -       loongson_sysconf.cores_per_package = *(dmi_data + 
>>>> SMBIOS_THREAD_PACKAGE_OFFSET);
>>>>    +       thread_count = *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
>>>>    +       thread_count2 = *(u16 *)(dmi_data + 
>>>> SMBIOS_THREAD_PACKAGE_2_OFFSET);
>>>>
>>>> You have `dm->length >= 0x30` below but the memory load already 
>>>> done here.
>>> After reading thread_count2, it cannot be guaranteed that the data 
>>> is valid.
>>>
>>> 'dm->length >= 0x30' can detect that thread_count2 is an available 
>>> data,
>>> right?
>>>
>> I mean you should perform the check before doing memory load.
> It doesn't matter whether it's before or after.
My understanding was wrong. I will fix it in v2.
>
> Anyway, here it's just reading. Before it's actually used later,
> it will check this length.
>>>>    +       if (thread_count != 0)
>>>>    +               loongson_sysconf.cores_per_package = dm->length 
>>>> >= 0x30 && thread_count == 0xFF ?
>>>>    + thread_count2 : thread_count;
>>>>
>>>>            pr_info("CpuClock = %llu\n", cpu_clock_freq);
>>>>     }
>>>>    --
>>>>    2.20.1
>
>
