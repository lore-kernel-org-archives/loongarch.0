Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775517;
	b=oEDKsy9SODSaXkDIDiAGtno36d1PAnAT92Ntm60ozqi7BdE45DFMwlaFXjhuQsjd2TSq
	 d7saBGO7LL9byQyknuoWzwU8NJJ1QQdGbL+Gj0d6yAA3gaiVtsk2GX9g+jwHcuZ+6JZxc
	 XZId0cDdvRaRtf2KaJRu2GtzxRDWYnfmqZ6LM4MzP95TipZd5UD3kK75FajVpEvljXMT9
	 kijy/BeEKhRaFaMapMwOBCpTgds4Iy++UOGJpk3S+YS5lnJTTcoTTsQmzK8cYWji39dIN
	 YiV9zmNlwoyNFfmsal+5II3qjMHxGoOR58zYastunDLZAnzSVE3IZYdXl/8uX48Xo+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775517;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=hdQK57f7HyDlb+RjbKtfMWetjSY2KiFfxeS/E3Ij6Cw=;
	b=NRgAwEu2mS+EIKOPEIYY5uCNdnXD62ClNEj7uIsL692WrIAGXonkreNe8yhMEjbojbkg
	 mpcrRjFvNyBDJ8Qivq4n0Ve4ID+m093w2hloY+ij0vawNLEdTxxJVNLju7yrZWL3jVYlE
	 7yI7ExtCo9Mqy8uL5fnYvldfXYi6REvIdcPWbNxCpp42zpQsdujR6ipFMXylYBhCgb1Mh
	 rWhFW8MRunyD0NN2+sd0V0nFYrXeG19x/vJhwQbVoHBr9L3BNYmHJvvKYbiuSKemKMM00
	 qxvN8kYfuGcFh9VAKrzioOIcS6ONw7E6p6E/aEAbMQwiHNFdyfbKcEQJLDK7yxQdwjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A96606A328
	for <loongarch@lists.linux.dev>; Wed,  4 Nov 2026 06:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80A96606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxntKY1+pq6TccAA--.16032S3;
	Wed, 04 Nov 2026 14:58:33 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAxlMyW1+pq2UQyAA--.10843S2;
	Wed, 04 Nov 2026 14:58:31 +0800 (CST)
Subject: Re: [PATCH v1 1/2] LoongArch: BPF: Make arena support depend on SCQ
 extension
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261102072808.23080-1-yangtiezhu@loongson.cn>
 <20261102072808.23080-2-yangtiezhu@loongson.cn>
 <CAAhV-H52mbZJX2vkgG_h=XfwHoio=asLjFdhTJwUYqDp4V5JMg@mail.gmail.com>
 <8b00e5a7-4e60-19bd-7953-f76dc71e15ec@loongson.cn>
 <CAAhV-H52bqRD1SyrZsvMkNbCpGiM5DPSGPARiasZ8G3XsE5Tgw@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <6446c385-623c-d4cf-5a07-0c2276c6f50c@loongson.cn>
Date: Wed, 4 Nov 2026 14:58:30 +0800
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
In-Reply-To: <CAAhV-H52bqRD1SyrZsvMkNbCpGiM5DPSGPARiasZ8G3XsE5Tgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxlMyW1+pq2UQyAA--.10843S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAry5uFyxWryUWFy3KrW3Jwc_yoWrWFyUp3
	yxArnrGrWUWr1kJrZxt3yrWr4Dtr98K34a9a18A348Aan8Xa48Xr10kwn5WF1Dt39Yg3WF
	qFWrK3ZI9Fy8AabCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8fsqJUUUUU==

On 11/4/26 12:29 PM, Huacai Chen wrote:
> On Tue, Nov 3, 2026 at 10:24 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:

...

>> So, the current patch has no problem IMO.
> OK, then I think we can use:
> 
> return __is_defined(system_has_cmpxchg128) && system_has_cmpxchg128();

