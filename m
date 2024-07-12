Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC8910F7
	for <loongarch@lists.linux.dev>; Fri, 12 Jul 2024 10:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720779582; cv=none; b=GIOELSle2op9MgnZRgsUtKIlTVS4M1nQ0nG580Pndxq9HJpB92GCsuuLnyPd2HIe29NTDBtY4GmAaWUurBGaBlnpO0YgAa7E0dWKScukh2AKXzE9Ea47ipp+ij2N5tMcBYm/KR+tEd2I8md0+u6nfQDkm13W8E+NbybIDJt7aE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720779582; c=relaxed/simple;
	bh=m8Fo37dbQHXF1VOFOJdFLjATgdftBN4o1j2llJWm8TU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=o36tw+1fYgfqpdldAUM5ah3ttPWhSN+5mrUmFUi9Dm3fEmoGuiyBbUbZYElBKMS3r7LGPygDTV18pISvPNMwOFXBmq1mM3nCk/TnSB0jPnMK/Dv5/Vll6lxbpuSUwkPfzDLvsQvZ8EUcZpVPVTZJU8Yy2zTm9LJ0LAWMkMMUJr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8CxZuo5A5FmzqYDAA--.1309S3;
	Fri, 12 Jul 2024 18:19:38 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxBMU2A5FmC8JFAA--.17381S3;
	Fri, 12 Jul 2024 18:19:35 +0800 (CST)
Subject: Re: [RFC PATCH 0/4] Add jump table support for objtool on LoongArch
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240712091506.28140-1-yangtiezhu@loongson.cn>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <307bcd3e-f4fe-8cc0-c557-4069c97c6072@loongson.cn>
Date: Fri, 12 Jul 2024 18:19:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240712091506.28140-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8AxBMU2A5FmC8JFAA--.17381S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFyDAr4DGry7Kr45Gry8WFX_yoW8uFyfpF
	W7CrWfKFs8WFnaqwsxJw12gFy5Jr4fG34Utr43try09w4UXr1aqr4xtF9xZ3ZrW395W3y2
	qr1YgFy7KF4vkacCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8SdgUUU
	UU=

Are we always avoid our problems?

1, When text section not support "R_LARCH_32_PCREL", update compiler
    to add AS_HAS_THIN_ADD_SUB.
2, When not support jump-table, use "-fno-jump-tables" to avoid it,
    (and now update compiler to add CC_HAS_ANNOTATE_TABLEJUMP).
3, When not support relax, use "-mno-relax" to avoid it.
4, When some where in asm can be backtraced but generate warning,
    use STACK_FRAME_NON_STANDARD to avoid it.
5, When the goto-table cannot be handled (I guess the Ruoyao's
    patch cannot handle goto table), use CONFIG_BPF_JIT_ALWAYS_ON
    to avoid compile ___bpf_prog_run.
6, And other $fp warnings not be solved in clang. Do we only care gcc?

So how to do in the future if compilers have other changed? Do we
need update compilers (both gcc and clang) again and again? Why
not just update objtool codes to solves these problems? As many
RISC arch not support directly find jump table, can we support
more generic ways to find it?


On 2024-07-12 17:15, Tiezhu Yang wrote:
> This RFC version is based on Linux 6.10-rc7, there are no detailed
> commit messages for each patch for now and the code are relatively
> clear and simple.
>
> This series is tested with the latest upstream gcc applied with patch
> "LoongArch: Add support to annotate tablejump" [1] which adds a new
> section discard.tablejump_annotate to record the jump info, it makes
> life much easier, special thanks to Ruoyao.
>
> I will address all the review comments and update the commit messages
> after the merge window.
>
> [1] https://inbox.sourceware.org/gcc-patches/20240711114415.4420-1-xry111@xry111.site/
>
> Tiezhu Yang (4):
>    objtool: Check local label in find_jump_table()
>    objtool: Check various types in add_jump_table()
>    objtool/LoongArch: Add support for jump table
>    LoongArch: Remove -fno-jump-tables for objtool
>
>   arch/loongarch/Kconfig                 |  8 +++-
>   arch/loongarch/Makefile                |  6 +--
>   tools/objtool/arch/loongarch/special.c | 54 +++++++++++++++++++++++++-
>   tools/objtool/check.c                  | 36 +++++++++++++++--
>   4 files changed, 94 insertions(+), 10 deletions(-)
>

