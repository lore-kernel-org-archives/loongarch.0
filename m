Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCB937B
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 00:59:22 +0000 (UTC)
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8Bxd+jp8+JjubwPAA--.23722S3;
	Wed, 08 Feb 2023 08:59:21 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxg+Xn8+Jj41YsAA--.50874S3;
	Wed, 08 Feb 2023 08:59:20 +0800 (CST)
Subject: Re: [PATCH v2 2/5] LoongArch: Use la.pcrel instead of la.abs for
 exception handlers
To: Xi Ruoyao <xry111@xry111.site>, Youling Tang <tangyouling@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230207142822.52172-1-xry111@xry111.site>
 <20230207142822.52172-3-xry111@xry111.site>
 <657d46fa2290ccfacdf5ae0f8e313870405293bb.camel@xry111.site>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <eb21dd1b-e318-e9ac-7926-873ed35c06f9@loongson.cn>
Date: Wed, 8 Feb 2023 08:59:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <657d46fa2290ccfacdf5ae0f8e313870405293bb.camel@xry111.site>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8Cxg+Xn8+Jj41YsAA--.50874S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvdXoWrKry5WF48GFy7Kr47uFy5XFb_yoW3trg_uF
	Wkuw4UGw40yFWxAr4Ivr1DuF9rG3Z0grWUtrySqrWFyr9rXryDAFWSvrWxAa18WrnIvF98
	Gr1DtF4Sqry2vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	27kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
	xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E
	0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzV
	Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
	6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
	Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=


On 2023-02-07 22:39, Xi Ruoyao wrote:
> On Tue, 2023-02-07 at 22:28 +0800, Xi Ruoyao wrote:
>> +struct handler_reloc *eentry_reloc[128] = {
>> +       [0] = NULL, /* merr handler */
> Self review:
>
> This is actually incorrect.  Currently the merr handler (except_vec_cex)
> is coded as:
>
> SYM_FUNC_START(except_vec_cex)
>          b       cache_parity_error
> SYM_FUNC_END(except_vec_cex)
>
> Once this is copied into the per-cpu handler page, the offset (coded in
> the b instruction) will be absolutely wrong.  But it's already incorrect
> in the current mainline, and I'm not familiar with CSR.CRMD.DA=1
> configuration so I'm not sure how to fix it.
>
It bothers me, too. And I've mentioned it to Huacai offline before.
Besides, after fixing this issue I'll support a series of patches
to fix the cfi note in asm files.


