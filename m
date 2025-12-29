Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822F131B818
	for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 14:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767018129; cv=none; b=N6bQu+Yz2lFimps75IavUubTqMqjz+dxFHbP0nLLWvS9sETvFhu0EH1KZE+mkWpnhGET3ffstekMrdIlu/4KrZUNwdUTubMl1WYl4A6qcICuPBP9GxuEN4Njw3nnxT2+q4pVH/w8rwZyKzcQB4mHvuXLmS0vTLKv8kkYnjIn8BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767018129; c=relaxed/simple;
	bh=E3/F9g7wyff0vQsp3dQcMKJxrxPvGx6oHDQIJPd0ITc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bx8IRSkv/+SWORz4rnmq7MmmbE9I8KsDUnDlve4a3V1jJVZgYPakPwqgPTg3OVuTEacsqhzzC+sgi5KclAgKsH6u0VEBaXYUeaCiy25c/Q43BUC0A8s5J4kNA0ZHPMk9VVvBXTK5AtAkxtqWcdROfW9IN6zexZQRWBIQtmcejI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J339j2Io; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J339j2Io"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4537407477aso5766081b6e.1
        for <loongarch@lists.linux.dev>; Mon, 29 Dec 2025 06:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767018126; x=1767622926; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kSaypy2VO8fSJfHklVkE0bedhediZiR/wlX+EHisHU=;
        b=J339j2IobNY0hPqUvOEqZZZxIW2KGfoOCfbkFO7y4VsyNDcRMLq8Zt82sUUwj1kyXh
         TKQaFHauZ5KE8vVEMikpe1+okGWtALQy0A9IPS5sjEdSanj7MBHUivKaaZJ5DkpWmFUH
         C62UHig+p2mtMx2USF9r5BZHGrodRGTAb0S7DuzS6e7i/FYmx3j9szE4//dAPk/w+QPL
         54ngq7Apqp50V+6WHcSV2KDOPrNGuIzhJZiqGFO/gnkuH0X32WYklS8qwWlV1gCFazwG
         PWr1jiBTt6EddyncdL1m5xZsJqJYLdb0N0ZxcaX7MKV9oaEPnyy6MfcM1DYVXjzjC2cL
         OiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767018126; x=1767622926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8kSaypy2VO8fSJfHklVkE0bedhediZiR/wlX+EHisHU=;
        b=l8TYSyZiUZIyjJJAdS8XTMgbNECr9bHdlRzH4jdMcdtDlqGf38FZkO6WFrCKqqoSTh
         g6jMcFkjLAq2/mIZJNID0lGbO3S8AapuSGy4kh7d99OsIBqgTR48LnhwVZsrSNpbkbwH
         Xq0GURfrUtSkwwtNo5v/KfPa2SQb6YZOK9Y/ucXl8E5SaDIb9VXeYwNV62avGxZfsaO3
         w2liywQ8Z6Qy7GNpZudSn+hgeXtx0WFYGuyTTV31rT5rVMWb6r7xyCKEErvAsWjuBoWV
         HF7NwvIfW/wJfVmj3wJvIt/rd6+ORc8XyCz2gSx7JJFD+iiZiqdvpUJEtV0vPtEmPYT5
         2YeA==
X-Forwarded-Encrypted: i=1; AJvYcCXQBkrwme86tNXIuAywFySamSOUmVb4CD2T4O0O8JO1x/cDYvlzQL4ayfx4vIA6Twn5a99fwaE3+2Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7084MG56r9fuh7if5jRO1z2b1KQYOT6IKrbW9NW4PPNn37Hnp
	7eJzpiQ/7aPERAED3LeLK6uIJzKg78wl0bZsT2f2f831jZ1OSKMYjkA82ziq4pEXUDMftT1s+XG
	5jJ23Mm4DPsi+zqZ5QXfcsXCBY2Vsksc=
X-Gm-Gg: AY/fxX4I0kzG7yQ/Vft1ACDtXhKMdihaZ/m1lWKzRVN61MaU0240MoQ/e7Y2Pzbbsgc
	oghKgI0RLayOpnEbvczdpDwB4dLjk82MoQoKAsQ1xbsZtc4DannoMBJGzWdOyih+p4RNgi9n5Ea
	1dwabRVnBDpDoka8MsJ/lP7mo9raqDx32a60gjKOROCyYEze60rIQPcuIG9XQif5DVsyIKXdcXI
	6spHj4y2ipaCgQbj8OUz3sRqzdB0mcq08hlScFUfPIUR4QaXyMpxx3JLoxsubmN/oVK0OgE
X-Google-Smtp-Source: AGHT+IEWccJ+DPX0WlA8rZ4GC1x/eVc8xhUFKwEhNdVEl77BsFeee3NEpe/Mj14XZGlvjGQGKg4QbPb6t8OHhR4QhR8=
X-Received: by 2002:a05:6808:2186:b0:441:8f74:e8b with SMTP id
 5614622812f47-457b218053amr13493961b6e.53.1767018126340; Mon, 29 Dec 2025
 06:22:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEyhmHQgkgU-c6rmBc0672oNCdQAzz4Ob5kN4p7k6MUo9B4Okw@mail.gmail.com>
 <20251229063408.34340-1-dongtai.guo@linux.dev>
