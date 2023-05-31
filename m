Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888F27E1
	for <loongarch@lists.linux.dev>; Wed, 31 May 2023 08:34:09 +0000 (UTC)
Received: from loongson.cn (unknown [192.168.100.1])
	by gateway (Coremail) with SMTP id _____8Bx7OqABndkdecCAA--.2080S3;
	Wed, 31 May 2023 16:34:08 +0800 (CST)
Received: from [0.0.0.0] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxGLZ+BndkMheCAA--.14780S3;
	Wed, 31 May 2023 16:34:07 +0800 (CST)
Subject: Re: [PATCH v3] LoongArch: Add support to clone a time namespace
To: Tiezhu Yang <yangtiezhu@loongson.cn>
References: <1685519761-20425-1-git-send-email-yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Christian Brauner <brauner@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Youling Tang <tangyouling@loongson.cn>
Message-ID: <526b7cdc-9d10-d213-4e98-10973483b4cd@loongson.cn>
Date: Wed, 31 May 2023 16:34:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1685519761-20425-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8BxGLZ+BndkMheCAA--.14780S3
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7KF47CFWkAFyrJw4kGrWrAFb_yoW8CF4Dpr
	s3Ars2kr4UGr1fWF1rJr13uwnrJan7Wr1YgF45trWxArnrAryUWr1DKrn5GFWUX3yUAry8
	ur1kZw4vvw1kJrUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bDAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
	e7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
	xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
	026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF
	0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
	vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
	6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j7BMNUUUUU=

Hi, Tiezhu

On 05/31/2023 03:56 PM, Tiezhu Yang wrote:
/* snip */
> diff --git a/arch/loongarch/include/asm/vdso/vdso.h b/arch/loongarch/include/asm/vdso/vdso.h
> index 3b55d32..fa6049e 100644
> --- a/arch/loongarch/include/asm/vdso/vdso.h
> +++ b/arch/loongarch/include/asm/vdso/vdso.h
> @@ -16,10 +16,31 @@ struct vdso_pcpu_data {
>
>  struct loongarch_vdso_data {
>  	struct vdso_pcpu_data pdata[NR_CPUS];
> -	struct vdso_data data[CS_BASES]; /* Arch-independent data */
>  };
>
> -#define VDSO_DATA_SIZE PAGE_ALIGN(sizeof(struct loongarch_vdso_data))
> +/*
> + * The layout of vvar:
> + *
> + *                      high
> + * +---------------------+--------------------------+
> + * | loongarch vdso data | LOONGARCH_VDSO_DATA_SIZE |
> + * +---------------------+--------------------------+
> + * | timens vdso data    | PAGE_SIZE                |
> + * +---------------------+--------------------------+
> + * | generic vdso data   | PAGE_SIZE                |
> + * +---------------------+--------------------------+
> + *                      low
> + */
> +#define LOONGARCH_VDSO_DATA_SIZE PAGE_ALIGN(sizeof(struct loongarch_vdso_data))
> +#define LOONGARCH_VDSO_DATA_PAGES (LOONGARCH_VDSO_DATA_SIZE >> PAGE_SHIFT)

> +#define VVAR_SIZE (VVAR_LOONGARCH_PAGES_START * PAGE_SIZE + LOONGARCH_VDSO_DATA_SIZE)
> +
> +enum vvar_pages {
> +	VVAR_GENERIC_PAGE_OFFSET,
> +	VVAR_TIMENS_PAGE_OFFSET,
> +	VVAR_LOONGARCH_PAGES_START,
> +	VVAR_LOONGARCH_PAGES_END = VVAR_LOONGARCH_PAGES_START + LOONGARCH_VDSO_DATA_PAGES - 1,
> +};
It can also be changed as follows,

enum vvar_pages {
	VVAR_GENERIC_PAGE_OFFSET,
	VVAR_TIMENS_PAGE_OFFSET,
	VVAR_LOONGARCH_PAGES_START,
	VVAR_LOONGARCH_PAGES_END = VVAR_LOONGARCH_PAGES_START + 
LOONGARCH_VDSO_DATA_PAGES - 1,
	VVAR_NR_PAGES,
};

#define VVAR_SIZE (VVAR_NR_PAGES << PAGE_SHIFT)

Which do you think is better?

Youling.

