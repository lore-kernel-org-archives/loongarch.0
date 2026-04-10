Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2763C3BE8
	for <loongarch@lists.linux.dev>; Fri, 10 Apr 2026 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775828411; cv=pass; b=P0Ds/aJdNZQzgHZnR8q+xwgLzGw6S56LSvxw73PMNSqdR4fb+aAUR2r85RAllavvxLZfOukSqWtLc8czn2XkBAQnnKcG9ahAgVd410PdVMceUYvluH8eKKM3cIMxkq5PltifFhRBDJLvbzA2FSvhLOshEgzj2y6SwvqRSN4zlKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775828411; c=relaxed/simple;
	bh=LSR04DrYd2CNPoGkLuzcgQfT1tMVn5ZfdEM6iihG19s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obs8HteX9wjK7FNsnuUkr6MHsAmzBo2q37gI1xmG8O8uCgcGZjbVC0IZTwykbYgXiN+slK/N4cgtMqkuokLsieZON6CuuJaeH8p+YMJga0Ijf4/C9afUxW+XXRt8qHaVa3agI2OrzboLyL9BRmmdobpyMrIjH7XV3Bcgm1eAXwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fuaeIarT; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fuaeIarT"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-128e4d0cc48so9423210c88.1
        for <loongarch@lists.linux.dev>; Fri, 10 Apr 2026 06:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775828407; cv=none;
        d=google.com; s=arc-20240605;
        b=NLshrYdVgFJODdHfpCJjWy8G3av/A/qh6WgO2Q11EZR4l3QWhB0bbKQce8CQNxPTHh
         jpHPhOhsn/p11qG+Pduzqw/3rC+VO2ZiXJR42JgGlMW7Gy81VERZkHBmjxJV7ZNaaDJf
         6dTlKPGlpS64fqhvUxBJf2h3Su7hTYJYROuoLf+aDtbN5iXFmfOZeP/Xyc3+rGAV1s2z
         nVoU3xkuXnAgOZubIEOkwu58W1lElKwxkXO+UqS/3LVDzz5pr/dut+y0uvqvCCky0xUE
         qnQoWugaurO+PU+AdGGnRoSSh194mreAhNiMdBi8YqNJfZBPyRM6PKflx5RChcjegj4W
         uZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iCXB7w7ko4o+lkpt1Tfr/OwLPxl1m2l/vGRhYm7vF9w=;
        fh=mvy8HCZr45xQJ1VVJQ3QsnAOU03sFmjwbj4ZR/46ViY=;
        b=Dh/usis55+Z5TuWbiPTxXpe3oAUXZi6AQOqrSmWT+7l4u/U5HSRkIhKB4k5K+fL4Hd
         BFA2jZkDFLRC9Au1xbQZH7LEtabjB3usfvO3N8skPz65vn/mNGC/GH5ItsS5idhqpN15
         8syWeV6k6Zd+FqiLsIOM3I75ttIZ1Dlb58IoPOFomrGCLReyaowxj3dKBAVu4OvZb7o4
         w4OHhMcAgS7dtY1lU87PRl9vYP8za5TsVImqXrmWEGU1cNzDkPLDm3iJkVycM7idwBw9
         NL61h8ujdovbWxP06Ue75EIUUg2hJD4a+fgippknKj/jC5S6KaD82WVMrp0Eka8eZKDJ
         7hxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775828407; x=1776433207; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iCXB7w7ko4o+lkpt1Tfr/OwLPxl1m2l/vGRhYm7vF9w=;
        b=fuaeIarTsZCwHmCcmuY0NJa/YuLcYjNDNifE7In/lr9S82c/vxjQJZrOlx9ZWyeyVE
         j5xgudHRAqt+EdD+pkzVCbinDYZWJAr+pPW4Syunfu7j/rQWYWpWByRKMcZH/Q04/yD5
         XZq5U4GRVMu+n1EYPRiwgZbThlw06bhGEEv8CH0vAFp999KwU2IaFEZB+3v6WkTOT5dQ
         D0qzJBgAE5RcoFODzBI2xwq/9E7K071F7/Bd4NSerQq5roLE5b6U7isiEl//UDlRKbmA
         Ju7l8808kv1OZZCLHcTiYMvmRSaHQkFKufQ+P14FCcCa/dueNV+jzQxpdHZSkA42wtD7
         9iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775828407; x=1776433207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCXB7w7ko4o+lkpt1Tfr/OwLPxl1m2l/vGRhYm7vF9w=;
        b=br8Canl8AdnN9Wd0C5MR+yDUVB8AUJESpjwygrgUvTNDXqyPo5QYybMGq+U5dKVovE
         i5Amch1txsrHXhmrO3EhKM+TmrWlc39YJ8ELnQtnEQTZ3D1s9ST9xtzBJ+8Muy4xixG3
         yUmxBTAh/+S5SpmXG+fjOVPJS95rWEzfxmaaHsP4a70RL7PGGX2HR93g9X8PhiUV5VfA
         vdWB39lMjxePXlwG+BWIP7cm93UMXKIEq6fI39nifyHEG5ZfXKVQG+OTFMezXvLUxeB/
         AiH8T5LXVDHVPQquuHtxWAWYmgoZav+g+r0W77/x0INyK2qBDAXDmsV/g3sIsfOUNSft
         QESQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZgij9/LgHZJZHThzh6nPSTRyb1+k1zbG2YNaBK4hz68ow6IwNbSwe/aj6RLSZ3LPYVOil8VAJ3lw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdHixpxAEqbXKtHTRNF00vgVnzsB+bQdxGmT9+DQcgvmeQ2tDN
	RuJiyJ91UfVzUZ8mSCHXXFGDkSmjwOYEkuuIqzwWW6jCALBlGE9WE9UY8w5qeBjjoIixmQ6oemF
	ysrAcm0ymJFhyPzSEOJl+hUUtHD8a3rg+Rj6yyK2E
