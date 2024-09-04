Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CE71E1A2F
	for <loongarch@lists.linux.dev>; Wed,  4 Sep 2024 18:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725475086; cv=none; b=RVujNi91cf7d9l1ZBH/+P3e+dNOIOT4NALhXQUb093MtSgOdFNzvKz1OCkOdNfEh2Ho9JEMGb9wKiJmO++NTWA4nzU2cR3gDbZDcSUWM6pe7Tk5sisU7deG55ijRMxAVW9F6ycYSAnNfiNfyFCF+0R0JHqaupFeR71o2EiceOpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725475086; c=relaxed/simple;
	bh=9pQAMVTSR3f24Wv5nWW5VXl+yfFf1TzPSaWfMAL7FMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUvdGW6YaOFIXB4HAIsQfIxJzuoSrROhamLaCs3MHO3BVWwifb3+56vza3ARpW9ggTRQl8P/rNOcvo1PD2al3qNNNARLZ9GEK5CXA8ftHORZashGBxX47Xqx7i7dszb8Fta5KPTzkgfKcFljJcgqULiJYr8D3g5aBy2aymcFp+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWtiiRms; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWtiiRms"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f4f2868710so75775641fa.1
        for <loongarch@lists.linux.dev>; Wed, 04 Sep 2024 11:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725475083; x=1726079883; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y31lgc5K/TFTdDqrtgkkfI0qYZcr/9voUjOlhV0p688=;
        b=ZWtiiRmsqyjEgqaQTxVIuBcKT24q8aOiPafCWkWPPGszpcQr0m7zIQwS78/c4Hl1Ly
         enq2QPxxOzrhRP9xEZtC3//O/5kqLrqQykU4zWG36JDWg39OsEbWL4Y1zD8GW3OpIAmo
         AQACWxzbAkjAyEC+Aw99YHmqbowDOIKjq6/5E4lizSdwFaenriq+TdFjNZb1fScBasPF
         bvHVTAFvJYFmo6S9/a/MZ+IQ7nMPWVUD1u9zPp3UbkANaAwVe3dTb5OiXRYUz7V5hMV7
         YXjCF2ZV9uaTlo20Ntvdw/jJa1PRKfo3G1qiz3Vr+7rCrQfhOVvklRA13sRdwixKBQh0
         flrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725475083; x=1726079883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y31lgc5K/TFTdDqrtgkkfI0qYZcr/9voUjOlhV0p688=;
        b=ddocMv6dkve7uiPP1d7lTHzkPUS9aeVvIUrFXvQCdMAmIP7a6jbKIcS9zzEOLw+UFX
         2fwHiDEhApRLAgDaophefOl6kxszHqcoOiaZF93mGaN/bKMU5B5VEs7RTFhNWo5EeZDM
         rZD4I8mWuxL6Qsrsr8JchwwCDMAFB6ikzs+IQao9DHSMmrEzLV8Mt+aB/jMbMH7Q2XHl
         MBYU5hcnHLuB5Ko+XqPs+UmEWZ/M9fig8iAFV/dOeF/cG9Jw0v5Edd/GkFhscifElKvt
         RiPUABDJhk12J5wrhyQhLQpaMrRhxcyzaf4vysq0knuDH+CoGtiyynWCwP6ejCKNJ2tq
         dyJg==
X-Gm-Message-State: AOJu0Yyon/9s9U0I/Vkm47EzgYF90YrI7W58n+hireMiExUeq40ew6up
	ur/5XkyOouhPN98JjVrQKC+bYLH6XNdqndFOhUsA0fgrC7PCmRGxnUNr/1+7JCkx72CsCx+4eUh
	D4hLq4lY65mVKaKLfzjd3FRt9BEw=
X-Google-Smtp-Source: AGHT+IHOD/qVjP74cwcaPb9AH3vCXXXPLx8qzk1Y6mjszbD4Yf1Rdx4oFVIt+pjia83lYkqaJWA1TysRkId7avhN3k8=
X-Received: by 2002:a05:651c:2110:b0:2f5:c4f:ddbe with SMTP id
 38308e7fff4ca-2f64446e056mr56640191fa.38.1725475082596; Wed, 04 Sep 2024
 11:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240904095205.739422-1-ubizjak@gmail.com> <CAAhV-H5WX7KXXpLkLm_4L-y5J-4fx-72uN+cvFGOZZh2NXUbHw@mail.gmail.com>
 <CAFULd4abR8Upu5UecVes-sEc9his2yWL7pg8hwKSJ+ORSNL5Ag@mail.gmail.com>
In-Reply-To: <CAFULd4abR8Upu5UecVes-sEc9his2yWL7pg8hwKSJ+ORSNL5Ag@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 4 Sep 2024 20:37:50 +0200
Message-ID: <CAFULd4aZcWcX5J==n7N_AQJre13Jeh6eJRK1eHmdSzRS3ZagCw@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch/percpu: Simplify _percpu_read() and _percpu_write()
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	WANG Xuerui <kernel@xen0n.name>, Xi Ruoyao <xry111@xry111.site>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 5:24=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wrot=
e:
>
> On Wed, Sep 4, 2024 at 5:02=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org=
> wrote:
> >
> > Hi, Uros,
> >
> > Thank you for your patch.
> >
> > On Wed, Sep 4, 2024 at 5:52=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> =
wrote:
> > >
> > > _percpu_read() and _percpu_write() macros call __percpu_read()
> > > and __percpu_write() static inline functions that result in a single
> > > assembly instruction. Percpu infrastructure expects its leaf
> > > definitions to encode the size of their percpu variable, so the patch
> > > merges asm clauses from the static inline function into the
> > > corresponding leaf macros.
> > It seems in some other places we prefer inline functions rather than
> > macros, but this patch is the opposite...
>
> Please note that these are leaf macros (functions), always used
> through the upper level macro (see e.g. the definition of
> raw_cpu_read() and __pcpu_size_call_return() in
> include/linux/percpu-defs.h). These upper level macros do type check
> on the pointer, so there is no need to do it again in the leaf macro.
> The percpu address space checks on x86 depend on the presence of these
> checks.
>
> > >
> > > The secondary effect of this change is to avoid explicit __percpu
> > > function arguments. Currently, __percpu macro is defined in
> > > include/linux/compiler_types.h, but with proposed patch [1],
> > > __percpu definition will need macros from include/asm-generic/percpu.=
h,
> > > creating forward dependency loop.
> > Macros don't check types, so use macros to drop "__percpu" checking?
> > Seems a little strange.
>
> As explained above, types are checked in the upper level macro (that
> uses these leaf macros) through __verify_pcpu_ptr(). These checks
> currently use sparse to check __percpu tag, but x86 will soon use the
> compiler infrastructure with much more powerful checks in this place.
>
> So, there is really no need to type check percpu pointer also in leaf fun=
ctions.

OTOH, you are right, we should also typecheck _val in case of
_percpu_write(). We need to add:

    if (0) {                                                \
        typeof(_var) pto_tmp__;                    \
        pto_tmp__ =3D (_val);                    \
        (void)pto_tmp__;                    \
    }                                \

to the _percpu_write() macro.

Let me test this amendment a bit, please expect the V3 patch tomorrow.

Thanks,
Uros.
