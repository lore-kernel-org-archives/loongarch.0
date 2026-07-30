Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37C338DC61
	for <loongarch@lists.linux.dev>; Thu, 30 Jul 2026 07:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785395552; cv=none; b=dnoJ81LPOm65jS7GK190bkAnCHtRvRvD/i/VJvuiQziP3UML6BBK3qO+kNnFZyfEzK5vDPDHOOv2W/qHTaxFom++Eg7flhSrKDOX0i7WhNCAgsWo8+9DwPb/1vUCgHCU02qRBcOGIU46MvoM23yAd+RSobRJWqWvNEWrayRn/9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785395552; c=relaxed/simple;
	bh=gH2hyiokf6xiM9h0rNCC2wC+lKCys2adF3SleeA3EdU=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FWmVZC4BGIKNcyAoGmvyrRpAfyK5sKedvtmjszKHEXIT8zVGm04sD9SbooXp1lOYDyPBSccanmA1ubsUnH2ajUjazetUnaLyEhX4j1b0bXOR8PtZ+ykcBnsb8soBGJRF5r8R4wXlVsX7CxcbfbCtdaKbVrF9mzf4AHdhmiuEFMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxaetX+WpqXcYIAA--.30013S3;
	Thu, 30 Jul 2026 15:12:23 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxSsRT+Wpqm4odAA--.41301S2;
	Thu, 30 Jul 2026 15:12:21 +0800 (CST)
Subject: Re: [PATCH v1 0/2] Refine move_imm() and optimize memory load
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>, Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chenguang Zhao <zhaochenguang@kylinos.cn>,
 Chenguang Zhao <chenguang.zhao@linux.dev>, George Guo
 <guodongtai@kylinos.cn>, George Guo <dongtai.guo@linux.dev>
References: <20260728031615.9389-1-yangtiezhu@loongson.cn>
Message-ID: <a3099547-6742-2ba3-e53f-4153376da924@loongson.cn>
Date: Thu, 30 Jul 2026 15:12:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260728031615.9389-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxSsRT+Wpqm4odAA--.41301S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Wr4kuw4xAFWUtF43uF43XFc_yoW8Jr43pF
	4a9F43Gr4kWryxXFsxC3ykWrnxX34fGrZ3Wa13trW8CrWDZrn8Wr1xWw1kXF9rC34fG3y0
	qr4rZ3Wq93WUG3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_Ma
	UUUUU

On 2026/7/28 上午11:16, Tiezhu Yang wrote:
> This series is based on 7.2-rc5 and the following two series:
> 
> Fix and optimize BPF tailcall for LoongArch
> https://lore.kernel.org/loongarch/20260707101508.32283-1-yangtiezhu@loongson.cn/
> 
> LoongArch: BPF: clean up for build_insn() paths
> https://lore.kernel.org/loongarch/20260711100956.4351-1-yangtiezhu@loongson.cn/

...

> Tiezhu Yang (2):
>    LoongArch: BPF: Clean up and decouple is32 parameter from move_imm()
>    LoongArch: BPF: Eliminate zero-extension for memory load operations
> 
>   arch/loongarch/net/bpf_jit.c | 123 ++++++++++++++++++++++-------------
>   arch/loongarch/net/bpf_jit.h |   7 +-
>   2 files changed, 79 insertions(+), 51 deletions(-)
> 

Here is the latest loongarch-next tree:

https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/log/?h=loongarch-next

I noticed there are several patch series from others (Chenguang Zhao,
George Guo) that need to be rebased. To avoid unnecessary conflicts,
please bypass mine for now and focus on theirs.

I will hold off and send these refactoring and optimization patches
later when the timing is better.

Thanks,
Tiezhu

