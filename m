Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1A225B30D
	for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750855867; cv=none; b=aMIyUMZEZoRTOLSHsB3cQKybskpT7ILSNcfqm3DGA8Bfn4+rWbcbsDmgD7lpwkOJmDpMqS13VjMKzYL+oGmWybJmCOiMu70g/Fesw8cgPfZoeNeAuwLS1+yp6tOzFaCp2nDgXTO4HDj+Ec6wNCI8Lq/eEdd6Dx9E2etQ0Te9vbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750855867; c=relaxed/simple;
	bh=CRwRhM1MtMEUcOGQgquJfle4LDepcccXWla+ZKxsdwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jwaLVQdzNktI9jxw4zSlN1ssmyfwEVLDTp+vu9rxeHWi2rmC6uold47bGSXwLcaW0lfRraDEItjhpz/zF9MqgpsUhnpimE+nrf/BRTZqfyOuhkQqwlCiSdgq/VkJw1sfV5dG/zEh8tLxq5rb8DSEPKNakH5WPPtnNXkPwETRLCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHfv7kpM; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHfv7kpM"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553b544e7b4so6815021e87.3
        for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 05:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750855864; x=1751460664; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRwRhM1MtMEUcOGQgquJfle4LDepcccXWla+ZKxsdwI=;
        b=bHfv7kpMHNosFfNa8tBjhzhtAsx2decO8samIqKuV51dse86E+ax3MRXXTq7aP4gcO
         QSSyBG5ZnfQVsGkERWYwA3k599NCXqKWzzOgO2kE8uEHdP9hbMkb5GFhcqGwpY6qfy01
         2mt8KeVWk/M7+bU8eZHO6SG7xDrg6NWwE2E0/WQO3Xk1RQHfwtaC+LSEAtvbJlBmuGQK
         F7xwSWMCLGiZ8nb+9iI66kVQYqIH3//cR+kIU7kHPc1CMUnU/YbaqbcflKA0erwyQKCC
         75najJaiSjF5FIGP8T0xcm3qIx5PGlVszp21NIJMLNOzGp6IFCj/7iaUObssrnh949vQ
         VKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750855864; x=1751460664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRwRhM1MtMEUcOGQgquJfle4LDepcccXWla+ZKxsdwI=;
        b=OMYNwY7QwSErNuyits/iVeBj1QDJd+Agh8Hjfha3ggepkJVmzJGQ+jgZULEX0kGKAg
         eCxePGnqB0QTtFb/wIFi9QxMvcq1eOAMABl8G3GwSU19Opfv8yUHyHzje3kFVnC225pi
         DLqFKE2zr16zC2RmuZB55cH6GB8y7h3bfe6yhVvBfmApi4iDVlHYZPE1lrNlxtvvQVgm
         vK2Q+ggVJoZCSBtwcvbP/DNVvXM0iezRHwQsv6TNHgzISEFU4VWf6o9i6fYszppG9uV/
         ccDUWJ6aAHMmrMHsDPfAA035wtqV/ymAy2T7rXmK7yKHRHdnY0ST5Dc84QEZ/aPo7w2C
         ZiSA==
X-Forwarded-Encrypted: i=1; AJvYcCV77jtc6MRW03Hnv0ESSwwmM9NIlh4tBH0a7/Ws1cB4KrXDETIXRl1NJc1TptZ9D7n/V0VvJtZf5zs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqO0DPqjna8ndKQ2UtisdaF0Gy25Rc8sh9i+RV5VB0IfbVkPjv
	bO/MLBsjhFItkLxHeyi3c+jm/lozT1YoTKCwZppcDHiC5udxaQVLr8Bcyk0J2EeBFl2iWic1eRK
	Db//oneEgRsMomJXxQlS3+dCdddXScpA=
X-Gm-Gg: ASbGncumk3cecDykE0py+1y3J1ClwnRBhBUwd5F/oRsUXodbIg8DAXPdcz+k9QSiCHU
	XqnLoAsOQQI9giwyKAeZkvN6bb63me/hyPLqk14sQ21j2+uDScfwvCLPlSAqEjOxcxtMLX7esQu
	twVESm9qOUmHBKVO+H3+NEXI+VMJ8dKpvJBv9QQy5Afw==
X-Google-Smtp-Source: AGHT+IH4AdTi7obPWXsCps0Kqqd3RJ5D/he3Lezfcy1G4Eg5fA0HGJmj1VDSyHt6qyIqHAybfxlMpWZQjVgI2Xx3Mto=
X-Received: by 2002:a05:6512:4011:b0:553:297b:3d45 with SMTP id
 2adb3069b0e04-554fde58124mr1020525e87.43.1750855863865; Wed, 25 Jun 2025
 05:51:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250625095224.118679-1-snovitoll@gmail.com> <20250625095224.118679-3-snovitoll@gmail.com>
 <750b6617-7abf-4adc-b3e6-6194ff10c547@csgroup.eu> <81a8b60be5b99ecd9b322d188738016376aff4aa.camel@sipsolutions.net>
In-Reply-To: <81a8b60be5b99ecd9b322d188738016376aff4aa.camel@sipsolutions.net>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Wed, 25 Jun 2025 17:50:46 +0500
X-Gm-Features: Ac12FXwt1iee6Yaba3PMavifTn-RFaMv0HhE7s3qnJv0p52DgpRl1n7RcMDkzZs
Message-ID: <CACzwLxgCH6KuVDRS3d9MrmA=wY_rMA6R5TPB_v37BkD8-A9yuw@mail.gmail.com>
Subject: Re: [PATCH 2/9] kasan: replace kasan_arch_is_ready with kasan_enabled
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, ryabinin.a.a@gmail.com, glider@google.com, 
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, dave.hansen@linux.intel.com, luto@kernel.org, 
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	x86@kernel.org, hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, geert@linux-m68k.org, 
	rppt@kernel.org, tiwei.btw@antgroup.com, richard.weiyang@gmail.com, 
	benjamin.berg@intel.com, kevin.brodsky@arm.com, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 5:24=E2=80=AFPM Johannes Berg <johannes@sipsolution=
s.net> wrote:
>
> On Wed, 2025-06-25 at 12:27 +0200, Christophe Leroy wrote:
> >
> > Le 25/06/2025 =C3=A0 11:52, Sabyrzhan Tasbolatov a =C3=A9crit :
> > > Replace the existing kasan_arch_is_ready() calls with kasan_enabled()=
.
> > > Drop checks where the caller is already under kasan_enabled() conditi=
on.
> >
> > If I understand correctly, it means that KASAN won't work anymore
> > between patch 2 and 9, because until the arch calls kasan_init_generic(=
)
> > kasan_enabled() will return false.
> >
> > The transition should be smooth and your series should remain bisectabl=
e.
> >
> > Or am I missing something ?
> >
>
> Seems right to me, it won't work for architectures that define
> kasan_arch_is_ready themselves I think?
>
> But since they have to literally #define it, could #ifdef on that
> temporarily?

Thanks for catching it. You're right. I need to change the order of patches=
 :

- kasan: unify static kasan_flag_enabled across modes

, then we should apply arch specific changes
where we call kasan_init_generic in kasan_init.

- kasan: replace kasan_arch_is_ready with kasan_enabled

>
> johannes
