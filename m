Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50856187870
	for <loongarch@lists.linux.dev>; Mon, 15 Jul 2024 10:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721039713; cv=none; b=VC/KY9FzWFO6ddpnod8B+rSWBf2Oe6BBR379xW20gWp7TQaDSzWw/jLOvYiTYmH7QhNVnHz3e6NgyYouMBCZeLHG9igIt4Kd6X2hfkz5J32hw6+jgQVFX0R/j30kGHTX9bos7YVNqZks398G9M2RzMrHNN7QW8pubsZCIP5vReQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721039713; c=relaxed/simple;
	bh=qPQFGH0u6p+YaPW1ZggzIXA+gPjm7q0KjJ6rAGcHjJA=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=XKhmz+yH04WDOW7N7xDTMwLcSWdBsZdwVR4ZZjsp5aRNtZFfbGtJMg98/od5UD/mPXVugc3rUFHyQPMQdZ1pdmZoJ04yad3uuadWbpyMO3/GEoGDbTD7tq6dfhQcAoqn1ZC1AzY4WBVphXEQgTiR04qg2MjSTCGeO0jeV6T4TGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dxfeta+5RmkZIEAA--.12052S3;
	Mon, 15 Jul 2024 18:35:06 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxhsVZ+5RmUK5JAA--.24677S3;
	Mon, 15 Jul 2024 18:35:05 +0800 (CST)
Subject: Re: [RFC PATCH 4/4] LoongArch: Remove -fno-jump-tables for objtool
To: Xi Ruoyao <xry111@xry111.site>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
References: <20240712091506.28140-1-yangtiezhu@loongson.cn>
 <20240712091506.28140-5-yangtiezhu@loongson.cn>
 <0adc4126e7fbb8fcf84bae67ebe39ff6da4721cd.camel@xry111.site>
 <ae3ff9787e9d3f41b71e8e4168610a01d5304371.camel@xry111.site>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <8506fd62-5c48-bbfa-d4ec-4ef237cbe5df@loongson.cn>
Date: Mon, 15 Jul 2024 18:35:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ae3ff9787e9d3f41b71e8e4168610a01d5304371.camel@xry111.site>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8AxhsVZ+5RmUK5JAA--.24677S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XrW8Wr17Gw4DGw4fGF17Jwc_yoWkJrbEka
	s5Zr1vk3y5CwsrXFW7WF4DG3y7K3WUK34rJrWUGw13trn0yFZ7Kr4qkw1FvF4xJF1UGFsI
	9F4DuryDKF4I9osvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbaAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E
	14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4U
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
	vfC2KfnxnUUI43ZEXa7IU8vD73UUUUU==

On 07/13/2024 05:10 PM, Xi Ruoyao wrote:
> On Fri, 2024-07-12 at 17:49 +0800, Xi Ruoyao wrote:
>> On Fri, 2024-07-12 at 17:15 +0800, Tiezhu Yang wrote:
>>> -ifdef CONFIG_OBJTOOL
>>> -KBUILD_CFLAGS			+= -fno-jump-tables
>>> -endif
>>> +KBUILD_AFLAGS			+= $(call cc-option,-mannotate-tablejump) $(call cc-option,-Wa$(comma)-mannotate-tablejump)
>>> +KBUILD_CFLAGS			+= $(call cc-option,-mannotate-tablejump) $(call cc-option,-Wa$(comma)-mannotate-tablejump)
>>
>> KBUILD_AFLAGS isn't needed, and $(call cc-option,-Wa$(comma)-mannotate-
>> tablejump) will always expand to nothing because the assembler does not
>> have -mannotate-tablejump.
>>
>> The assembler never creates a jump table itself.

Thanks, you are right, I will modify it in the formal v1 series.

> BTW have you discussed with Lulu about the -mannotate-tablejump patch?
> I guess maybe an intra-Loongson discussion would be helpful.

Yes, I have discussed with Loongson compiler team some days ago
and will discuss more to reach an agreement in the next few days.

Thanks,
Tiezhu

