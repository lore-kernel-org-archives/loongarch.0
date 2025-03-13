Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664E026AAA1
	for <loongarch@lists.linux.dev>; Thu, 13 Mar 2025 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741886093; cv=none; b=LdjAAbPAV0guTiTcSOm0s2aKSm+CTZ8rZKNCW1CRu3E460+dowQsHGrREKhJSqZ9N69j/FDchR1nioBaa9+RBIrBs9F6VnyC+IXiJJN6mHqxR4P8vJmq24IG9Q2rfB4CvMgmxGH77iCc36su2W3n7uEOtiAVc2TpO3pPiL3Mgag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741886093; c=relaxed/simple;
	bh=Z0R4Knirkvu+jEmc1w5aGtkeADSH26ueKwL0dPhNn7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BM/tE0g3MaCS6RewGv5gdUTOjmN4uyOM4Xn3ScEXIDqvLpTj+cQDUJPOUrXjC8EYbGCJ68o6KicdY5dJ3OPiA8iAzJLmo3YjKEworYwrXSoRf68AvijoLvfZP7upE+vIlcrnFXgqkaJGiQz5sLoHAXe2Zp7YA69GCrPC5sdXfKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5ikAhz7; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5ikAhz7"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-301493f461eso756319a91.3
        for <loongarch@lists.linux.dev>; Thu, 13 Mar 2025 10:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741886092; x=1742490892; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3DVX2jUUT8USovuBtaAWfLwoCZG/vTo0soqbEn/R/c=;
        b=T5ikAhz7dt9qtOTLME+fSGYYzKCWuzaF5b0e8u3JB+Yq0eIedA7OadmNJgZul4ymOw
         PiIwToaOXUt+Rz26nUPMwBEN2KEgkQ9ucRKW1lu8Q6dmJIU+fqwAcaGPM93W9sp4DEfj
         5Qn+K2jnfj31rseqQjc/0fEzUbW2KJJkVWkzXV4J6UjEnaB6yyO0F6MyAQf0J/RkMRs6
         D5fnPfk/p+poppxGTWziTCIROSRDtP499SNkudHzu77hhgse3z09neh+lm2Wmw2eZ6R7
         kK/nQsR63GRBeYMqod6dHC6tZmvGdbAj1TABmEiaNQu+ys2HqV3aa/DcV2lZH47Y+dNa
         3m0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741886092; x=1742490892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3DVX2jUUT8USovuBtaAWfLwoCZG/vTo0soqbEn/R/c=;
        b=dWKTvnBwFu5JBmcZ10QuM3TZsccjBlFYTDp/7BcpHBKRv80jG3xKD3jvfqjQ+TAvGs
         GLCaXjQdXWbKTPFE+BItE4g5O7Ncw9Ebz8PvXeP1RzKxtazHYAxUGUdy3syl2Uxu8lqZ
         j/5ovE3qdNKRKDIekoltHoywFPCOmfCyI8CcToU2FKKEam2PHCivvkaixlPtmhh4wwxw
         YgxvsG1zfOHc/JsKTHI7dr9ky3u876AqgXRvfVlrgBh3A883r6skFDa+J2xSrPXJ6Eyi
         Ww/691f7dXJLqZ2mM5u4pvnQWPkLArGArj1Yki19z2WbPsc91ZbcSSL/q7bRRvDa5E0K
         kz3g==
X-Forwarded-Encrypted: i=1; AJvYcCXbjq0jKEJ/6LWp2sh6Gojijbi4wWwiv5WYUQZD5XiO8Ph/M89OaxnRAFKz1WnGvfBaX+qTsARAw1Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQf77bJOiAz9K5lfw6PdJ39Vsdvi6kxKDJ25GAwNDB3DGUpK3a
	RrQUd/MvKpc51C324zycr/6AfOJktWO8CV5ViAdvUBox/h4Um7aZESXe5yVNiyX3TTbvc0Iprhv
	0Rgz3+TTOh7kdErHEdwK3fgBrwJA=
X-Gm-Gg: ASbGncsSDZP4kldomk4qQDzln9pPYY36Hjivlkl33YTBYdv3Ov9uIdJMrBxsC9E2RNC
	4gh+G5fdC8kM1uHwvGYpBIqxNCWPR92sWUrBLkl/N85ttIsTYU2T2R4Qrx89PF4RJ9iPEro449w
	d4tm5++08VSUxOq/e7iuXmbtCJ0yg=
X-Google-Smtp-Source: AGHT+IE1qRePjrPlGe/k7DXmrY+KtJaOvGWQ1A7tyU5eLBTz7VxuSMi4hxEC/EMElopjpnT6L0bRBsC6lDv+GByhQbc=
X-Received: by 2002:a17:90b:5608:b0:2fe:b8ba:62e1 with SMTP id
 98e67ed59e1d1-3014ea24aa4mr365923a91.28.1741886091572; Thu, 13 Mar 2025
 10:14:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250313135003.836600-1-rppt@kernel.org> <20250313135003.836600-9-rppt@kernel.org>
In-Reply-To: <20250313135003.836600-9-rppt@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 13 Mar 2025 20:14:39 +0300
X-Gm-Features: AQ5f1JpOtVR6fLnH8b4t6Wo35MeP6GXSndMXHGPmpker_QqVMpVf1FbK9Hm_3_Y
Message-ID: <CAMo8Bf+_8QdcWmk-k6dpUUnvVtVsYCgcviK+fF=CsKjT3nFxHg@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] xtensa: split out printing of virtual memory
 layout to a function
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Mark Brown <broonie@kernel.org>, Matt Turner <mattst88@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 4:52=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> This will help with pulling out memblock_free_all() to the generic
> code and reducing code duplication in arch::mem_init().
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/xtensa/mm/init.c | 97 ++++++++++++++++++++++---------------------
>  1 file changed, 50 insertions(+), 47 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