In-Reply-To: <20251229063408.34340-1-dongtai.guo@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 29 Dec 2025 22:21:55 +0800
X-Gm-Features: AQt7F2oEPaN2S74ARWbkyPbOevqlM_GQj9VfBNCzP3CIwqBr1AIYMwr2miJxWwQ
Message-ID: <CAEyhmHT1gRtGCiM7C6QmrF38xxzc2OLKgiNRWd0whpSSJoyrjg@mail.gmail.com>
Subject: Re: [PATCH loongarch-next 0/4] LoongArch: Add 128-bit atomic cmpxchg support
To: George Guo <dongtai.guo@linux.dev>
Cc: chenhuacai@kernel.org, guodongtai@kylinos.cn, kernel@xen0n.name, 
	lianyangyang@kylinos.cn, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, r@hev.cc, xry111@xry111.site
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 2:34=E2=80=AFPM George Guo <dongtai.guo@linux.dev> =
wrote:
>
> This patch series adds 128-bit atomic compare-and-exchange support for
> LoongArch architecture, which fixes BPF scheduler test failures caused
> by missing 128-bit atomics support.
>
> The series consists of four patches:
>
> 1. "LoongArch: Add SCQ support detection"
>     - Check CPUCFG2_SCQ bit to determin if the CPU supports
>     SCQ instrction.
>
> 2. "LoongArch: Add 128-bit atomic cmpxchg support"
>    - Implements 128-bit atomic compare-and-exchange using LoongArch's
>      LL.D/SC.Q instructions
>    - Fixes BPF scheduler test failures (scx_central scx_qmap) where
>      kmalloc_nolock_noprof returns NULL due to missing 128-bit atomics,
>      leading to -ENOMEM errors during scheduler initialization
>
> 3. "LoongArch: Use spinlock to emulate 128-bit cmpxchg"
>    - For LoongArch CPUs lacking 128-bit atomic instruction(e.g.,
>      the SCQ instruction on 3A5000), provide a fallback implementation
>      of __cmpxchg128 using a spinlock to emulate the atomic operation.
>
> 4. "LoongArch: Enable 128-bit atomics cmpxchg support"
>    - Adds select HAVE_CMPXCHG_DOUBLE and select HAVE_ALIGNED_STRUCT_PAGE
>      in Kconfig to enable 128-bit atomic cmpxchg support
>
> The issue was identified through BPF scheduler test failures where
> scx_central and scx_qmap schedulers would fail to initialize. Testing
> was performed using the scx_qmap scheduler from tools/sched_ext/,
> confirming that the patches resolve the initialization failures.
>
> ---
> Changes in v7:
> - Create patches based on loongarch-next branch(previously used master)
> - Link to v6: https://lore.kernel.org/r/20251215-2-v6-0-09a486e8df99@linu=
x.dev
>

Please tag the subject line with v7 and resend, otherwise this
confuses b4. Thanks.

> Changes in v6:
> - Put SCQ information in hwcap
> - Link to v5: https://lore.kernel.org/r/20251212-2-v5-0-704b3af55f7d@linu=
x.dev
>
> Changes in v5:
> - Reordered the patches
> - Link to v4: https://lore.kernel.org/r/20251205-2-v4-0-e5ab932cf219@linu=
x.dev
>
> Changes in v4:
> - Add SCQ support detection
> - Add spinlock to emulate 128-bit cmpxchg
> - Link to v3: https://lore.kernel.org/r/20251126-2-v3-0-851b5a516801@linu=
x.dev
>
> Changes in v3:
> - dbar 0 -> __WEAK_LLSC_MB
> - =3DZB" (__ptr[0]) -> "r" (__ptr)
> - Link to v2: https://lore.kernel.org/r/20251124-2-v2-0-b38216e25fd9@linu=
x.dev
>
> Changes in v2:
> - Use a normal ld.d for the high word instead of ll.d to avoid race
>   condition
> - Insert a dbar between ll.d and ld.d to prevent reordering
> - Simply __cmpxchg128_asm("ll.d", "sc.q", ptr, o, n) to __cmpxchg128_asm(=
ptr, o, n)
> - Fix address operand constraints after testing different approaches:
>   * ld.d with "m"
>   * ll.d with "ZC",
>   * sc.q with "ZB"(alternative constraints caused issues:
>    - "r"  caused system hang
>    - "ZC" caused compiler error:
>      {standard input}: Assembler messages:
>      {standard input}:10037: Fatal error: Immediate overflow.
>      format: u0:0 )
> - Link to v1: https://lore.kernel.org/r/20251120-2-v1-0-705bdc440550@linu=
x.dev
>
>
> George Guo (4):
>   LoongArch: Add SCQ support detection
>   LoongArch: Add 128-bit atomic cmpxchg support
>   LoongArch: Use spinlock to emulate 128-bit cmpxchg
>   LoongArch: Enable 128-bit atomics cmpxchg support
>
>  arch/loongarch/Kconfig                    |  2 +
>  arch/loongarch/include/asm/cmpxchg.h      | 66 +++++++++++++++++++++++
>  arch/loongarch/include/asm/cpu-features.h |  1 +
>  arch/loongarch/include/asm/cpu.h          |  2 +
>  arch/loongarch/include/asm/loongarch.h    |  1 +
>  arch/loongarch/kernel/cpu-probe.c         |  2 +
>  arch/loongarch/kernel/proc.c              |  1 +
>  7 files changed, 75 insertions(+)
>
> --
> 2.49.0
>
