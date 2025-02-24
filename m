Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAD9EACE
	for <loongarch@lists.linux.dev>; Mon, 24 Feb 2025 01:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740359894; cv=none; b=CuwymOqn4P5Lse4Qs2qwQlNnvxVd6tIa3Zu0AaDWm8vph3IdQ85hitajPQQ25OAS/vRGEaHCRMhf84D4XB+fr3Oddz466mdAQ2dgCniyBC0clbDia2DEbbDOZH+1E0u0jhBGwYRe9bPPyKzZ7vtY5jpcibS0sOt90wvxMQQi/LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740359894; c=relaxed/simple;
	bh=+01fuoxMsFVszPyqwuMr7Map+WPjyYGMYFouhMVMR3s=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=avLi+mR1S2b8m8Yg0iPrQDH3y44c6UbNTD85K9k3zIkZZ1xpLq/7T14RfbHk4TaU4HUBZS7POXll7bKuZawrFfjsFSWJKGg1asUk64etLWlOH5fl1jjjItpq4pqioM+hcW+oYKBfcg9t3v7Ze/EfBrXufbLx3twVuqTERMnZ+Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8AxWXHLyLtnFESAAA--.24087S3;
	Mon, 24 Feb 2025 09:18:03 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMDx_MTJyLtnBXslAA--.5865S3;
	Mon, 24 Feb 2025 09:18:03 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Remove unused option with
 HAVE_VIRT_CPU_ACCOUNTING_GEN
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250221073249.481731-1-maobibo@loongson.cn>
 <CAAhV-H6-cH1a-ghgGAp2aOp8MF09YMwj3bCXESLts==d8_4m3Q@mail.gmail.com>
From: bibo mao <maobibo@loongson.cn>
Message-ID: <2a5a2453-0686-efb2-29aa-065797fa1548@loongson.cn>
Date: Mon, 24 Feb 2025 09:17:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6-cH1a-ghgGAp2aOp8MF09YMwj3bCXESLts==d8_4m3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDx_MTJyLtnBXslAA--.5865S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJrWDWrWxCr4UtF1rXrykXrc_yoW8Xw13pr
	n2y3Wqgr48Gr4Fva9YyFyrWw47ZryvqrWxWF1fKFy8tryq9ryDZr1jgr1q9FyUJ395J3yI
	gr1fG34avF45CwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8cz
	VUUUUUU==



On 2025/2/21 下午9:42, Huacai Chen wrote:
> Hi, Bibo,
> 
> On Fri, Feb 21, 2025 at 3:32 PM Bibo Mao <maobibo@loongson.cn> wrote:
>>
>> Option HAVE_VIRT_CPU_ACCOUNTING_GEN is selected by default in kconfig file
>> arch/Kconfig. It is meaningless in file arch/loongarch/Kconfig, and on the
>> contrast it may bring out misunderstanding. Here remove it on arch
>> specified kconfig file.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>   arch/loongarch/Kconfig | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>> index 2b8bd27a852f..7fd5708fe14a 100644
>> --- a/arch/loongarch/Kconfig
>> +++ b/arch/loongarch/Kconfig
>> @@ -175,7 +175,6 @@ config LOONGARCH
>>          select HAVE_STACKPROTECTOR
>>          select HAVE_SYSCALL_TRACEPOINTS
>>          select HAVE_TIF_NOHZ
>> -       select HAVE_VIRT_CPU_ACCOUNTING_GEN if !SMP
> Please see 01f135506e2ed0403512 ("powerpc/32: select
> HAVE_VIRT_CPU_ACCOUNTING_GEN"). Now HAVE_VIRT_CPU_ACCOUNTING_GEN is
> available on both 32BIT and 64BIT, so I think a better solution is
> unconditionally select HAVE_VIRT_CPU_ACCOUNTING_GEN which is
> convenient for the upcoming LoongArch32.
I have no idea about LoongArch32 which is talked about years, however 
there is never actual code posted and no detailed plan. All about 
LoongArch32 is talking on the paper.

Regards
Bibo Mao
> 
> 
> 
> 
> 
> Huacai
> 
>>          select IRQ_FORCED_THREADING
>>          select IRQ_LOONGARCH_CPU
>>          select LOCK_MM_AND_FIND_VMA
>> --
>> 2.39.3
>>
>>

