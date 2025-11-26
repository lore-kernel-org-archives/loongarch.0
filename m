Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689722F83A3
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 10:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764152105; cv=none; b=kfkJ21JYm7qnVPRCeCIr+0Hu37gBMYalevLULKbYHvgomJ9ly8SeG3mgWnqjVPp6QZjCdfqUcXA1vZikQwzqMoH35E5jlLJvwI60hRjVa3emmgtTuDWNi4puhzqkxIuckXbRwh6RTA7LsPbrUs/dK8tH0xcOQU0NZj5oCEd8014=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764152105; c=relaxed/simple;
	bh=06VifhoUi5J746/8j/QGWBKEsgeQW5rveT4BMD6m+gY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qIAcoiItdlmlcmRE2Qx2yr0ol7Z1eBqBgRI/FgFPPziVn486GxcshRw8IgxDgJJ7SwINSi0phMFsnomRK7F6N0u/TahU7/+pPnLqXjLIc4RF41Z3KGE8cEcrzADB3e0Hk2pCj1T3nZtQlGu19vW7Gg6cxhVdjSMlM61+G13BEJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Gql1s4I+; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Gql1s4I+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764152079;
	bh=bbNCJ0B/Z3BW0VqRL0ixx3g1JS2PgDS9aX257G80Lb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Gql1s4I+exvnn2uqT4Fb1qYpXQBFMZ9hMR+iPrf7I1SP8jpOfxrSyhgydLI5zAaAk
	 tf82sMed3y/z2id1W5CQGDeey0xy/rwUyk6zivktpWjR7g4xEHxzvVfGEN1fvCTdL9
	 7qvT41UFqw4FuM82BNt6pUPq7JwhnRtgdHggYDDM=
X-QQ-mid: esmtpgz15t1764152073td5a5ce9f
X-QQ-Originating-IP: LpM584uvuxwFwqF6jB3ac9FSKRapItHx3wV624B2BQo=
Received: from [10.10.74.117] ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 26 Nov 2025 18:14:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12836814446846502942
Message-ID: <358F43AAEDB45D43+d28a0011-5b9a-4e3e-a517-0c6d8933adae@uniontech.com>
Date: Wed, 26 Nov 2025 18:14:31 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] LoongArch: Correct the calculation logic of thread_count
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, kernel@xen0n.name
References: <20251126023631.3143434-1-maqianga@uniontech.com>
 <1181117654604707+19e1f957-3fd5-4768-a575-397c17d4d1d4@uniontech.com>
 <CAEyhmHSqF5DiM2CVyzvAjwTy+KaYAAhwtu2sn1xGWyk4ZF5-bQ@mail.gmail.com>
Content-Language: en-US
From: Qiang Ma <maqianga@uniontech.com>
In-Reply-To: <CAEyhmHSqF5DiM2CVyzvAjwTy+KaYAAhwtu2sn1xGWyk4ZF5-bQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MQaSltTJPhII0imSIDVYkRkH8kt1CY/LHvxYJ8oa5tbgtSQeOwgpSsC1
	vB0VLsNzYwvOyh2ZOsTP8PTa/VdsILJm6dzbmllnvCYovRALYc27KqCPfXzdDBWwNcJigKv
	fMs5KmMQ/0l433KzYClTDAMSw4f0SPvhemq8MIrxV1cVKsPXZFi2HwNRP9mMaxAMGh3+ylt
	5PBs/Ibfp6sYFaYVcQpUMUAlKPWOYhSiO9u6siZC2twVMwF172UaH0sZEYvG+HD8pbH+P1c
	zIpruBWw809SkO3FwJetC9gGWf33XOYnxA7g/wlPk5FwcjshdGh9WL8+wiR0TIuGxrCF7Mw
	2499K/azfVsDYxRUr+tiWQj6izvYkGW34ax2Sh0xPPmYAuVOqQLK9kEXM/kP/3EnrjG+uaT
	REtH58oVlxkKMB8YhWo2YrUPHtIIC+pOb/0UNWPcWauqJlX+AuIp6L84S0eN6bJfA3Pf5k5
	zfUsiXobxFJnZPrKJqSfysBXLso9ZfkT1PaPirz2vfzhNHi5eMdESKPZ9Rcbta9oRON+6Lr
	iU+BBrSWi+6aRbig9hLCr78YFmIazo466ruNLVQ99kkM37GCtjk9cbuMkCULQYC8AtkdK+k
	vpnO/JhtLh27t18I3RHKncp08vFsP3266WZWvkTpxzEInN37Ygb+IbisDNAbh+v9v3QYJi7
	1zD6pV7gTow4rG7AAK3xpNudgU7vAMqDq+ea/avB9oHp7o8BJpP4xNFOjVCvODtLsoNldyx
	fsL0Mb0tusVI7YWESBJTezue/ksfhKGPL+iWqyhx1fqvux0BZjgObAiQuXjSuyE+gr159xx
	KYsugYfM0KyLl6CxiYu/nffvycoNTD81X/4KKaZ+D5PEDExkHrL/75IbxetfYnrsS587hXE
	e1vxMUY0x+W11B3aRRkKfo6aX46yGzmM/yEm6PQcQq+K9nhDBNUsn55yyWDjoUoWT+Xg7iT
	WgsoINeUQTI17OzBLxkDYH7HyfHFBop5FBYZcXmjFnyeohB4CBDdhM6XtmBFm5xPpsAOYtc
	2hKjsCWgVbc8V7RR0c6+oVFaQA8EnhieMEUGrxAJLkSIVEdMVL5TFMrAUb4fRzdRTppa00k
	bx2+TrizsO4JHaQlA5OHLuCsKFS9wZ17w==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0


