Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078888;
	b=5Y1scc6LYMNHPHp56jccURr/oNXbJ1zh9RMLTaLB/dbrm72Ins4YqcyEGKgRygDamonH
	 LcCXhtON5aIN5lvU0fd9J5l8B4lf307rrufbAJQB5GCVS2xCQEa82iMciHdjpXQEOP5hD
	 Ls+a3cb72wwfM/lnMCgjEP/Gm73hn38SSDigOs2pw2kwrQKmgJFQOfXLKxhLlHTtdvhk0
	 +fzCDr7eDdqxM4+/bnswcAhCAPb7glvKtxV+h2X2+wemFHMdfQNKlb0Vev1SgOktTaiZF
	 UZJ04sSLGJp1dGge8gpjSnTS4sYKLBaQKePjsz04zehxlpBI6Q3rfEDTZTkYaMPngcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078888;
	h=DMARC-Filter:Received:Received:Subject:From:To:Cc:References:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=fQSyvYLZFxUoDKEOy74wvi3r0I0nAyT1z0Pd+GCk0Bg=;
	b=NPiMY35JgjqcRbQywRTbAjF7FUoFYyoIEn1Bl0WAzY/2d5KTgQUlxAOGMjPH4g9oNNg8
	 KfrpCNGbsSX3gfjkGUW11RWVVLCwr7ALHKqnpO7g1UziANhvuuZzFdNruK/e/8RFZdE47
	 UHmf55Edn77gOPXN4jnKoP1ZeidfBl1Lp0Vl6Q2pvrCaLS3/Reh6WhAXZHSte43P6FCj1
	 +WnzDLZGhvG0pSr1RheMSPByNnLSlplef1y8OcuFdBtp7ARgzThaljywwAOMuk21k8rQt
	 PkotohcmTDQke1iOSq6mmZJSFAEat++xqJ8hMnfpXmEL7FRzc73L+VBRoexU3/fQsbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2B2606A31E
	for <loongarch@lists.linux.dev>; Tue, 27 Oct 2026 05:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D2B2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxHNJkNuBqZLUZAA--.9415S3;
	Tue, 27 Oct 2026 13:28:04 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxg8xiNuBqKJEwAA--.8197S2;
	Tue, 27 Oct 2026 13:28:03 +0800 (CST)
Subject: Re: [PATCH bpf-next] selftests/bpf: Enable signed division and modulo
 overflow tests for LoongArch
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261027041627.20792-1-yangtiezhu@loongson.cn>
Message-ID: <f9eaf0a8-d5c2-f0d9-afa8-73343d7da514@loongson.cn>
Date: Tue, 27 Oct 2026 13:28:02 +0800
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
In-Reply-To: <20261027041627.20792-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxg8xiNuBqKJEwAA--.8197S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtF4Uuw13Ar43Zw4kXFyxJFc_yoWfAwb_C3
	WxKr1DCw4Yva1SyFnFq34rA347ZrWkWry8GrWDWF1Iq347A3s5Wrn5J34ruryYqa1Fvr9x
	Gr4jvw12kwna9osvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
	WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2ID7
	UUUUU

On 2026/10/27 下午12:16, Tiezhu Yang wrote:
> The LoongArch hardware divider handles signed overflow boundaries (such
> as INT_MIN/-1 or LLONG_MIN/-1) natively and perfectly well on physical
> silicon: (1)for division operations, it naturally returns the dividend
> itself; (2)for modulo operations, it returns 0. Thus enable the signed
> division and modulo overflow tests for LoongArch in verifier_sdiv.c.

Besides the 8 signed overflow (MIN/-1) test cases, I noticed that
there are another 8 test cases for small value signed calculations
with negative divisors (small_val/-1) that were also masked by
__arch_x86_64.

I've tested both blocks locally on a physical LoongArch machine, and
all 16 test cases passed flawlessly (Summary: 1/144 PASSED, 0 SKIPPED).

IMO it is better to enable these 16 test cases together in a single
patch, I will send v2 later.

Thanks,
Tiezhu

