Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324A018EB8
	for <loongarch@lists.linux.dev>; Sat, 15 Jun 2024 09:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718442260; cv=none; b=gRmncFO/80TCKFxDSt1dvT/0GlbZRFNka02eC+f/4Jcv2OIZQft2y6x6+OvwXRiWefT/8qj2FkFn1Go8Dc3TiNzvGuT7ylwUyquVe4TyNk6ys6+9ceHjtZq19pTenZ9slrVEn2oU7v62oMsVbHnNIPPh70dmH7aecqeTNDWUsh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718442260; c=relaxed/simple;
	bh=L8H45/DMAGKhB7JF5zQdNzvHvIUepJkvDiE2RHks7ms=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=VEdhUqovHtFE/x84igEGlhsZGKRwKDjHtyrKJy2sgJhZda8N21hjAztj65IaHuNCjaHRDXWySmgTAnJa9oj9nABBWfzNWyNFd7FZi6b1U5wEZho6RtA4DfouBLNmGRh9ZHf/PM2GRo828D+rhs5Nf2FXv0Vs/CgUtwk22BvearE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8Bxa+oMWW1mmiAHAA--.28784S3;
	Sat, 15 Jun 2024 17:04:13 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxWcYIWW1m_d4hAA--.17493S3;
	Sat, 15 Jun 2024 17:04:10 +0800 (CST)
Subject: Re: [PATCH v2 0/3] LoongArch: ptrace: Fix some watchpoint function
To: Huacai Chen <chenhuacai@kernel.org>, Hui Li <lihui@loongson.cn>
Cc: loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <20240611114939.23586-1-lihui@loongson.cn>
 <CAAhV-H6+to0-s+RhA8ZcExgU4e39+gEx_Yr8C+z2DL49XaDyag@mail.gmail.com>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <7727385a-2ce7-fe4f-8f2b-968185f9d3b0@loongson.cn>
Date: Sat, 15 Jun 2024 17:04:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6+to0-s+RhA8ZcExgU4e39+gEx_Yr8C+z2DL49XaDyag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8BxWcYIWW1m_d4hAA--.17493S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Zw17Xw4fAw48Wr1rXrWrJFc_yoW8Zr45pF
	WSkFnxKr4DJr47Zwsaqw4UuFy5Xan7Gr47WwsxKryYy34q9r1F9r48Gr4jva4Du34fGw1F
	vF1UXw1vgFyDAacCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUU
	UUU==

Thanks for your reminder. These fix look good to me at present.
(But these commit msg looks strange.) And thanks for his work.

Jinyang

On 2024-06-15 16:47, Huacai Chen wrote:
> Hi, Jinyang,
>
> Do you have any additional comments about this series?
>
> Huacai
>
> On Tue, Jun 11, 2024 at 7:49 PM Hui Li <lihui@loongson.cn> wrote:
>> LoongArch defines hardware watchpoint functions for fetch and load/store
>> operations. After the software configures the watchpoints for fetch and
>> load/store, the processor hardware will monitor the access addresses of
>> the fetch and load/store operations and trigger a watchpoint exception
>> when the watchpoint setting conditions are met.
>>
>> Fix some hardware watchpoint issues on user-space and kernel interface.
>>
>> All changes are made according to the LoongArch Reference Manual:
>> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#control-and-status-registers-related-to-watchpoints
>>
>> Testing for this series can use this gdb patch:
>> https://sourceware.org/pipermail/gdb-patches/2024-June/209856.html
>>
>> Changes v1 -> v2:
>> Suggested by Jinyang and Huacai:
>> - Modify the commit message.
>> - Modify the privilege level judgment in ptrace_hbp_set_ctrl() and
>>    move the settings of regs->csr_prmd to hw_breakpoint_control().
>> - Add judgment in ptrace_hbp_set_addr() to ensure that kernel-space
>>    address cannot be monitored in user mode.
>>
>> Hui Li (3):
>>    LoongArch: ptrace: Fix watchpoint setting error
>>    LoongArch: Trigger user-space watchpoints correctly
>>    LoongArch: Fix multiple hardware watchpoint issues
>>
>>   arch/loongarch/include/asm/hw_breakpoint.h |  3 +-
>>   arch/loongarch/kernel/hw_breakpoint.c      | 86 ++++++++++++----------
>>   arch/loongarch/kernel/ptrace.c             | 48 +++++++-----
>>   3 files changed, 77 insertions(+), 60 deletions(-)
>>
>> --
>> 2.38.1
>>

