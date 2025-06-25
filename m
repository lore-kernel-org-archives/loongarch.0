Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310CC2609CD
	for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750855555; cv=none; b=sPo+OecZ2x0BBbb5gxcsX2fhLMi0YcwsDn1bqqLCedIfgWnBEldCoL/4PsN1xYgV1JP+i9f7hovORHtnagfH9/GmaesRE6Yi1BX35CW1c4n30Edb9+0zSSPRBDs4whvUnNK2OfplqXWdVvoW2B0ky+WslCVC2EDmpWg3ByJ9jrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750855555; c=relaxed/simple;
	bh=aeUHbst5u6uAyR1ycfeU07wkwThxzbqj2XsMrc/HWnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TGDQx2s8o9U76ExiU6VyG4ZZ/cbOsppqhBEuD7JFrq4CktUDlsK8bPIdiSIkD25KKgbQ/glJj7uzEyBFumesZ3FAvJwNDrBeVMBw+fdrbTEXf7wJ+VZC0nyW+JWXSQGN2HarWoxYjCz4ScX8LQl2STr01DU9+Ik94MlyyyGgzdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ae60cpB0; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ae60cpB0"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553bcba4ff8so6664325e87.2
        for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 05:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750855552; x=1751460352; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeUHbst5u6uAyR1ycfeU07wkwThxzbqj2XsMrc/HWnM=;
        b=Ae60cpB06fBDZPPZ6OgTkisARdMsyEV/P95OH2rct0dfcfdsd7mNmX+zDpqdpxJGgf
         2Vo/IzRU63I/i9CbLmNrwwo6o3B3SRydyqDmZrnh41uhQQDRNlItzOFOZNrAki6lJSUJ
         oDpplDA/ii/i1w207m41Ixqc2SrrNzB7y9bRFqQBjTifANPKltxDHYfzjMKKoqiZe9p7
         o+TC+zSqvOmWqpIhVucvlTY1+eZu9xwJU+zoli8DLpqvwUAq7LuNz2qcJZbvmwsYvhPO
         BG2VSgCelkMUU+1YcbjLqn19+MxxTEHELWDjkskrML1BHgc+wnq9UweVhzfNxhfCS/w5
         8shA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750855552; x=1751460352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeUHbst5u6uAyR1ycfeU07wkwThxzbqj2XsMrc/HWnM=;
        b=RLurzBm1jcuhfzuda9VJyTClBSxfJZkVMQMo7zHRNJW2AhmUex3n6lDcPvb9T0eI2Z
         iP4su6deWwb+VnQ2O78EZLsMizF6qS20PX6fe9i59z9/t8h5We1oDN/0H3+xOKEwnn7U
         WpFo2IhJDQbL6wYNyuAnA7a6pi4HrTG9xrcm+PGHW1HMl7ySpsrCHv/samxzRLsXQoGA
         868SiqUEn5vA7u0fePFW+YVfKh8F1nI7azIrghwghY2WKJZdpFjnk/aRGJlWRgXDpZ3T
         Qg9p1xrASvuzP7cgf0krAOg4hBAVRA9Hh+XhQFtZS5W00VV67mRTjvFKNW9IOnauxbeO
         793w==
X-Forwarded-Encrypted: i=1; AJvYcCVYIhhOQA/PXG3ahRMNDpPwbD2UPTFXr+1RckdJdQ6fOrxMFcBCD9M6QnfHOWcuaD7ksmNfNx9FYdE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwHQ8cujGlxpx63I8zifgEU0m/xs9TuLkfTvkL/GUlZFQTSt24
	nIiyWB+aJ/O8t49T/7SrEnOomJLt8zLM6BxU+uL1zlRhARszwgpMm6o15iU/Bgn9pLs/qY4iNFf
	0kbI32k5EyAqIFt3pihIWxXP+RSoYOM8=
X-Gm-Gg: ASbGncvATxZAkQ2108wdkDgor4pC3piPuN+EafJU6L5ntRTHCbhOeso96th78lQ87t3
	1WoSAl1pnStw3EN6qcRWW1SNU+xAPJC3wpRCldn4H/nRTXQ2lDmfUpbh5z+aJkFiM9g2wD43XVQ
	cLnyxoein9vShT1dtKN6HBgLavVcaoc4x7eWtE17epcQ==
X-Google-Smtp-Source: AGHT+IGd+VQCTiJwy9G1ykD/0Nzx0GAzsfPqUCVqghBLVmwOBzPwEbsyyeyH2J2LllM1nMa0CK079KR9Ekpv1ITEkm8=
X-Received: by 2002:a05:6512:1591:b0:553:abe6:e3e7 with SMTP id
 2adb3069b0e04-554fdf5cefbmr869898e87.47.1750855551832; Wed, 25 Jun 2025
 05:45:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250625095224.118679-1-snovitoll@gmail.com> <20250625095224.118679-10-snovitoll@gmail.com>
 <4d568111-9615-4fba-884a-f2ae629776fe@csgroup.eu>
In-Reply-To: <4d568111-9615-4fba-884a-f2ae629776fe@csgroup.eu>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Wed, 25 Jun 2025 17:45:34 +0500
X-Gm-Features: Ac12FXyn774raFC9M0P_m_Yp5o7tYNYYaJPlJbUzpj4u5O7z5JIOhc_ux4m2QSg
Message-ID: <CACzwLxgVj3YD5faPj=09Z9e4WSEe-sD7Sqn4jhaT7eiePaUUMw@mail.gmail.com>
Subject: Re: [PATCH 9/9] kasan/powerpc: call kasan_init_generic in kasan_init
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	dvyukov@google.com, vincenzo.frascino@arm.com, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, richard@nod.at, anton.ivanov@cambridgegreys.com, 
	johannes@sipsolutions.net, dave.hansen@linux.intel.com, luto@kernel.org, 
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

On Wed, Jun 25, 2025 at 3:33=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 25/06/2025 =C3=A0 11:52, Sabyrzhan Tasbolatov a =C3=A9crit :
> > Call kasan_init_generic() which enables the static flag
> > to mark generic KASAN initialized, otherwise it's an inline stub.
> > Also prints the banner from the single place.
>
> What about:
>
> arch/powerpc/mm/kasan/init_32.c:void __init kasan_init(void)
> arch/powerpc/mm/kasan/init_book3e_64.c:void __init kasan_init(void)

Thanks, I've missed them. Will add in v2.
I've also found out that I've missed:
arch/arm/mm/kasan_init.c
arch/riscv/mm/kasan_init.c

>
> Christophe
>
