Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672866;
	b=FXpW2Cr+gPwBj5nJ0En2g7/0uYzvO4vGfzGY4hdiD47dOcyDqPoYrFGR2QixCXOgS+Le
	 qq0dVHLjdd0a1MF18VYoctTqua/IccehYtY4oaQgSW6hZ1a7DBXA3OiArQEau9hmRsph8
	 SFL7Igih8kCgurymSLWEJtDmHHA5V1WDYSuzZ2POswwYr1rOST8P09QobQF5UtRNA7s9F
	 Y244lLsjzC/KnDeUSiEGkg8ljC416/TyoHukff4alSjG4Brh6yunDSklV0COkC/GzIZwk
	 oj1dnMd3sKN9K/Cyl6jyna3+4oOngJOf5EgcJ4qroJIZeq0Hkdy97uON/L1StFvD5Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672866;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=jwmw9ePHObCEAc7+hakbNtWfd2LgIPfpKlFzZDtHoSw=;
	b=abaxBTLdlvUd2cbVunNpDpzasVMlEX78jvqqgHpoT+Gc/V2P+dDf9wFQYjqVrGuXOupR
	 CTqp/R1ejuepDFYKHrQkHx6KQgVNdVeMS/SYLohdncm8IpeIqFJzxEK7zk+hLVONUQKoA
	 4c9OqKPIQqYPfs7BKageclMoA9h3MXUlO9JSHny554HTjRX0tDbs3PP5RVWmwH3Smaa2A
	 t1ndo3AS2eDspyeQHGkG78iHbqKKqcYsVB5LweRGkoO45xEPqa8+71gQgDuqgkE1kEwha
	 INYG+xHcjV/0aZpOsIMOCa6PrbSKGA4rerYmdg9jWxsNVof1pibXdTMCVihc2SeavtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A53606A339
	for <loongarch@lists.linux.dev>; Tue,  3 Nov 2026 02:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A53606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxXdKcRulqec8bAA--.15284S3;
	Tue, 03 Nov 2026 10:27:40 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAxX8+bRulqcQsyAA--.37690S2;
	Tue, 03 Nov 2026 10:27:40 +0800 (CST)
Subject: Re: [PATCH v1 2/2] LoongArch: BPF: Use beqz and bnez instructions for
 trampoline
To: bot+bpf-ci@kernel.org, chenhuacai@kernel.org, hengqi.chen@gmail.com
Cc: loongarch@lists.linux.dev, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, ast@kernel.org, andrii@kernel.org,
 daniel@iogearbox.net, martin.lau@kernel.org, eddyz87@gmail.com,
 yonghong.song@linux.dev, mason@kernel.org, ihor.solodrai@linux.dev
References: <20261102072808.23080-3-yangtiezhu@loongson.cn>
 <c3b8e6ae47164ab1a643a1730f0600993de03c8a30e35122a9812ac73d807697@mail.kernel.org>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <1276eb14-b851-aee7-36ad-d61e2ddd9ba4@loongson.cn>
Date: Tue, 3 Nov 2026 10:27:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <c3b8e6ae47164ab1a643a1730f0600993de03c8a30e35122a9812ac73d807697@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxX8+bRulqcQsyAA--.37690S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWruFyxtFW7GF1UXFWUCw15trc_yoWxtwb_Gw
	1UXFn7A3yUJF93KFs2gFs3Zrs7tF43Zr4rAryxZrWjqry7GrWkWF98JFyYva15WF93Ars8
	Zws8uw4furnxZosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbDAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jwnYwUUUUU=

On 2026/11/2 下午3:53, bot+bpf-ci@kernel.org wrote:
>> LoongArch: BPF: Use beqz and bnez instructions for trampoline
> 
> TL;DR: Commit message only: the claimed branch-overflow risk looks impossible,
> since trampolines fit in one page and the old code behaved identically, so the
> Fixes: and Cc: stable tags may not be justified.

...

> Could the changelog drop the overflow-risk wording, or describe the change
> as a cleanup, and could the Fixes: and Cc: stable tags be reconsidered given
> that stable-kernel-rules requires a fix for a real bug?

Will update the commit message and remove the 'Fixes' and 'Cc: stable'
tags. If no more comments, I will send out v2 next week.

Thanks,
Tiezhu

