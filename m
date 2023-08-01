Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191627E
	for <loongarch@lists.linux.dev>; Tue,  1 Aug 2023 03:32:07 +0000 (UTC)
Received: from loongson.cn (unknown [209.85.128.49])
	by gateway (Coremail) with SMTP id _____8BxXeu1fMhkr9QNAA--.27403S3;
	Tue, 01 Aug 2023 11:32:06 +0800 (CST)
Received: from mail-wm1-f49.google.com (unknown [209.85.128.49])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxxsyyfMhk54BDAA--.21898S3;
	Tue, 01 Aug 2023 11:32:03 +0800 (CST)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fe1a17f983so19687535e9.3
        for <loongarch@lists.linux.dev>; Mon, 31 Jul 2023 20:32:03 -0700 (PDT)
X-Gm-Message-State: ABy/qLYr/FlQ8zl2TOA5ODrfyenJTnxcJhMfvTqAOipr8bSZWMuhvTF9
	ikoqX4s3Dm/JbgBSghGfEQiWRS3CZugso6Yat7YkQQ==
X-Google-Smtp-Source: APBJJlGR2xCzEbR0KfLvULAvj4Q/rRacHyeQ3FRpG/PeA9oezM1aq7UPOCn9hCun1wnjhnQ09KzsW9iG/Ng+J4KnFBA=
X-Received: by 2002:a1c:ed0f:0:b0:3fe:1c05:3c8f with SMTP id
 l15-20020a1ced0f000000b003fe1c053c8fmr1260964wmh.35.1690856982158; Mon, 31
 Jul 2023 19:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230801011554.3950435-1-guoren@kernel.org>
In-Reply-To: <20230801011554.3950435-1-guoren@kernel.org>
From: WANG Rui <wangrui@loongson.cn>
Date: Tue, 1 Aug 2023 10:29:31 +0800
X-Gmail-Original-Message-ID: <CAHirt9ht8AsE=FC8+222JDZXH3T58uLt+o=_pq+1zBhv1MKRjg@mail.gmail.com>
Message-ID: <CAHirt9ht8AsE=FC8+222JDZXH3T58uLt+o=_pq+1zBhv1MKRjg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fixup cmpxchg sematic for memory barrier
To: guoren@kernel.org
Cc: chenhuacai@kernel.or, kernel@xen0n.name, arnd@arndb.de, 
	andi.shyti@linux.intel.com, andrzej.hajda@intel.com, peterz@infradead.org, 
	will@kernel.org, boqun.feng@gmail.com, mark.rutland@arm.com, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8BxxsyyfMhk54BDAA--.21898S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XFWxJry7Kw1kur13tr4fJFc_yoWkArg_Wa
	17Cw4Uuw4xXa13tanxKryfJr1qqa1xAFn3uaySqr1fAFn8Jw43Z397X3W3Zr17K3y8Xrs8
	u3ySqr90kr1j9osvyTuYvTs0mTUanT9S1TB71UUUU1UqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
	6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_GFv_Wrylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4L0eDUUUU

Hello,

On Tue, Aug 1, 2023 at 9:16=E2=80=AFAM <guoren@kernel.org> wrote:
> diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/includ=
e/asm/cmpxchg.h
> index 979fde61bba8..6a05b92814b6 100644
> --- a/arch/loongarch/include/asm/cmpxchg.h
> +++ b/arch/loongarch/include/asm/cmpxchg.h
> @@ -102,8 +102,8 @@ __arch_xchg(volatile void *ptr, unsigned long x, int =
size)
>         "       move    $t0, %z4                        \n"             \
>         "       " st "  $t0, %1                         \n"             \
>         "       beqz    $t0, 1b                         \n"             \
> -       "2:                                             \n"             \
>         __WEAK_LLSC_MB                                                  \
> +       "2:                                             \n"             \

Thanks for the patch.

This would look pretty good if it weren't for the special memory
barrier semantics of the LoongArch's LL and SC instructions.

The LL/SC memory barrier behavior of LoongArch:

* LL: <memory-barrier> + <load-exclusive>
* SC: <store-conditional> + <memory-barrier>

and the LoongArch's weak memory model allows load/load reorder for the
same address.

So, the __WEAK_LLSC_MB[1] is used to prevent load/load reorder and no
explicit barrier instruction is required after SC.

[1] https://lore.kernel.org/loongarch/20230516124536.535343-1-chenhuacai@lo=
ongson.cn/

Regards,
--
WANG Rui

