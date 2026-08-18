Received: from mail-ej2-f0.google.com (mail-ej2-f0.google.com [74.125.228.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B301544A41B
	for <loongarch@lists.linux.dev>; Tue, 18 Aug 2026 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787060158; cv=none; b=sOllOC2QRKdi/2qpWuHjiPeSeQxzoUMDNJLpOtfggrPvaBR67uBFwZ/O6Olh7d9PURaOS5B4y4YDzRv5CFKgL4Q4uU3sxH3rOoEr6M+c3tL+WoG2QrV+nbaeDMQHAc4HQnGdT8sN3p0aqq34KJS18C4a1ODw7EVLW+IbtQlGy9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787060158; c=relaxed/simple;
	bh=69PmcPI3dm7Faoq28h94RmUiPIMu2QEtxtKq+uOtgsI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bmEXMoMSbF+vEF+YSPUbdjasETCcUhpCyNs2UL8nwi6VeNGQpXd4GLEm/NmQbu6y8rqH9LDiJ4t2bDar70Vh6PK6ZccJa83Nh0YLgI6H4/OO6EutXAw/piZKoBV6xdSyXXeyH8fXS4vAC3sjE2oCbqgWC5jESY3y8cPjslOB9eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNDl1kZ9; arc=none smtp.client-ip=74.125.228.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNDl1kZ9"
Received: by mail-ej2-f0.google.com with SMTP id a640c23a62f3a-c16772d888aso174082166b.1
        for <loongarch@lists.linux.dev>; Tue, 18 Aug 2026 06:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787060154; x=1787664954; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=co96cHXVTim0XeUqP04qIzrXjrThFIBTNFHixkplh6I=;
        b=mNDl1kZ9J82st2GIaO0zgwCgQBUTz2l7iprinqfnnIQ4ch/2jpZcNWy2fXKKFfZ0T4
         U89785qRcel6rMY4HOeHVAc1QfoDsskErEXd/MzfU6i9Z8qwOEyIL3QsdLBGuhY4DZDq
         pDqVIg132jTnTzQFYvAXiqO+N495FTj3bZYoT4sxPyvBZ3RsBVLUdfylr5I+GcOxOI0f
         82B2NCr/XUT0dcRrbVxVj899NVRwpvfesB6dohUCyBg+T/sGvhBZU35xRp13sBSCZs9G
         Mbi/nruFsyDqAK3lUutYRPBPRg/0pWPMBtht9y0ONzvCeNQXW6ayS6Law6LdwFMgMsdN
         8p7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787060154; x=1787664954;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=co96cHXVTim0XeUqP04qIzrXjrThFIBTNFHixkplh6I=;
        b=BqELZFJvXE1dPmn1WbN4EF9NfwOnIbcXppxcewjt6eh9OawA9V+qbuw0e+9hJBf9UW
         g6fZpYY7j/Ppk7PinzyfdPRUpW8jiZFu+Oi7XX0cO4P8iDDcIUQlsa2BukHwX9+oaGLQ
         qfYOa3iHLX3v1SsHnpP3l8vKVPRonjhoyi5hm4n91W51ef21nlQim/eKsN/mSAxmdDLC
         VTSVaTDkwFp/WOxrxL0soQQwkHSVAWPAXBxXaO+HMw3i1yKjB8C6fUFyp4gUxFxvJGQ9
         Q2i7Zf0MOMtIqW83VY0dstG+rlNdlonC+xiLGoLu/bJoHx6vmmRSLOqKj+6IvdS+9/Xi
         6GfQ==
X-Gm-Message-State: AOJu0YxFzLgsu4Ygbx9DU7dIvYqd79XVdps0EspZbU8SNBo9Nuzn046F
	vEdnVnaUP3M4a4e2hBt+oGBTCFSoZ9WDy/ye1RhIIyv9LWs84ZWWNZW4
X-Gm-Gg: AR+sD138cb7PIKdO6KQoDbQqkmI/FdFrlxThb2579kNVzawZgLYVBNiD5HNypGkG/pd
	F0M2Lm8SrGhU54jBRjTV7H5+Zq1dBBFLyICQM8oAdFW+Go/Ts2qW11esxrXAPT/NGsyIf6nb4/t
	ubb7IH7eartQ+o2HvegwGA/LyTOnQxWvT5W0+UpgSbkKCrqsSG+LjSQOfMLddkHLvPlH29ObMaR
	Je12yK7/syXCbGtd+ISG76LJvS9XIINl2t3XB2owQcrnmMr0PM7VXISgatuOlMS2xRO2PrlAD/G
	fkdAQgZYXNiUmSNwt/cTgyfs6eiLj6s7y3K6nS/UmRDDmAumF21J1ecfzfhMxOxxLjyGptTKmgk
	W/+D0IZjDbcPMvlwhL1sXGscgwlevjE8WHGe1bdxKJUP6Qm8JYjKiktXVWhanhLFUO2026ZBKq0
	p0qw/Czb5aZ11A08TMT4GEcbqYARSvG6f1L4fU+z4a5x9hzYi6ZzcFzTbTl2mjVoCquy+ZEkudT
	lcVww9q3PPjCL0hWPRm0mlMUZpSD4s+RJcHYOo+kGoKovvUa7ut/RkQotS4ejyJH43YSVA3qKZm
	aqTgxGQWxAheuIhDvFXRmBAsuew=
X-Received: by 2002:a17:907:b052:20b0:c1f:8145:820c with SMTP id a640c23a62f3a-c2129c1beeamr1154813466b.2.1787060153608;
        Tue, 18 Aug 2026 06:35:53 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b732a4sm162691866b.30.2026.08.18.06.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 06:35:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 15:35:52 +0200
Message-Id: <DKS3YCAMWONO.2NVVH8IPARH7Y@gmail.com>
Cc: <loongarch@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Vincent
 Li" <vincent.mc.li@gmail.com>, <bpf@vger.kernel.org>
Subject: Re: [PATCH v1] LoongArch: Fix __smp_mb__{before,after}_atomic()
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Huacai Chen"
 <chenhuacai@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260817035908.460-1-yangtiezhu@loongson.cn>
 <3103b3b4-5c0d-ed87-2e15-31a4d2289ec5@loongson.cn>
In-Reply-To: <3103b3b4-5c0d-ed87-2e15-31a4d2289ec5@loongson.cn>

On Tue Aug 18, 2026 at 3:28 PM CEST, Tiezhu Yang wrote:
> On 2026/8/17 =E4=B8=8A=E5=8D=8811:59, Tiezhu Yang wrote:
>> When testing the BPF selftest "sudo ./test_progs -t timer_lockup", there
>> is a kernel lockup and panic:
>
> ...
>
>> With this patch, the lockless "store-before-load" ordering is enforced b=
y
>> the DBAR instruction. The BPF timer_lockup selftest was stressed for 500=
0
>> consecutive loops on a physical LoongArch machine without encountering a=
ny
>> further lockups or warnings:
>>
>>    for i in {1..5000}; do sudo ./test_progs -t timer_lockup; done
>
> ...
>
>> diff --git a/arch/loongarch/include/asm/barrier.h b/arch/loongarch/inclu=
de/asm/barrier.h
>> index 4b663f197706..adfe343dfa65 100644
>> --- a/arch/loongarch/include/asm/barrier.h
>> +++ b/arch/loongarch/include/asm/barrier.h
>> @@ -57,8 +57,8 @@
>>   #define __WEAK_LLSC_MB		"			\n"
>>   #endif
>>
>> -#define __smp_mb__before_atomic()	barrier()
>> -#define __smp_mb__after_atomic()	barrier()
>> +#define __smp_mb__before_atomic()	__smp_mb()
>> +#define __smp_mb__after_atomic()	__smp_mb()
>>
>>   /**
>>    * array_index_mask_nospec() - generate a ~0 mask when index < size, 0=
 otherwise
>
> Hi all,
>
> To address the soft lockup while avoiding the performance overhead of
> executing two separate instructions, I think there is a more elegant
> way to fix this directly in the BPF core helper:
>
> We can replace atomic_inc() and smp_mb__after_atomic() with a single
> atomic_fetch_add() in bpf_timer_cancel(). This consolidates the logic
> into a single native atomic operation with full ordering, which not
> only guarantees the store-load order to eliminate the deadlock but
> also improves the performance for weak memory model architectures.
>
> Any thoughts on this approach?
>
> ```
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index c18f1e16edee..ee2b3a4dcc05 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -1591,9 +1591,7 @@ BPF_CALL_1(bpf_timer_cancel, struct bpf_async_kern
> *, async)
>           */
>          if (!cur_t)
>                  goto drop;
> -       atomic_inc(&t->cancelling);
> -       /* Need full barrier after relaxed atomic_inc */
> -       smp_mb__after_atomic();
> +       atomic_fetch_add(1, &t->cancelling);
>          inc =3D true;
>          if (atomic_read(&cur_t->cancelling)) {
>                  /* We're cancelling timer t, while some other timer
> callback is
> ```
>
> I tested the above diff, the BPF timer_lockup selftest was stressed
> for 5000 consecutive loops on a physical LoongArch machine without
> encountering any further lockups or warnings.

There is a full barrier in both cases. I don't know what performance improv=
ement
will be achieved by changing this. Don't you need to fix the lowering for
smp_mb__after_atomic() anyway? It's used in several other places in the ker=
nel.

>
> If you are OK with this change of bpf code, I will send a bpf patch
> later.
>
> Thanks,
> Tiezhu

