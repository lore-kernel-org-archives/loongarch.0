Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A894C8F5C
	for <loongarch@lists.linux.dev>; Fri,  6 Sep 2024 01:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725585259; cv=none; b=sjYyTzP6pUpO6x196VlwdlerYdbnmo2RBvFmRmE0oqM/TjIXRpbjpCzP9f6KjdNbr3pwsJARaiN9PkpH24y3xBeWq/FohMDXzi04fSniwc6/vbclBAvFIqRHgdT47jZCZ5bRwUkMMkCObtbCP9ZNc1XkWj1S2uZNYNFNTePcFU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725585259; c=relaxed/simple;
	bh=Xgtoa7aqonzcxGPObclRcFfzhHlaecu6G+k2Ruid+MQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ah2/o3fXZcQEPBfKWbwusfwKe3KTkEgQcHVQiSSbdT0aSYx4AFQdEdpT8fgalCCpZyfPRPzfWotN6jiSOyG9VJGUdLwpt0wdv5mk60O4DY0U4fMHn8rxe1KhqLeyHKw0JHnwOc0LvsMC1EK0aeZKy8At7lfRCNNb2zuEuOKW0tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8Bxf5lkV9pmyvIrAA--.47244S3;
	Fri, 06 Sep 2024 09:14:12 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front2 (Coremail) with SMTP id qciowMDx7sVjV9pmMkUHAA--.21102S3;
	Fri, 06 Sep 2024 09:14:11 +0800 (CST)
Subject: Re: qemu direct kernel boot on LoongArch
To: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: loongarch@lists.linux.dev, qemu-devel@nongnu.org, xry111@xry111.site
References: <49432aed-3ed7-2f07-7f65-311faef96197@loongson.cn>
 <ZtkhtxcJUK-JediY@zx2c4.com>
 <f50c4868-7c2e-1ede-ab19-c67ea0acaab3@loongson.cn>
 <CAHmME9rRJjJ5tHf_xtprkHtWz-ButOOZXVo=E9y8qSyQ-qu6ew@mail.gmail.com>
 <ccc7db47-d065-4e78-bf67-c4e8855c9be4@t-8ch.de> <ZtnGA4mH0I2hdx4N@zx2c4.com>
 <ea52a89c-449f-4aed-8138-f81ad20a1a79@t-8ch.de>
 <CAHmME9pPvk4s9JnEPmc9w71hkeHD_1U-fAy0+8MQNmO_9Gh3=g@mail.gmail.com>
 <b11ba2f4-ba4b-40fb-860e-e10e760562fe@t-8ch.de>
 <CAHmME9pjokr=ahBbJA9Ljf8jjOyfyRAk0Qo4YeDYO_gs78GGzg@mail.gmail.com>
 <7311f2fa-2353-48ad-85f5-5eae1f6cb65f@t-8ch.de>
From: maobibo <maobibo@loongson.cn>
Message-ID: <bac8575f-1c43-1242-9113-ef7957b50e68@loongson.cn>
Date: Fri, 6 Sep 2024 09:14:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <7311f2fa-2353-48ad-85f5-5eae1f6cb65f@t-8ch.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qciowMDx7sVjV9pmMkUHAA--.21102S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZFyDXw4ktrWkJrW7XryxZwc_yoW5Jw1fpr
	y7KayDKr4ktr4fAr1Iqr1YgF4jy34ftw1jqws5tFyUJryqqF1Yqr12qrWUCa4UXw1fGw1j
	kFyUXa47Xr4DJagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Fb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2
	KfnxnUUI43ZEXa7IU8wNVDUUUUU==



On 2024/9/6 上午12:03, Thomas Weißschuh wrote:
> On 2024-09-05 17:18:07+0000, Jason A. Donenfeld wrote:
>> On Thu, Sep 5, 2024 at 5:16 PM Thomas Weißschuh <thomas@t-8ch.de> wrote:
>>>
>>> On 2024-09-05 17:07:22+0000, Jason A. Donenfeld wrote:
>>>> On Thu, Sep 5, 2024 at 5:05 PM Thomas Weißschuh <thomas@t-8ch.de> wrote:
>>>>>
>>>>> On 2024-09-05 16:53:55+0000, Jason A. Donenfeld wrote:
>>>>>> On Thu, Sep 05, 2024 at 07:25:05AM +0200, Thomas Weißschuh wrote:
>>>>>>> On 2024-09-05 06:04:12+0000, Jason A. Donenfeld wrote:
>>>>>>>> On Thu, Sep 5, 2024 at 5:45 AM maobibo <maobibo@loongson.cn> wrote:
>>>>>>>>>
>>>>>>>>> Jason,
>>>>>>>>>
>>>>>>>>> With the latest qemu 9.1 version, elf format booting is supported.
>>>>>>>>
>>>>>>>> Thanks, I just figured this out too, about 4 minutes ago. Excellent.
>>>>>>>> And the 1G minimum ram limit is gone too.
>>>>>>>>
>>>>>>>> Now working on how to trigger resets.
>>>>>>>
>>>>>>> With "reset" do you mean normal (non-panic) system shutdown/poweroff?
>>>>>>> Since QEMU 9.1 and a recent kernel you can use the pvpanic device for
>>>>>>> that in a cross-architecture way.
>>>>>>
>>>>>> What I mean is that I need for userspace calling `reboot(RB_AUTOBOOT);`
>>>>>> to actually result in QEMU being told to reboot the system. Sounds like
>>>>>> that's not possible (yet?) in 9.1?
>>>>>
>>>>> With reboot(RB_POWER_OFF) this is indeed the exact usecase for pvpanic
>>>>
>>>> I'm actually using reboot(RB_AUTOBOOT) wth QEMU's -no-reboot, because
>>>> that tends to be far more compatible with a greater number of
>>>> platforms, for example, x86 without acpi. Shucks.
>>>
>>> You can check that both QEMU and the kernel support pvpanic shutdown
>>> through sysfs and if so use reboot(RB_POWER_OFF); and
>>> reboot(RB_AUTOBOOT) otherwise.
>>
>> I guess. But the whole idea is to bloat the code as little as possible
>> and use one interface for everything. Pushing that all up into
>> userspace is pretty icky.
> 
> If it works through ACPI everywhere then sure.
> 
>> It sounds like LoongArch already supports this via ACPI GED, but
>> there's some plumbing that needs to be done still. So maybe I'll just
>> wait for that.
> 
> Also sounds reasonable.
yeap, will submit a patch to expose ACPI GED pm interface with FDT method.

> 
>> Meanwhile, any idea about adding a second serial to the platform? I've
>> been futzing with it for a bit now to no avail.
> 
> No idea, sorry.
Will investigate the second serial method.

Regards
Bibo Mao

