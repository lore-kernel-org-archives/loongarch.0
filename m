Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8F52222D0
	for <loongarch@lists.linux.dev>; Mon,  6 Jul 2026 05:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315921; cv=none; b=TdMk9qIZxtaLcVCkVpoyiASXSa69RETnoirCF9VGGS02x+GkIP41bygnM6mrBTEbtns8ASUYpbOdQN3aX1Egwa2yrQFRm0UO1oPr+p/mf8LSjL3fhefqHzYYVh26lkwQy3my1R846VH/DhU5jjEKpeO7V37Yexx5DxASQYSvewE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315921; c=relaxed/simple;
	bh=8T3VCJzYxStzRHTE/+7VFWzOVRfpXJ0wsBY+aIIl7EI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=JbnSqpQgBtpoaGmtJbldXzfCP5ux/WkIVtF8Ei3DjreWUJWOHvM24NXJSXcwu0wirTMKNTXa92/L41327SB4AkxlJDe0f4v+YeB6t7LonG0ke4bBJRhkYt+GvcwyxK3LNI+cctAvK5x955CKX8BGf643H0U5eANTtO/u8Use5iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxmuvOPUtqBUsAAA--.1374S3;
	Mon, 06 Jul 2026 13:31:58 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAx3cbMPUtqmdgBAA--.11475S3;
	Mon, 06 Jul 2026 13:31:57 +0800 (CST)
Subject: Re: [PATCH v2 3/4] LoongArch: BPF: Refactor jump offset calculation
 in tail call
To: bot+bpf-ci@kernel.org, chenhuacai@kernel.org, hengqi.chen@gmail.com
Cc: loongarch@lists.linux.dev, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, ast@kernel.org, andrii@kernel.org,
 daniel@iogearbox.net, martin.lau@kernel.org, eddyz87@gmail.com,
 yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
References: <20260706033906.1988-4-yangtiezhu@loongson.cn>
 <4101e743dcdd3be2ff84acb696e37dfe9c67116e89568cbbf985679c8862d047@mail.kernel.org>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <544cdfed-a90a-af77-eebd-4031e12f7f4a@loongson.cn>
Date: Mon, 6 Jul 2026 13:31:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <4101e743dcdd3be2ff84acb696e37dfe9c67116e89568cbbf985679c8862d047@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx3cbMPUtqmdgBAA--.11475S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KryfWFyfGryDJF1fuF4UGFX_yoW8Gr18pF
	Wvqw15Ja43Xr40yFs7Gr93W3W0kws5CF45Xrn8Gr1qyrZ0vr1YvFWYka1Uua93ZrZFva47
	Wrs0gF13ZF1DCFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBGb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
	xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
	026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF
	0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0x
	vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280
	aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07j1eHDUUUUU=

On 2026/7/6 下午12:43, bot+bpf-ci@kernel.org wrote:
>> In emit_bpf_tail_call(), the macro-based jmp_offset calculation relies
>> on a fragile prediction equation: "tc_ninsn - (ctx->idx - idx0)". This
>> calculation model utilizes tc_ninsn from the previous pass to estimate
>> the remaining stride of the active tail call code block.

...

> 
> This looks like a fix for wrong branch offsets in the tail call path.
> Should it carry a Fixes: tag?  The tc_ninsn macro and the
> 
>    tc_ninsn = insn ? ctx->offset[insn+1] - ctx->offset[insn] : ctx->offset[0];
> 
> calculation being removed here were introduced by:
> 
>    Fixes: cd39d9e6b7e4 ("LoongArch: BPF: Fix jump offset calculation in tailcall")
> 
> This isn't a bug, but could the changelog be tightened?  Phrases such as
> "rock-solid target label", "deterministic arithmetic model",
> "initialization bottleneck", "eBPF business instruction" and "all code
> size dimensions" read as fairly ornate for an offset-formula refactor.
> 
> Could it just state that the old macro derived jmp_offset from a stale
> prior-pass stride while the new form anchors on ctx->offset[insn + 1],
> with the ctx->image == NULL guard avoiding a false 16-bit range abort
> during size estimation?

OK, I will add the Fixes tag and trim the commit message in v3.

Thanks,
Tiezhu

