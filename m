Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6EC14286
	for <loongarch@lists.linux.dev>; Fri,  6 Sep 2024 01:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725584986; cv=none; b=q9pCJPq/9XNdqfwAaxtoOWUb7+Pd+GZGGruUAvLXB6rL34w4qKd9XPeWWiLGB9UR4Lu+s0KBvhT/Cx3zITdXJgK6EX1W4L1lY/IVn44/nHfc7iSTSNzTM30FCNWIaY+FWpOLzSxfNsSW2zC5+WzkPEG/nYigmskN48TlOJujXF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725584986; c=relaxed/simple;
	bh=LtNg6ycv4/uFQaEvHdpclnfZ/4AyyXXHUYx4T2ZWhXY=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=obe3wOGAlpmAW9gR43Q0ZcpywhzOqdT0ePKCMY5e5dvxJGyEhy3AD3e1/CMtM9pPQeK9LAdMDUsV/MuRiGrZNoHHMCzcWSGz6LPP0WFu3E4l2sWXSkFiMTSoFBSeYD8O8Z9cbdOY1uwx1Lixr37QFPP8pyd7qksEYcfBi+bwK9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8BxHJtNVtpmCvIrAA--.47990S3;
	Fri, 06 Sep 2024 09:09:33 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front2 (Coremail) with SMTP id qciowMDx_8dNVtpmfEQHAA--.22932S3;
	Fri, 06 Sep 2024 09:09:33 +0800 (CST)
Subject: Re: qemu direct kernel boot on LoongArch
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>,
 loongarch@lists.linux.dev, qemu-devel@nongnu.org, xry111@xry111.site
References: <1738d60a-df3a-4102-b1da-d16a29b6e06a@t-8ch.de>
 <49432aed-3ed7-2f07-7f65-311faef96197@loongson.cn>
 <ZtkhtxcJUK-JediY@zx2c4.com>
 <f50c4868-7c2e-1ede-ab19-c67ea0acaab3@loongson.cn>
 <CAHmME9rRJjJ5tHf_xtprkHtWz-ButOOZXVo=E9y8qSyQ-qu6ew@mail.gmail.com>
 <ccc7db47-d065-4e78-bf67-c4e8855c9be4@t-8ch.de>
 <95da2e9e-0905-ad61-6bf9-c2636f2cc5f1@loongson.cn>
 <ZtnGMdFRpTAVPnym@zx2c4.com> <ZtnS9_xoPrXCWWln@zx2c4.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <8382893e-b990-24cf-5411-005f1251143a@loongson.cn>
Date: Fri, 6 Sep 2024 09:09:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZtnS9_xoPrXCWWln@zx2c4.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qciowMDx_8dNVtpmfEQHAA--.22932S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7AFW8Xry3XFyDAry7Xry3WrX_yoW8WrWfpF
	yjkFWqkrsYqrWDAF9agw1jkFyFywsrtw4rXw18Ar98WwsIyryavF12grW7Ca45Kw1xJF1j
	vFnrX347X3yUJrXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUU
	UUU==



On 2024/9/5 下午11:49, Jason A. Donenfeld wrote:
> On Thu, Sep 05, 2024 at 04:54:41PM +0200, Jason A. Donenfeld wrote:
>> On Thu, Sep 05, 2024 at 02:11:32PM +0800, maobibo wrote:
>>>
>>>
>>> On 2024/9/5 下午1:25, Thomas Weißschuh wrote:
>>>> On 2024-09-05 06:04:12+0000, Jason A. Donenfeld wrote:
>>>>> On Thu, Sep 5, 2024 at 5:45 AM maobibo <maobibo@loongson.cn> wrote:
>>>>>>
>>>>>> Jason,
>>>>>>
>>>>>> With the latest qemu 9.1 version, elf format booting is supported.
>>>>>
>>>>> Thanks, I just figured this out too, about 4 minutes ago. Excellent.
>>>>> And the 1G minimum ram limit is gone too.
>>>>>
>>>>> Now working on how to trigger resets.
>>>>
>>>> With "reset" do you mean normal (non-panic) system shutdown/poweroff?
>>>> Since QEMU 9.1 and a recent kernel you can use the pvpanic device for
>>>> that in a cross-architecture way.
>>> LoongArch uses acpi GED device to reboot machine. Now there is no FDT
>>> table description and FDT driver for acpi GED device :(
>>
>> So you mean that QEMU exposes it via ACPI, but not via FDT, and the
>> kernel doesn't know how to recognize it, even with ACPI?
> 
> Ahh, it looks like QEMU exposes it via ACPI, but ACPI is broken (?) when
> booting directly from ELF. So it needs to be exposed via FDT instead? Or
> ACPI needs to be fixed with direct ELF boot?
We plant to expose ACPI GED via FDT interface with syscon method, and 
the reboot driver in linux kernel side is
drivers/power/reset/syscon-reboot.c.

The only difference is that ACPI GED register is accessed with 
byte-mode, it seems that it works well with draft version.

Regards
Bibo Mao
> 