在 2025/11/26 18:06, Hengqi Chen 写道:
> On Wed, Nov 26, 2025 at 5:47 PM Qiang Ma <maqianga@uniontech.com> wrote:
>>
>> On Wed, Nov 26, 2025 at 10:37 AM Qiang Ma<maqianga@uniontech.com> wrote:
>>
>>>    For thread_count, the current calculation method has a maximum of 255,
>>>    which may not be sufficient in the future. Therefore, we are correcting
>>>    it now.
>>>
>>>    Reference: SMBIOS Specification, 7.5 Processor Information (Type 4)[1]
>>>
>>>    [1]:https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.9.0.pdf
>>>
>>>    Signed-off-by: Qiang Ma<maqianga@uniontech.com>
>>>    ---
>>>     arch/loongarch/kernel/setup.c | 9 ++++++++-
>>>     1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>>    diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
>>>    index 25a87378e48e..760f5ce44384 100644
>>>    --- a/arch/loongarch/kernel/setup.c
>>>    +++ b/arch/loongarch/kernel/setup.c
>>>    @@ -56,6 +56,7 @@
>>>     #define SMBIOS_FREQLOW_MASK            0xFF
>>>     #define SMBIOS_CORE_PACKAGE_OFFSET     0x23
>>>     #define SMBIOS_THREAD_PACKAGE_OFFSET   0x25
>>>    +#define SMBIOS_THREAD_PACKAGE_2_OFFSET 0x2E
>>>     #define LOONGSON_EFI_ENABLE            (1 << 3)
>>>
>>>     unsigned long fw_arg0, fw_arg1, fw_arg2;
>>>    @@ -120,13 +121,19 @@ static void __init parse_cpu_table(const struct dmi_header *dm)
>>>     {
>>>            long freq_temp = 0;
>>>            char *dmi_data = (char *)dm;
>>>    +       u8 thread_count;
>>>    +       u16 thread_count2;
>>>
>>>            freq_temp = ((*(dmi_data + SMBIOS_FREQHIGH_OFFSET) << 8) +
>>>                            ((*(dmi_data + SMBIOS_FREQLOW_OFFSET)) & SMBIOS_FREQLOW_MASK));
>>>            cpu_clock_freq = freq_temp * 1000000;
>>>
>>>            loongson_sysconf.cpuname = (void *)dmi_string_parse(dm, dmi_data[16]);
>>>    -       loongson_sysconf.cores_per_package = *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
>>>    +       thread_count = *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
>>>    +       thread_count2 = *(u16 *)(dmi_data + SMBIOS_THREAD_PACKAGE_2_OFFSET);
>>>
>>> You have `dm->length >= 0x30` below but the memory load already done here.
>> After reading thread_count2, it cannot be guaranteed that the data is valid.
>>
>> 'dm->length >= 0x30' can detect that thread_count2 is an available data,
>> right?
>>
> I mean you should perform the check before doing memory load.
It doesn't matter whether it's before or after.

Anyway, here it's just reading. Before it's actually used later,
it will check this length.
>>>    +       if (thread_count != 0)
>>>    +               loongson_sysconf.cores_per_package = dm->length >= 0x30 && thread_count == 0xFF ?
>>>    +                                                    thread_count2 : thread_count;
>>>
>>>            pr_info("CpuClock = %llu\n", cpu_clock_freq);
>>>     }
>>>    --
>>>    2.20.1

