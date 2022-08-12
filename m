Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E2B62E
	for <loongarch@lists.linux.dev>; Fri, 12 Aug 2022 08:24:32 +0000 (UTC)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxOsw1DvZiYhcPAA--.11643S3;
	Fri, 12 Aug 2022 16:24:23 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Jump to the link address before enable PG
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
References: <20220811130301.2431582-1-chenhuacai@loongson.cn>
Cc: loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>,
 Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <bc52a604-828b-6d19-4f9c-df17cd180f34@loongson.cn>
Date: Fri, 12 Aug 2022 16:24:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220811130301.2431582-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf9AxOsw1DvZiYhcPAA--.11643S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KrW8Ar1kZF1UKry5Ar1DKFg_yoW8Zryfpr
	Z8Gw4kWw4kGF9rJ3W3Aw1j9rWrZan2y3Z8WFsrtrWfCws0qFnIy340vwnxXF9xt3yfKr42
	9F1qqFWIka1UA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU56c_DUUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/

On 08/11/2022 09:03 PM, Huacai Chen wrote:

> The kernel entry point of both boot-cpu and nonboot-cpu may be physical
> address from BootLoader (in DA mode or identity-mapping PG mode). So we
> should jump to the link address before PG enabled (DA is disabled at the
> same time) and just after DMW configured.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   arch/loongarch/kernel/head.S | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/arch/loongarch/kernel/head.S b/arch/loongarch/kernel/head.S
> index 7062cdf0e33e..c60eb66793e3 100644
> --- a/arch/loongarch/kernel/head.S
> +++ b/arch/loongarch/kernel/head.S
> @@ -21,6 +21,12 @@ SYM_CODE_START(kernel_entry)			# kernel entry point
>   	csrwr		t0, LOONGARCH_CSR_DMWIN0
>   	li.d		t0, CSR_DMW1_INIT	# CA, PLV0, 0x9000 xxxx xxxx xxxx
>   	csrwr		t0, LOONGARCH_CSR_DMWIN1
> +
> +	/* We might not get launched at the address the kernel is linked to,
> +	   so we jump there.  */
> +	la.abs		t0, 0f
> +	jr		t0
> +0:
Hi, Huacai,

I care about the real address these codes is running.  We know that the
kernel codes is placed at the location 0x9000000000200000 because the
firmware, or the compressed kernel puts it in this location. However,
there are other ways to put it to others location. E.g. during kdump,
when the capture kernel reboot, (here the capture kernel is the same
as the standard kernel), its address may be 0x9000000004200000, and
the physical address is 0x4200000. If only using la.abs which is a constant
after compiled is unreliable. The real address might look like as follows

   /* Get High */
   csrrd $t0,LOONGARCH_CSR_DMWIN1
   srli.d t0, t0, 59
   slli.d t0, t0, 59
   /* Get Low */
0:
   pcaddi t1, (1f-0b)/4
   srli.d t1, t1, 48
   slli.d t1, t1, 48
   /* Combine */
   or t0, t0, t1
   /* Jump */
   jr t0
1:

I admit that this thoughts may seem a little strange. It is not fully
considered, so if wrong, or should not be considered at present,
please ignore.

Thanks,
Jinyang

