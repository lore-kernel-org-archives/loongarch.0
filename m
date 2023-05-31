Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863C5D2F6
	for <loongarch@lists.linux.dev>; Wed, 31 May 2023 10:02:10 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx1fAeG3dk7+wCAA--.6514S3;
	Wed, 31 May 2023 18:02:06 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxLL4dG3dkSzSCAA--.14949S3;
	Wed, 31 May 2023 18:02:06 +0800 (CST)
Subject: Re: [PATCH v3] LoongArch: Add support to clone a time namespace
To: Youling Tang <tangyouling@loongson.cn>
References: <1685519761-20425-1-git-send-email-yangtiezhu@loongson.cn>
 <526b7cdc-9d10-d213-4e98-10973483b4cd@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Christian Brauner <brauner@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <d116627c-f21f-1f6b-3c3d-96bea9a29393@loongson.cn>
Date: Wed, 31 May 2023 18:02:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <526b7cdc-9d10-d213-4e98-10973483b4cd@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8BxLL4dG3dkSzSCAA--.14949S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Ar4UWr1fXry7AFyxWF48Zwb_yoW8WF4Dpw
	4kArWvkr4UGr1fGFyfGw13uwnrJws7uw1YgFW3ZrW2kFnxJFyDZr4vgrn8GF15Zw4UAry0
	934kZwsYva48JwUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	baxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8ZwC2
	0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
	0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
	0xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
	IE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZF
	pf9x07jYSoJUUUUU=



On 05/31/2023 04:34 PM, Youling Tang wrote:
> Hi, Tiezhu
>
> On 05/31/2023 03:56 PM, Tiezhu Yang wrote:

...

> It can also be changed as follows,
>
> enum vvar_pages {
>     VVAR_GENERIC_PAGE_OFFSET,
>     VVAR_TIMENS_PAGE_OFFSET,
>     VVAR_LOONGARCH_PAGES_START,
>     VVAR_LOONGARCH_PAGES_END = VVAR_LOONGARCH_PAGES_START +
> LOONGARCH_VDSO_DATA_PAGES - 1,
>     VVAR_NR_PAGES,
> };
>
> #define VVAR_SIZE (VVAR_NR_PAGES << PAGE_SHIFT)
>
> Which do you think is better?

Thanks, it seems more simple to define VVAR_SIZE and works well
as expected. Let us wait for more review comments before respin.

I will send v4 with the following changes based on the current
patch in the next week.

$ git diff
diff --git a/arch/loongarch/include/asm/vdso/vdso.h 
b/arch/loongarch/include/asm/vdso/vdso.h
index fa6049ef635e..7e9bceb8c009 100644
--- a/arch/loongarch/include/asm/vdso/vdso.h
+++ b/arch/loongarch/include/asm/vdso/vdso.h
@@ -33,15 +33,17 @@ struct loongarch_vdso_data {
   */
  #define LOONGARCH_VDSO_DATA_SIZE PAGE_ALIGN(sizeof(struct 
loongarch_vdso_data))
  #define LOONGARCH_VDSO_DATA_PAGES (LOONGARCH_VDSO_DATA_SIZE >> PAGE_SHIFT)
-#define VVAR_SIZE (VVAR_LOONGARCH_PAGES_START * PAGE_SIZE + 
LOONGARCH_VDSO_DATA_SIZE)

  enum vvar_pages {
         VVAR_GENERIC_PAGE_OFFSET,
         VVAR_TIMENS_PAGE_OFFSET,
         VVAR_LOONGARCH_PAGES_START,
         VVAR_LOONGARCH_PAGES_END = VVAR_LOONGARCH_PAGES_START + 
LOONGARCH_VDSO_DATA_PAGES - 1,
+       VVAR_NR_PAGES,
  };

+#define VVAR_SIZE (VVAR_NR_PAGES << PAGE_SHIFT)
+
  static inline unsigned long get_vdso_base(void)
  {
         unsigned long addr;

Thanks,
Tiezhu

