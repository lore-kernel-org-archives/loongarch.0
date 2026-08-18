Received: from mail-ej2-f2.google.com (mail-ej2-f2.google.com [74.125.228.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4537B2D9796
	for <loongarch@lists.linux.dev>; Tue, 18 Aug 2026 14:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787061924; cv=none; b=YQHe1ksfijRL7LZU6WlD/wLf8kKJH3onkM7VM2255rl1Qwjfh2RX2Ra1Y5cHheZQM47yt7+AW0wKRSNE3XgzLyg5BRrwPILI/01Zg6SHvSUkZsCbX4tJXpD8rPsojYfcsNJr94F9izg9V08HgSRaT9yDsLafnW8aF1peCMDQG/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787061924; c=relaxed/simple;
	bh=6lN7JRMhV++fUWBRY/mOyEZ6HBCxjfX02lNtSVCMpUg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CO/97Zy+sJuGdB91JcS4sM76sFppk1MelZZmiVeY/W8PyeF1+qEsofj4Zbt4quqXQZx6JVgDGKqX1CJvV0rehkiwevKETfQ/EytV1AjylOYIGdM6OhWTjE93OK25vhNMdNqyu+gCEvZPQJLTDVVxJbSiza5DROWpiqDpp34kFHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/N7TSTm; arc=none smtp.client-ip=74.125.228.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/N7TSTm"
Received: by mail-ej2-f2.google.com with SMTP id a640c23a62f3a-c16060ba9ecso41571866b.0
        for <loongarch@lists.linux.dev>; Tue, 18 Aug 2026 07:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787061921; x=1787666721; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8J8uVRc1aTCENx69srR/YmAYw9UpjNQQND8eHx6fKtQ=;
        b=s/N7TSTmeftDGSrA3yWltCs+9Uu1z047ZF44HRZ6qv+Y8dAsmkfD1Ixp+Q4Tb6y1fk
         7R9enyJpp9KgNmAnC9kicRMnV1AFzbgPxM3a9qjN6QMoV3E5U89lchL7ZQk02XrAKHjL
         KFlS4gwXEWW2QE5W0koWxPpxN21Q5wEc7/KgA/yc0yt9HeApiBGOIcXlWk26xMzXbfnP
         Zoy4SGXCuqVnTdd+/kqQB6pm2UabNwfcPgKDswCg/xEbXOgQmaVCKVEIxpA1tMYjssZk
         6dDIE/pXNo0sgNkJ2x0m1VTsxndk13pgzbLbGbP5OjZN87lb2D3+lgN76TCcohbcP5ou
         /ZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787061921; x=1787666721;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8J8uVRc1aTCENx69srR/YmAYw9UpjNQQND8eHx6fKtQ=;
        b=D7urSRMXC/FflHWs+01qX3Gly6aFlhsqscZxziUHq4uC46cAQ73VqniK1MobZCIBTk
         hqvXXlUk5mtK7a3MlGlsbUSBD+goxQFRG/+emD8uOQPeKjoF6ssFDupI1vR86zJUgtCO
         Oqh9cQNJy86nzyV/HP87PXIjl1sDB5nBu1ikDkinDlplidSeMdDFoIDpRZ9MrwQyocYR
         rtX5q036gs7YJnbXpLP+b+Vk1KIJX3EN1FfDkZwTeeA4n2F1327oYDCipi6viloMPiYm
         0XjdA2ezbbYKpvAoBH5nE2p3B5IpljCleVwoBGYA3lTcSp1eR9mDuAUoziu1CtfexVzF
         83bA==
X-Gm-Message-State: AOJu0YxCafeETybr3M8xo5OuNvv7lHXFItrOtJEoDjb9/z0CIk5DAWpw
	NDJ39vZ1q6Mt4+fPz66XA7tiUf6xbyJRFq0XPLJAFzzBXStXOBxHH9Lv1Oi5u1Dr
X-Gm-Gg: AR+sD13/K9CLidd0XStRyNztTSCX9YFH2rEZS4ZZ652ZYEjBVNTcOQCKcOQFPtA7VnX
	a19Ubu5OzpL+cK4pf+sJ/hvRHdQhk2NBWThSGUx1DWeZSCDyi7obSueR2O2OrKgItITg+b8Q6zq
	CenCnB4uurzg50fFxMw+agnjIMXn4r1APU8dTdXX0ecoEhcXSrcM5nnIrYltQEtOu/bzEUQUXCl
	dtKPmFqSnNUsvtFwlLXr3J6n1C/yYOFs7N0zvSnNXf05XMF3GexH7QR32WYQOVT+ILOnJO3vXWJ
	8dSv3xMtbUwxtNGtYKHXZ3a4TEy+uWpeAcaz45CC5flHO9RY9oIUPxxYKBHjqoqwGBh01s10Znx
	2JgT4B+GopZ/4Rug4KK3iPX3hVS5PsID2Z/WUGM8TS+TjAJntHaLlm8o2HGiTe23EpsdTgjG5tm
	jBQpYhgk9J5jo0wzIPPOpEYK6TIyIpHIBYKDcjLGoWBSYShIpk//4PaXnk6To9wBm6/DUCanpLk
	5QeP0sISNeMPnAJFBGTetFlL5qwQlgZOV0z7ok06Ri4d/sVlVyX53HLlsR4ItlcoPs3UliQsvSA
	Hc7piAnbgXxY7GCOZeipV4MGNo4=
X-Received: by 2002:a17:906:c147:b0:c16:785:cfb6 with SMTP id a640c23a62f3a-c218d9ba609mr329965666b.3.1787061921093;
        Tue, 18 Aug 2026 07:05:21 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2187d269dbsm144722766b.7.2026.08.18.07.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 07:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 16:05:20 +0200
Message-Id: <DKS4KWIT8C5I.2THOLN7FKRRJT@gmail.com>
Cc: <loongarch@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Vincent
 Li" <vincent.mc.li@gmail.com>, <bpf@vger.kernel.org>
Subject: Re: [PATCH v1] LoongArch: Fix __smp_mb__{before,after}_atomic()
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Huacai Chen"
 <chenhuacai@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260817035908.460-1-yangtiezhu@loongson.cn>
 <3103b3b4-5c0d-ed87-2e15-31a4d2289ec5@loongson.cn>
 <DKS3YCAMWONO.2NVVH8IPARH7Y@gmail.com>
 <48ade10d-dd1f-ac6f-e827-d76a81183486@loongson.cn>
In-Reply-To: <48ade10d-dd1f-ac6f-e827-d76a81183486@loongson.cn>

On Tue Aug 18, 2026 at 3:50 PM CEST, Tiezhu Yang wrote:
> On 2026/8/18 =E4=B8=8B=E5=8D=889:35, Kumar Kartikeya Dwivedi wrote:
>> On Tue Aug 18, 2026 at 3:28 PM CEST, Tiezhu Yang wrote:
>>> On 2026/8/17 =E4=B8=8A=E5=8D=8811:59, Tiezhu Yang wrote:
>>>> When testing the BPF selftest "sudo ./test_progs -t timer_lockup", the=
re
>>>> is a kernel lockup and panic:
>>>
>>> ...
>>>
>>>> With this patch, the lockless "store-before-load" ordering is enforced=
 by
>>>> the DBAR instruction. The BPF timer_lockup selftest was stressed for 5=
000
>>>> consecutive loops on a physical LoongArch machine without encountering=
 any
>>>> further lockups or warnings:
>>>>
>>>>     for i in {1..5000}; do sudo ./test_progs -t timer_lockup; done
>>>
>>> ...
>>>
>>>> diff --git a/arch/loongarch/include/asm/barrier.h b/arch/loongarch/inc=
lude/asm/barrier.h
>>>> index 4b663f197706..adfe343dfa65 100644
>>>> --- a/arch/loongarch/include/asm/barrier.h
>>>> +++ b/arch/loongarch/include/asm/barrier.h
>>>> @@ -57,8 +57,8 @@
>>>>    #define __WEAK_LLSC_MB		"			\n"
>>>>    #endif
>>>>
>>>> -#define __smp_mb__before_atomic()	barrier()
>>>> -#define __smp_mb__after_atomic()	barrier()
>>>> +#define __smp_mb__before_atomic()	__smp_mb()
>>>> +#define __smp_mb__after_atomic()	__smp_mb()
>>>>
>>>>    /**
>>>>     * array_index_mask_nospec() - generate a ~0 mask when index < size=
, 0 otherwise
>>>
>>> Hi all,
>>>
>>> To address the soft lockup while avoiding the performance overhead of
>>> executing two separate instructions, I think there is a more elegant
>>> way to fix this directly in the BPF core helper:
>>>
>>> We can replace atomic_inc() and smp_mb__after_atomic() with a single
>>> atomic_fetch_add() in bpf_timer_cancel(). This consolidates the logic
>>> into a single native atomic operation with full ordering, which not
>>> only guarantees the store-load order to eliminate the deadlock but
>>> also improves the performance for weak memory model architectures.
>>>
>>> Any thoughts on this approach?
>>>
>>> ```
>>> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
>>> index c18f1e16edee..ee2b3a4dcc05 100644
>>> --- a/kernel/bpf/helpers.c
>>> +++ b/kernel/bpf/helpers.c
>>> @@ -1591,9 +1591,7 @@ BPF_CALL_1(bpf_timer_cancel, struct bpf_async_ker=
n
>>> *, async)
>>>            */
>>>           if (!cur_t)
>>>                   goto drop;
>>> -       atomic_inc(&t->cancelling);
>>> -       /* Need full barrier after relaxed atomic_inc */
>>> -       smp_mb__after_atomic();
>>> +       atomic_fetch_add(1, &t->cancelling);
>>>           inc =3D true;
>>>           if (atomic_read(&cur_t->cancelling)) {
>>>                   /* We're cancelling timer t, while some other timer
>>> callback is
>>> ```
>>>
>>> I tested the above diff, the BPF timer_lockup selftest was stressed
>>> for 5000 consecutive loops on a physical LoongArch machine without
>>> encountering any further lockups or warnings.
>>
>> There is a full barrier in both cases. I don't know what performance imp=
rovement
>> will be achieved by changing this.
>
> We performed benchmarking using UnixBench on a physical LoongArch
> machine, the UnixBench score is different (amadd.w + dbar < amadd_db.w).
>

I mean, this function is already quite heavy. We have multiple fully ordere=
d
atomics (refcount bumps/drops, xchg(), etc.) spread across the operation. D=
o you
observe any measurable speedup in the throughput of this function?  The sec=
ond
question is whether timer cancellation is really frequent. In practice, I d=
on't
think that is the case.  The actual hrtimer_cancel() in itself is heavy and
waits synchronously for the callback to finish.

I'm not opposed to it or anything, I just don't think it's worth it in this
case. If the latency of cancel is a problem there are other bigger opportun=
ities
to pursue than this.

>> Don't you need to fix the lowering for
>> smp_mb__after_atomic() anyway? It's used in several other places in the =
kernel.
>
> The LoongArch architecture-level fix for smp_mb__after_atomic() is
> a fundamental bug fix that will be pushed separately to the LoongArch
> tree. This BPF-layer change is intended as a generic, cross-architecture
> performance optimization.
>
> Thanks,
> Tiezhu

