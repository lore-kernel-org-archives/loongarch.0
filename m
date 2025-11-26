Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE7D31812F
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 08:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146303; cv=none; b=ugyP1LBkL3+wLmG4tlO3qb8Riw58R9y+eVhCtlOuk7fnhR+c08OLMObpgeG+G2BTCKXorKURO7Ur7nNWuh+38kCvxGHWjZbmACfAG3Ne/ALukr1fOk+EVHeUq/SVt14brNR9e0IRknjx8dE2Ltga6tY0I3IfZvmhxF+3SZIZW0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146303; c=relaxed/simple;
	bh=cy/NqNzcz7p35zhYC3JLi5nLozirQc7eR2yu+5ZdP2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TANYdg/AiXYRIi7yP5QqqGH1Hw65PkcLoCSt06aN1vpP0zxNF0lXFNMkPvNNXSnxqy+eRrixactLUFLhCZdq9y0Xd2levBc3d6sls7O84REQtY5tFn7gC8XE06Ti6ytnqv5S3CVhrPm0zzRwOs/rFgzNgXjDS+dga4BViFUt2fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=GX46QPhy; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="GX46QPhy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764146283;
	bh=I8ReBLyI7i9dKKE/Fnkdc0hUDF+f8WfYlQUGCX0OB84=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=GX46QPhywRlyB/0jNvQroX6tAnZcEVTPm0gLkZNopAUmQWMlgzhroc+7wb82tn3kt
	 QoLA4WxuO0GvZINiQc5k1IAKDjuMwLcq9duJ/ZOqVWh4L+2XFfbKxW+vfBiUZ9VZaC
	 JxWnCvndk+UooJpeZUwqZ5dMkh3z7KfCBGeK+cBw=
X-QQ-mid: esmtpsz21t1764146277t16b92beb
X-QQ-Originating-IP: VhAjf8wjhAal6wZ5p27ln0fLY5tQ+Adg/kV/2fDGstQ=
Received: from [10.10.74.117] ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 26 Nov 2025 16:37:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 3668124203375384710
Message-ID: <0FD06C8FDE07BF59+07c19146-e999-4f09-83dd-4ef1ed7d4b1b@uniontech.com>
Date: Wed, 26 Nov 2025 16:37:55 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] LoongArch: Correct the calculation logic of thread_count
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251126023631.3143434-1-maqianga@uniontech.com>
 <CAAhV-H4EOTwn3fSJHWOkahgO3VHPGN9k9mbY7akpHDny_sBOsQ@mail.gmail.com>
Content-Language: en-US
From: Qiang Ma <maqianga@uniontech.com>
In-Reply-To: <CAAhV-H4EOTwn3fSJHWOkahgO3VHPGN9k9mbY7akpHDny_sBOsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OWAyBQUmjFVPm2eITXkdCA2I3D775xaYHoGrXiVsm19PtC8YxHSi/B/e
	OK0xoacPzrF6CEvVug7DhkEjx/GqWSkKSJ5dAWw0BMXzbZ21nOQmh0BjJqAaQWzLB/zxAkX
	RVr8bG1pn4MK3+z2nt1WMoHPkcuWsmZNgs0TWo5rePo47YK/doeO/5H5aZlDfT7ijwSjdkV
	VjYN3dbwzUwi+ePyjRqf+FcpPti/fb5g7MXIMdTf7KxjQXO9qNbVfNfgYlZ6lUFpHKNGq6p
	Sxiz21L5cwE+KHcHsynlOw0Dn40IZpQNdY0KpZeWfJk4VoMui80j4qgC7SBCLHcHr7J8rHH
	mm01K7oIuq9KHYNxRobA/6YXjsM42pIUk/WqlBPN9oPGMDHKQWVo6Ohy+zNHgjwj0XRjFE2
	r2uGtT504dhKGUGJj/GBp17YfR8OVuEY9Dd755LpGlTkRCXy33tQNmowxg6KiCqZqjmsz3O
	wbcoFb7ytFen8hwYsT4zLnoGwXsyxwjfRhbHnJp0cXMA+R+6y3I+pehlbVjA1x0GX1/Awmu
	ZoIgvUduUl++9mA3KY69eVGT6kbl/5qQ+wV99X6UQ8uX8xe9OP0KVEI1+2Zt4UmJaQskcgS
	8CiBKA2FMBGzxKBpSCT4JsPbL+wg2c+bi1gcgYvsVM/Dyez53rCVTgidSIiP+oplDdH3zWI
	TX8HlvlkY4DDELoGNpSZYVAt1OHGyh7Ej0ETFuO72tuDuZXY6de8aJOLz1pauWxidprU115
	s5X//pkjKzAqO9vledmZ76/WchfASsdsP8b4UrbvKzdE1QqteNBRRiVWrEt0rKaneM2Rj9k
	1h+kb+EJRpONiDrVRHTaJElXcLuTNiKqoZy0nASHyWoPWVE+huzOteXFlMp23rOGy9b2DSh
	ngaPRZeeuZZnWGYU4YF6kPjCXYe/bg4eqHJEHr1r9AdfeuAZddOYmUKZGCnZd4b4CUyUDj/
	PGBAROtkLGymwR/nWNTCJGuGIgD+p/HAJTR5thKEGkcijW2ZEy1mzl9+b4dqRGFnrAf3W7X
	3fRGQHSF7rakxFFXyDJwjZfWPnEefxmPPxifJEF5qBVmnmuO24PKb9t8s5QXlPQzHxWAIDA
	zOLH438Npi/gAl454QGCdJwt39Ara238Q==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0


在 2025/11/26 12:49, Huacai Chen 写道:
> Hi, Qiang,
>
> On Wed, Nov 26, 2025 at 10:37 AM Qiang Ma <maqianga@uniontech.com> wrote:
>> For thread_count, the current calculation method has a maximum of 255,
>> which may not be sufficient in the future. Therefore, we are correcting
>> it now.
> I think you should contact the Loongson BIOS team to confirm they will do so.

I contacted Li Chao from the Loongson BIOS team and had a brief 
communication.

bios will do this when it exceeds 256.

>
> And we can hardly meet the case that one socket contains more than 256
> cores (this is different from the case MAX_CPUS > 256)
According to Li Chao, the 256 logic core on a single chip should arrive 
in the next generation.
> Huacai
>
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
>> index 25a87378e48e..760f5ce44384 100644
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
>> +       u16 thread_count2;
>>
>>          freq_temp = ((*(dmi_data + SMBIOS_FREQHIGH_OFFSET) << 8) +
>>                          ((*(dmi_data + SMBIOS_FREQLOW_OFFSET)) & SMBIOS_FREQLOW_MASK));
>>          cpu_clock_freq = freq_temp * 1000000;
>>
>>          loongson_sysconf.cpuname = (void *)dmi_string_parse(dm, dmi_data[16]);
>> -       loongson_sysconf.cores_per_package = *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
>> +       thread_count = *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
>> +       thread_count2 = *(u16 *)(dmi_data + SMBIOS_THREAD_PACKAGE_2_OFFSET);
>> +       if (thread_count != 0)
>> +               loongson_sysconf.cores_per_package = dm->length >= 0x30 && thread_count == 0xFF ?
>> +                                                    thread_count2 : thread_count;
>>
>>          pr_info("CpuClock = %llu\n", cpu_clock_freq);
>>   }
>> --
>> 2.20.1
>>

