Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861C113B5BD
	for <loongarch@lists.linux.dev>; Mon, 15 Jul 2024 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721039549; cv=none; b=k9CSVIxJUmce1Ej+UJdnjPhtCnJjDSDb/LyMq2BGmbdIkIYZusoS1OeVtoKq7yaYxFGJ6nUBg7GJ3fG2X1B/8+qKEaRsXJZVHeHDEO5w3IdY8VdS6RGPojMcPaST0mIAfgKEAaqZVzNCeCY8tGk5GddOoNkYyYkwzlVaJ/I6vkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721039549; c=relaxed/simple;
	bh=1f1PUYMDSynzzQQV7ZnwruoYE5ot/fboiyGqOFjiY2c=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Gh3lR7VaD1jpKB450zaGHnniUnrwP+0G0LIj0bxVaiKan5dB/wKLhTM+It7lrUoZnIXW7Zgp6xMS8J9N1fNYec/zeO5aa0zykfca9RayQRFV87aZWdkvBgmtsiso13QbTwP9UUJAmeGsGfcUiczHESew8bAftMp4+CTtle2OduU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dxfeu2+pRmR5IEAA--.12044S3;
	Mon, 15 Jul 2024 18:32:23 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxJMW0+pRm_K1JAA--.24741S3;
	Mon, 15 Jul 2024 18:32:21 +0800 (CST)
Subject: Re: [RFC PATCH 4/4] LoongArch: Remove -fno-jump-tables for objtool
To: Huacai Chen <chenhuacai@kernel.org>
References: <20240712091506.28140-1-yangtiezhu@loongson.cn>
 <20240712091506.28140-5-yangtiezhu@loongson.cn>
 <CAAhV-H4oi1mpP8JSG1D+8CQVojGtPOpzVybCn8y8mWuMPT=zxQ@mail.gmail.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Xi Ruoyao <xry111@xry111.site>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <497ec1a5-fdf9-037c-0781-4f25e9c4f27b@loongson.cn>
Date: Mon, 15 Jul 2024 18:32:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4oi1mpP8JSG1D+8CQVojGtPOpzVybCn8y8mWuMPT=zxQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxJMW0+pRm_K1JAA--.24741S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uF1UAw15ZFy7Xry3Gr1xWFX_yoW8WrWkpr
	s7A3ZrGr48Xrs5ta9xt3yvg3y2vr97KF4xWr4xtFyrArZ093yqvr18Kr1qgFy8G395tw4S
	qF1Sga4Y9F4UWFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jFa0PUUUUU=

On 07/12/2024 05:40 PM, Huacai Chen wrote:
> Hi, Tiezhu,
>
> On Fri, Jul 12, 2024 at 5:15 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>  arch/loongarch/Kconfig  | 8 +++++++-
>>  arch/loongarch/Makefile | 6 ++----
>>  2 files changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>> index ddc042895d01..57f28450a2ed 100644
>> --- a/arch/loongarch/Kconfig
>> +++ b/arch/loongarch/Kconfig
>> @@ -143,7 +143,7 @@ config LOONGARCH
>>         select HAVE_LIVEPATCH
>>         select HAVE_MOD_ARCH_SPECIFIC
>>         select HAVE_NMI
>> -       select HAVE_OBJTOOL if AS_HAS_EXPLICIT_RELOCS && AS_HAS_THIN_ADD_SUB && !CC_IS_CLANG
>> +       select HAVE_OBJTOOL if TOOLCHAIN_SUPPORTS_OBJTOOL && !CC_IS_CLANG
>>         select HAVE_PCI
>>         select HAVE_PERF_EVENTS
>>         select HAVE_PERF_REGS
>> @@ -276,6 +276,12 @@ config AS_HAS_LBT_EXTENSION
>>  config AS_HAS_LVZ_EXTENSION
>>         def_bool $(as-instr,hvcl 0)
>>
>> +config CC_HAS_ANNOTATE_TABLEJUMP
>> +       def_bool $(cc-option,-mannotate-tablejump)
>> +
>> +config TOOLCHAIN_SUPPORTS_OBJTOOL
>> +       def_bool AS_HAS_EXPLICIT_RELOCS && AS_HAS_THIN_ADD_SUB && CC_HAS_ANNOTATE_TABLEJUMP
> Can AS_HAS_THIN_ADD_SUB be removed now?

If the following patch can be accepted, then objtool will not rely
on AS_HAS_THIN_ADD_SUB, I will try to send this patch again.

objtool: Add skipped member in struct reloc
https://lore.kernel.org/loongarch/1690272910-11869-6-git-send-email-yangtiezhu@loongson.cn/

Thanks,
Tiezhu

