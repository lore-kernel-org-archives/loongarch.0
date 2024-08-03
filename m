Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B4E41A8E
	for <loongarch@lists.linux.dev>; Sat,  3 Aug 2024 06:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722667233; cv=none; b=SKPZOSmG/NWjwelbPGvXLUFnFSe8XHV2EfYuWXXxIjjnkeK7tMubena6kWGbMnEdBtZ8Nn4/RlrKkx5jRwb+cOLS9RXOQhgBoMOpnSrJ9gAnLOpOBCPzg8XADNeUMf380w8X+J9W7sASLatpS6wQMjMlI93b5xuUN46nB3ZePz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722667233; c=relaxed/simple;
	bh=z3ZXGXsNwuDa56mQqzVBvXDgtN4maYAscG3wgNEp86s=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=uHx34tQrUucs4ta8TN4Rrv7Sv1J3sBdbtrsDrDrlab81mAj+laSlvs5En096hLJoxHJR6kA9A9mbgIwTmewOmkya26Fl1EEZZoTT+15+9VjCS2L0BO4T/ZtI3pVSDv51/RZU87bk6Vw7b13avFZp6E1GTk1oROhb10c828blH+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8AxnOrb0K1mSvIGAA--.24221S3;
	Sat, 03 Aug 2024 14:40:27 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMCxA+LZ0K1msh4BAA--.6609S3;
	Sat, 03 Aug 2024 14:40:25 +0800 (CST)
Subject: Re: [PATCH V7] LoongArch: Add AVEC irqchip support
To: Thomas Gleixner <tglx@linutronix.de>, Huacai Chen <chenhuacai@kernel.org>
Cc: corbet@lwn.net, alexs@kernel.org, siyanteng@loongson.cn,
 kernel@xen0n.name, jiaxun.yang@flygoat.com, gaoliang@loongson.cn,
 wangliupu@loongson.cn, lvjianmin@loongson.cn, yijun@loongson.cn,
 mhocko@suse.com, akpm@linux-foundation.org, dianders@chromium.org,
 maobibo@loongson.cn, xry111@xry111.site, zhaotianrui@loongson.cn,
 nathan@kernel.org, yangtiezhu@loongson.cn, zhoubinbin@loongson.cn,
 loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>
References: <20240726102443.12471-1-zhangtianyang@loongson.cn>
 <87o76kuqza.ffs@tglx>
 <CAAhV-H7c0Gtjf-6iS-E4nviMqmPWpJMNwvhWf0fLBx75pDXtrQ@mail.gmail.com>
 <87r0bb6ru1.ffs@tglx>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <cff37371-0692-0db5-cb14-74c519eb1c56@loongson.cn>
Date: Sat, 3 Aug 2024 14:40:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87r0bb6ru1.ffs@tglx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMCxA+LZ0K1msh4BAA--.6609S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFy8GF43XFW7Cr4kJr4DJrc_yoW8Ar15pF
	WUG3W5Ar4Dtry2ka97uw10qFnIyrnaqFW8Jw1rJ34UG3s8WFnaqry8JFWaka4xCrZxJryj
	vw12v3s0kas8JagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
	6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j5xhLUUUUU=

Hi, Thomas

在 2024/7/30 下午7:29, Thomas Gleixner 写道:
> Huacai!
>
> On Tue, Jul 30 2024 at 16:51, Huacai Chen wrote:
>> On Fri, Jul 26, 2024 at 11:12 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>>>> +     while (true) {
>>>> +             vector = csr_read64(LOONGARCH_CSR_IRR);
>>>> +             if (vector & IRR_INVALID_MASK)
>>>> +                     break;
>>>> +
>>>> +             vector &= IRR_VECTOR_MASK;
>>>> +
>>>> +             d = this_cpu_read(irq_map[vector]);
>>>> +             if (d)
>>>> +                     generic_handle_irq_desc(d);
>>>> +             else {
>>> See bracket rules.
>> Do you mean even if there is only one statement in the if condition,
>> we still need to do like this?
>> if (xxx) {
>>      yyy;
>> } else {
>>      zzz;
>> }
> Yes. It's documented.
>
>>>> +     msi_domain = pci_msi_create_irq_domain(pch_msi_handle[0],
>>>> +                                            &pch_msi_domain_info_v2, parent);
>>> Please don't do that. Convert this to use per device MSI domains.
>> OK, thanks. But it is better to split the conversion to another patch
>> (so we can convert both V1 and V2).
> Why adding it first?
>
> This can be done per interrupt chip. See the conversion series for
> ARM[64]:
>
>      https://lore.kernel.org/r/20240623142137.448898081@linutronix.de
>
> Thanks,
>
>          tglx

We consider that since the original extioi-msi is still using the 
legacy-MSI interrupt model at irq-loongson-pch-msi.c, if per-device-MSI 
is directly supported in the AVEC support patch, it will result in the 
simultaneous use of two MSI-interrupt-mode in irq-loongson-pch-msi.c, 
which may seem a bit strange. So we decided to split it into two 
patches, the first one using tlegace-MSI to support AVEC interrupt 
controllers, and the second one will be uniformly modified to use 
per-device-MSI

Tianyang