X-Gm-Gg: AeBDiesF/bOrhJTosVmtnNl8yzv7MU3o0X34DusrNkzvNbPmj7eN7nHSEUezXMcaf42
	OGKWKWbMNOszUVGPgd0Vt89tkIvh69fTrcayYhBZSaIEBskGgPRMGxtjmy0ql5NxHMPWT23sjx2
	gi8WgkP0t6DSb7PM1+G4IE4o7UfvbHBP9mWAorPVwNT8Pn8jEcUEscCdDi1LURbpAwzspLunPFN
	tsN2smWykqmt2xrchy9BUSBGABxtXvxCR33E+yhkyjn8WH+QQLh40EGxpVjulevRKeGu73kTP8L
	E1m8zZlG+1gB64bdaO0rzdyuc1GwwvYSQJ+hGyDsPxDKv5+U
X-Received: by 2002:a05:7022:fa04:b0:12c:2ed4:62fa with SMTP id
 a92af1059eb24-12c34ef907emr1882312c88.32.1775828406651; Fri, 10 Apr 2026
 06:40:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120318.862164111@kernel.org>
In-Reply-To: <20260410120318.862164111@kernel.org>
From: Marco Elver <elver@google.com>
Date: Fri, 10 Apr 2026 15:39:30 +0200
X-Gm-Features: AQROBzBE-9UxDQG5mMJLgipEeL_Y5pwE-Y_PUrJGxDBLilqBu51b8lLzxdip708
Message-ID: <CANpmjNO1vsO1LT6xijhz3nsjQa+_A=9omfgOSz=aGn293-LqTg@mail.gmail.com>
Subject: Re: [patch 19/38] kcsan: Replace get_cycles() usage
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	kasan-dev@googlegroups.com, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
>
> KCSAN uses get_cycles() for two purposes:
>
>   1) Seeding the random state with get_cycles() is a historical leftover.
>
>   2) The microbenchmark uses get_cycles(), which provides an unit less
>      counter value and is not guaranteed to be functional on all
>      systems/platforms.
>
> Use random_get_entropy() for seeding the random state and ktime_get() which
> is universaly functional and provides at least a comprehensible unit.
>
> This is part of a larger effort to remove get_cycles() usage from
> non-architecture code.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: kasan-dev@googlegroups.com

Reviewed-by: Marco Elver <elver@google.com>

> ---
>  kernel/kcsan/core.c    |    2 +-
>  kernel/kcsan/debugfs.c |    8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> --- a/kernel/kcsan/core.c
> +++ b/kernel/kcsan/core.c
> @@ -798,7 +798,7 @@ void __init kcsan_init(void)
>         BUG_ON(!in_task());
>
>         for_each_possible_cpu(cpu)
> -               per_cpu(kcsan_rand_state, cpu) = (u32)get_cycles();
> +               per_cpu(kcsan_rand_state, cpu) = (u32)random_get_entropy();
>
>         /*
>          * We are in the init task, and no other tasks should be running;
> --- a/kernel/kcsan/debugfs.c
> +++ b/kernel/kcsan/debugfs.c
> @@ -58,7 +58,7 @@ static noinline void microbenchmark(unsi
>  {
>         const struct kcsan_ctx ctx_save = current->kcsan_ctx;
>         const bool was_enabled = READ_ONCE(kcsan_enabled);
> -       u64 cycles;
> +       ktime_t nsecs;
>
>         /* We may have been called from an atomic region; reset context. */
>         memset(&current->kcsan_ctx, 0, sizeof(current->kcsan_ctx));
> @@ -70,16 +70,16 @@ static noinline void microbenchmark(unsi
>
>         pr_info("%s begin | iters: %lu\n", __func__, iters);
>
> -       cycles = get_cycles();
> +       nsecs = ktime_get();
>         while (iters--) {
>                 unsigned long addr = iters & ((PAGE_SIZE << 8) - 1);
>                 int type = !(iters & 0x7f) ? KCSAN_ACCESS_ATOMIC :
>                                 (!(iters & 0xf) ? KCSAN_ACCESS_WRITE : 0);
>                 __kcsan_check_access((void *)addr, sizeof(long), type);
>         }
> -       cycles = get_cycles() - cycles;
> +       nsecs = ktime_get() - nsecs;
>
> -       pr_info("%s end   | cycles: %llu\n", __func__, cycles);
> +       pr_info("%s end   | nsecs: %llu\n", __func__, nsecs);
>
>         WRITE_ONCE(kcsan_enabled, was_enabled);
>         /* restore context */
>
