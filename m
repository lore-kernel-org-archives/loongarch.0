Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD678199E95
	for <loongarch@lists.linux.dev>; Thu,  5 Sep 2024 12:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725538444; cv=none; b=HD30s37Yx+SNR2x85gE89OwzPEbudxhjSjuUvHhPJSzJ9G/B3h4JaM8V5opdGd99hU3GXS41j70hzX1UE6Wxt3Ts1TEM9G5a95961oKZ9KMyEtHFSzvcWu9fFa82vmi9ijRwvLvB28gyMj5ixRLuZCUpsW0ytCsDeV3xTVX1kGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725538444; c=relaxed/simple;
	bh=jQAbs0qs4lvk5oXafT0yL0fVfAPA3AhakFfXNjUlLgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GyTs8P6z5xg8UkRlHhM1cvRo9AhfcdFlncKV8SeBNNza7JD77tyHIgZPfkwwL86hb4Rhuh5oPzbrv3GgzMqNhAi90D+zJ5APo0Ktiarlqi9I8mjPTRpf/YOgQ6Hqtd90MSZ8Lc+G4V5tsGXsr7KXpPC91yri3OeLmR1713Fvkfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYIwAkl2; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYIwAkl2"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f4f24263acso12929281fa.0
        for <loongarch@lists.linux.dev>; Thu, 05 Sep 2024 05:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725538441; x=1726143241; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBZ+0s5SNx30e0+OckzgvauEGclFKpW+V28EViaEY0g=;
        b=OYIwAkl2201FKQ5BRT3xoRPqZjsBMvS5TGQaKobRrOLTjEnpaMhLAiWkqHgWXr49ji
         wCSR6MNcej8CQdwY0EoBmc7m9nbfNoVRytWJnwB4GSWxxQnqEvg6zktO8NpLIcCAFmCq
         dZ84ruL1/nZl+0MV6CafGUDrQrplPGDFCyYjLPmvv/Vf61RfITscMgqmIVg5Mt14c9hB
         IPFkisHcZlR8VFex72FP2YNQARlNi4Z5XzFsENX5APnQN5d4FLFohXE4RnZXjgLkXjKn
         WgS339sliP0AOPiZpbLfgYS28rLKQJpkl35gu2VcePK0t+7h970gwxOT3yNQ4a1m8ixV
         KsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725538441; x=1726143241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBZ+0s5SNx30e0+OckzgvauEGclFKpW+V28EViaEY0g=;
        b=YIEMXq+8vQYMEzFBCvspRllbT+aCYRx1IBbMW5UT0o49PKvoRm0N1QNQdf1dPRJ2eI
         aKgM7wlBwAT/Q0d890wdFH9xe0sZJMmfbk8gCdMFWSkg2Jk7wlm92R1n0LPMvk74JUi0
         Z1OPDo0/mkTrXsSCuaaLg7/JGQFdyp0dl08s4SMEODPKe4tqSL2IXMid24bEGEG3S5GO
         rO0Rnzz/Y6dFlcsyqpfOFJZi3cuYGknXFzSM23bzbWmGnWLRwy5q91FRo8YuTcDWo76G
         ZK+Q8KsGbGgeEPURQFca3ogDfn8Mdcq4OBM9Tm8Q+fC/SxAoMCQQyOdg+IJBGM7sNnSZ
         2qVA==
X-Forwarded-Encrypted: i=1; AJvYcCVRhJlVBHZ3tYoXPZhQky5vLLu+nKpcw09ZphkHvcvN0vSsAlbVyUL0f36h/l0AL5WQQsXNsUXi61Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyxddnEa/iknYgl/unrmr9Aaf6baJ4kI5Td5qCvM1vmV8AUBtu
	rr0aKAj6RN+vGcfKCEKNDjlZphohhDdd4bd9DurhNK54ssUmQHSrTx6TWw2QwUx4GSd+45vk2P3
	9NQVvSs8ZtmaK1jUwePh6yRknFMiIr7Omkdw=
X-Google-Smtp-Source: AGHT+IFOzHv1i7xTEo6MfsfsTeIwg5gh/XJz+7gOOGAMyWDNK9tyr7ejvUFBveKn0pyO3LBUQiv4J1H4Yis5zAL2Ot0=
X-Received: by 2002:a2e:b894:0:b0:2ef:2422:dc21 with SMTP id
 38308e7fff4ca-2f6108adeecmr227701771fa.43.1725538440658; Thu, 05 Sep 2024
 05:14:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905065438.802898-1-ubizjak@gmail.com> <CAAhV-H7LtPja5K6ZoEbNTgjwjEL_uj-V11Y6Vq9HqTu1+2YMHw@mail.gmail.com>
 <c6c7ddb2730611e5877240de033f5af3263fae0b.camel@xry111.site>
In-Reply-To: <c6c7ddb2730611e5877240de033f5af3263fae0b.camel@xry111.site>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 5 Sep 2024 14:13:49 +0200
Message-ID: <CAFULd4bKs9SF95vh94+4wXtJV2TXX7qQ8SwC39X7ZL5JAnWQ4A@mail.gmail.com>
Subject: Re: [PATCH v3] LoongArch/percpu: Simplify _percpu_read() and _percpu_write()
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 1:58=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrote=
:
>
> On Thu, 2024-09-05 at 19:47 +0800, Huacai Chen wrote:
> > > +#define _percpu_write(size, _pcp, _val)                             =
           \
> > > +do {                                                                =
   \
> > > +       unsigned long __pcp_val =3D __pcpu_cast_##size(_val);        =
     \
> > > +                                                                    =
   \
> > > +       if (0) {                                                     =
   \
> > > +               typeof(_pcp) pto_tmp__;                              =
   \
> > > +               pto_tmp__ =3D (_val);                                =
     \
> > > +               (void)pto_tmp__;                                     =
   \
> > > +       }                                                            =
   \
> > Emmm, in V2 I just confirm that whether it is worth to use macro
> > instead of inline functions, I think we don't really need such a
> > checking here. :)
>
> It's still (slighly) better (just from aesthetics view) to use inline
> function instead of macro.  Is it possible to clear the header
> dependency and break the circle so we can still use __percpu in arch
> percpu.h instead?

Unfortunately, it is not possible. __percpu will use macros, defined
in <include/percpu.h>, and <include/percpu.h> needs
<loongarch/include/asm/percpu.h>. Up to now, it was enough to include
<include/linux/compiler_types.h>, so it was possible to avoid
unresolved include dependency.

> (Simply removing __percpu from the function parameter list causes many
> warnings with make C=3D1.)

This, and if/when loongson will use percpu named address checks, it
will break compilation.

FYI, it is possible to implement the same percpu address space checks
for loongson (as for x86) with clang and its address space attribute.
The compiler has to provide __typeof_unqual__ and the arch has to
define

# define __per_cpu_qual __attribute__((address_space(1)))

in its percpu.h file.

But we are not there yet ;)

Uros.