If CONFIG_AS_HAS_SCQ_EXTENSION is not enabled, system_has_cmpxchg128()
is not defined at all. If we change the code to follow your suggestion,
something like this:

```
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index b5ed4881d3c0..6f572d24d2c3 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -336,7 +336,7 @@ config AS_HAS_LVZ_EXTENSION
         def_bool $(as-instr,hvcl 0)

  config AS_HAS_SCQ_EXTENSION
-       def_bool $(as-instr,sc.q \$t0$(comma)\$t1$(comma)\$t2)
+       def_bool n

  config CC_HAS_ANNOTATE_TABLEJUMP
         def_bool $(cc-option,-mannotate-tablejump)
diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index d7ea515045ec..d124632b0fa9 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -2495,11 +2495,7 @@ bool bpf_jit_supports_arena(void)
          * atomic cmpxchg; this is provided by not only hardware SCQ 
extension
          * but also assembler support on LoongArch.
          */
-#ifdef system_has_cmpxchg128
-       return system_has_cmpxchg128();
-#else
-       return false;
-#endif
+       return __is_defined(system_has_cmpxchg128) && 
system_has_cmpxchg128();
  }

  bool bpf_jit_supports_fsession(void)
```

We will encounter a fatal build error:

   CC      arch/loongarch/net/bpf_jit.o
arch/loongarch/net/bpf_jit.c: In function ‘bpf_jit_supports_arena’:
arch/loongarch/net/bpf_jit.c:2498:55: error: implicit declaration of 
function ‘system_has_cmpxchg128’ [-Wimplicit-function-declaration]
  2498 |         return __is_defined(system_has_cmpxchg128) && 
system_has_cmpxchg128();
       | 
^~~~~~~~~~~~~~~~~~~~~
make[5]: *** [scripts/Makefile.build:290: arch/loongarch/net/bpf_jit.o] 
Error 1

Even if we change it to use IS_ENABLED(CONFIG_AS_HAS_SCQ_EXTENSION),
something like this:

```
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index b5ed4881d3c0..6f572d24d2c3 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -336,7 +336,7 @@ config AS_HAS_LVZ_EXTENSION
         def_bool $(as-instr,hvcl 0)

  config AS_HAS_SCQ_EXTENSION
-       def_bool $(as-instr,sc.q \$t0$(comma)\$t1$(comma)\$t2)
+       def_bool n

  config CC_HAS_ANNOTATE_TABLEJUMP
         def_bool $(cc-option,-mannotate-tablejump)
diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index d7ea515045ec..1b87b1e4262e 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -2495,11 +2495,7 @@ bool bpf_jit_supports_arena(void)
          * atomic cmpxchg; this is provided by not only hardware SCQ 
extension
          * but also assembler support on LoongArch.
          */
-#ifdef system_has_cmpxchg128
-       return system_has_cmpxchg128();
-#else
-       return false;
-#endif
+       return IS_ENABLED(CONFIG_AS_HAS_SCQ_EXTENSION) && 
system_has_cmpxchg128();
  }

  bool bpf_jit_supports_fsession(void)
```

It still fails with the same error due to the macro visibility:

   CC      arch/loongarch/net/bpf_jit.o
arch/loongarch/net/bpf_jit.c: In function ‘bpf_jit_supports_arena’:
arch/loongarch/net/bpf_jit.c:2498:59: error: implicit declaration of 
function ‘system_has_cmpxchg128’ [-Wimplicit-function-declaration]
  2498 |         return IS_ENABLED(CONFIG_AS_HAS_SCQ_EXTENSION) && 
system_has_cmpxchg128();
       | 
^~~~~~~~~~~~~~~~~~~~~
make[5]: *** [scripts/Makefile.build:290: arch/loongarch/net/bpf_jit.o] 
Error 1

Therefore, using the explicit #ifdef block in the original patch is the
only way to ensure toolchain compatibility and compile-time robustness
here IMO.

Anyway, I will modify the patch subject, update the commit message
and code comment to make it more clear.

Thanks,
Tiezhu

